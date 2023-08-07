using System.Collections.Generic;
using SampleMvcApp.Models;

namespace SampleMvcApp.ViewModels
{
    public class UserProfileViewModel
    {
        public string EmailAddress { get; set; }

        public string Name { get; set; }

        public string ProfileImage { get; set; }

        public ICollection<Forecast> Forecast { get; set; }

        public Dictionary<string, string> Claims { get; set; }
    }
}
