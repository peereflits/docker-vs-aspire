using System.Net.Http.Json;

namespace FrontEnd.Services;

public interface IWeatherService
{
    Task< WeatherForecast[]> GetWeatherForecast();
}

public class WeatherForecast
{
    public DateOnly Date { get; set; }

    public int TemperatureC { get; set; }

    public string? Summary { get; set; }

    public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
}


internal class WeatherService: IWeatherService
{
    private readonly HttpClient httpClient;

    public WeatherService(HttpClient httpClient)
    {
        this.httpClient = httpClient;
    }

    public async Task< WeatherForecast[]> GetWeatherForecast()
    {
        return await httpClient.GetFromJsonAsync<WeatherForecast[]>("/WeatherForecast") ?? [];
    }
}