using RestSharp;
using SampleMvcApp.Models;

namespace SampleMvcApp.Services
{
    public class ApiService : IApiService
    {
        public string MakeRequest(AuthResponseModel authResponse)
        {
            var client = new RestClient(new RestClientOptions());

            RestRequest loginRequest = new RestRequest("http://path_to_your_api/", Method.Get);
            loginRequest.AddHeader("authorization", $"{authResponse.TokenType} {authResponse.AccessToken}");
            RestResponse loginResponse = client.Execute(loginRequest);

            return string.Empty;
        }
    }
}

