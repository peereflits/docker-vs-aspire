namespace Backend.Services;

public interface IHandleGetLanguages
{
    Task<IEnumerable<Language>> Execute();
}