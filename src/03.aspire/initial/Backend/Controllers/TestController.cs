using System.Data.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace Backend.Controllers;

[Route("api/[controller]")]
[ApiController]
public class TestController(
    IConfiguration configuration,
    ILogger<TestController> logger
) : ControllerBase
{
    [HttpGet("ping", Name = "ping")]
    public string Ping()
    {
        return "Pong";
    }

    [HttpPost("database", Name = "TestDatabase")]
    public async Task<string> TestDatabase(string? serverName)
    {
        try
        {
            var builder = new SqlConnectionStringBuilder(configuration["ConnectionStrings:Default"]);

            if (!string.IsNullOrWhiteSpace(serverName))
            {
                builder.DataSource = serverName;
            }

            await using var con = new SqlConnection(builder.ToString());
            await con.OpenAsync();
            await con.CloseAsync();

            return "Pong";
        }
        catch (DbException ex)
        {
            logger.LogError(ex, "Error connecting to database");
            return $"Error connecting to database: {ex.GetType().Name}\r\n{ex.Message}";
        }
    }
}