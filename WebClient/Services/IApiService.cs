
using Client.Models;

namespace SampleMvcApp.Services
{
    public interface IApiService
    {
        public string MakeRequest(AuthResponseModel authResponse);
       
    }
}
