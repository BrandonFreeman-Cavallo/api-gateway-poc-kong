using System;

namespace Client.Models;

public class AuthResponseModel
{
    public string AccessToken { get; set; }
    public string TokenType { get; set; }
    public string IdToken { get; set; }
    public DateTime ExpiresAt { get; set; }
}