using Microsoft.AspNetCore.Mvc;

namespace HttpTest.Docker.Controllers;

[ApiController]
[Route("[controller]")]
public class ApiController : ControllerBase
{
    private readonly ILogger<ApiController> _logger;

    public ApiController(ILogger<ApiController> logger)
    {
        _logger = logger;
    }

    [Route("{**route}")]
    public String Index(string route)
    {
        return Url.RouteUrl(RouteData.Values) ?? "Unknown";
    }
}
