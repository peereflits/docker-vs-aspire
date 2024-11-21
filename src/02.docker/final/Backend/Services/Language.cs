using System.Globalization;

namespace Backend.Services;

public class Language
{
    public string Id { get; init; } = null!;
    public string Code { get; init; } = null!;
    public string Culture { get; init; } = null!;
    public string EnglishName { get; init; } = null!;
    public string NativeName { get; init; } = null!;
    public bool IsRightToLeft => CultureInfo.GetCultureInfo(Code).TextInfo.IsRightToLeft;
}