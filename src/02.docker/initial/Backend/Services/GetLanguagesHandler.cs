namespace Backend.Services;

internal class GetLanguagesHandler(IServiceGetLanguages service) : IHandleGetLanguages
{
    public async Task<IEnumerable<Language>> Execute() => await service.Execute();
}