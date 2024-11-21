using System.Net.Http.Json;

namespace FrontEnd.Services;

public interface ILanguageService
{
    Task<Language[]> GetLanguagesAsync();
}

public class LanguageService(HttpClient http) : ILanguageService
{
    public async Task<Language[]> GetLanguagesAsync()
    {
        return await http.GetFromJsonAsync<Language[]>("/api/languages") ?? [];
    }
}
