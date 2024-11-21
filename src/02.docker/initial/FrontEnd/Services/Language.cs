namespace FrontEnd.Services;

public class Language
{
    public string Code { get; init; } = null!;
    public string Culture { get; init; } = null!;
    public string Prefix { get; init; } = null!;
    public string EnglishName { get; init; } = null!;
    public string NativeName { get; init; } = null!;
    public bool IsRightToLeft  { get; init; }
    public string Direction  { get; init; } = null!;
    public bool IsAudioEnabled { get; init; }
}