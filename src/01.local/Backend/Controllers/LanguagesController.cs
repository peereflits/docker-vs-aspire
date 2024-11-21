using Backend.Services;
using Microsoft.AspNetCore.Mvc;

namespace Backend.Controllers;

[Route("api/[controller]")]
[ApiController]
public class LanguagesController
(
    IHandleGetLanguages getLanguagesHandler,
    ILogger<LanguagesController> logger
) : ControllerBase
{
    [HttpGet("", Name = "GetLanguages")]
    public async Task<IEnumerable<Language>> GetLanguages()
    {
        logger.LogInformation("Executing {action}", nameof(GetLanguages));
        var result = await getLanguagesHandler.Execute();
        logger.LogInformation("Executed {action}", nameof(GetLanguages));

        return result;
    }
}