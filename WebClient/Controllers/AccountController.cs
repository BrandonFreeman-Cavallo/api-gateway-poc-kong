using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using SampleMvcApp.ViewModels;
using System.Linq;
using System.Security.Claims;
using Auth0.AspNetCore.Authentication;
using System;
using System.Globalization;
using SampleMvcApp.Models;
using RestSharp;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace SampleMvcApp.Controllers
{
    public class AccountController : Controller
    {
        public async Task Login(string returnUrl = "/")
        {
            var authenticationProperties = new LoginAuthenticationPropertiesBuilder()
                .WithRedirectUri(returnUrl)
                .Build();

            await HttpContext.ChallengeAsync(Auth0Constants.AuthenticationScheme, authenticationProperties);
        }

        [Authorize]
        public async Task Logout()
        {
            var authenticationProperties = new LogoutAuthenticationPropertiesBuilder()
                // Indicate here where Auth0 should redirect the user after a logout.
                // Note that the resulting absolute Uri must be whitelisted in 
                .WithRedirectUri(Url.Action("Index", "Home"))
                .Build();

            await HttpContext.SignOutAsync(Auth0Constants.AuthenticationScheme, authenticationProperties);
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
        }

        [Authorize]
        public async Task<IActionResult> ProfileAsync()
        {
            AuthResponseModel authResponse = await GetAuthResponse();

            string result = $"We have a token: { (!string.IsNullOrWhiteSpace(authResponse?.IdToken) ? "Yes" : "No") }";

            RestClient client = new RestClient();
            RestRequest request = new RestRequest("http://kong:8000/org/weatherforecast", Method.Get);
            request.AddHeader("authorization", $"Bearer {authResponse?.IdToken ?? ""}");
            request.AddHeader("something", $"meow");
            RestResponse response = client.Execute(request);

            List<Forecast> forecast = new List<Forecast>();

            if (response.StatusCode == System.Net.HttpStatusCode.OK)
            {
                forecast = JsonConvert.DeserializeObject<List<Forecast>>(response.Content.ToString());
            }

            return View(new UserProfileViewModel()
            {
                Name = User.Identity.Name,
                EmailAddress = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Email)?.Value,
                ProfileImage = User.Claims.FirstOrDefault(c => c.Type == "picture")?.Value,
                Forecast = forecast
            });
        }


        /// <summary>
        /// This is just a helper action to enable you to easily see all claims related to a user. It helps when debugging your
        /// application to see the in claims populated from the Auth0 ID Token
        /// </summary>
        /// <returns></returns>
        [Authorize]
        public IActionResult Claims()
        {
            return View();
        }

        public IActionResult AccessDenied()
        {
            return View();
        }

        private async Task<AuthResponseModel> GetAuthResponse()
        {
            if (!User.Identity.IsAuthenticated)
            {
                return null;
            }

            AuthResponseModel response = new()
            {
                AccessToken = await HttpContext.GetTokenAsync("access_token"),
                IdToken = await HttpContext.GetTokenAsync("id_token"),
            };

            DateTime.TryParse(
                await HttpContext.GetTokenAsync("expires_at"),
                CultureInfo.InvariantCulture,
                DateTimeStyles.RoundtripKind,
                out DateTime accessTokenExpiresAt);

            response.ExpiresAt = accessTokenExpiresAt;
                
            return response;
        }
    }
}
