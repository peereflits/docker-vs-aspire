using FrontEnd.Services;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;

namespace FrontEnd;

public class Program
{
    public static async Task Main(string[] args)
    {
        WebAssemblyHostBuilder builder = WebAssemblyHostBuilder.CreateDefault(args);
        builder.RootComponents.Add<App>("#app");
        builder.RootComponents.Add<HeadOutlet>("head::after");
        
        var baseUrl = GetBaseUrl(builder.HostEnvironment.BaseAddress);

        builder.Services.AddScoped(sp => new HttpClient { BaseAddress = baseUrl });
        builder.Services.AddHttpClient<LanguageService>("LanguageServiceClient",  configureClient => configureClient.BaseAddress = baseUrl);
        builder.Services.AddHttpClient<WeatherService>("WeatherServiceClient",  configureClient => configureClient.BaseAddress = baseUrl);
        builder.Services
            .AddScoped<ILanguageService, LanguageService>()
            .AddScoped<IWeatherService, WeatherService>();

        
        await builder.Build().RunAsync();
    }

    private static Uri GetBaseUrl(string currentBaseAddress)
    {
        return currentBaseAddress switch
        {
            "http://localhost:5002/" => new Uri("http://localhost:5000"),
            _ => throw new ApplicationException($"Unsupported base address: {currentBaseAddress}")
        };
    }
}