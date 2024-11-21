using Dapper;
using Microsoft.Data.SqlClient;

namespace Backend.Services;

internal interface IServiceGetLanguages
{
    Task<IEnumerable<Language>> Execute();
}

internal class GetLanguagesService : IServiceGetLanguages
{
    private readonly IConfiguration configuration;
    private readonly List<Language> languages = new();

    public GetLanguagesService(IConfiguration configuration)
    {
        this.configuration = configuration;
    }

    public async Task<IEnumerable<Language>> Execute()
    {
        if (!languages.Any())
        {
            languages.AddRange(await GetLanguagesFromDb());
        }

        return languages;
    }

    private async Task<IEnumerable<Language>> GetLanguagesFromDb()
    {
        await using var con = new SqlConnection(configuration["ConnectionStrings:Default"]);
        IEnumerable<Language> result = await con.QueryAsync<Language>(GetCommand());
        
        return result.ToList();
    }

    private static string GetCommand()
    {
        return @$"
  SELECT t.Id             AS [{nameof(Language.Id)}]
       , t.Code2          AS [{nameof(Language.Code)}]
       , t.Code5          AS [{nameof(Language.Culture)}]
       , t.NativeName     AS [{nameof(Language.NativeName)}]
       , t.EnglishName    AS [{nameof(Language.EnglishName)}]
    FROM dbo.Languages t
ORDER BY t.NativeName;";
    }
}