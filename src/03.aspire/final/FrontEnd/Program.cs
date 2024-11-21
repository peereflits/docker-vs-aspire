using FrontEnd.Services;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;

namespace FrontEnd;

public class Program
{
    private const int BackendServerPortNumber = 5001; // See Backend/Program.cs
    public static async Task Main(string[] args)
    {
        WebAssemblyHostBuilder builder = WebAssemblyHostBuilder.CreateDefault(args);
        builder.RootComponents.Add<App>("#app");
        builder.RootComponents.Add<HeadOutlet>("head::after");
        
        var baseUrl = new Uri($"https://localhost:{BackendServerPortNumber}");

        builder.Services.AddScoped(sp => new HttpClient { BaseAddress = baseUrl });
        builder.Services.AddHttpClient<LanguageService>("LanguageServiceClient",  configureClient => configureClient.BaseAddress = baseUrl);
        builder.Services.AddHttpClient<WeatherService>("WeatherServiceClient",  configureClient => configureClient.BaseAddress = baseUrl);
        builder.Services
            .AddScoped<ILanguageService, LanguageService>()
            .AddScoped<IWeatherService, WeatherService>();

        
        await builder.Build().RunAsync();
    }
}