SET NOCOUNT ON;
GO
-- ------------------------------------------------------------------
-- Creates the DxtTestDb database if it doesn't exists       --
-- ------------------------------------------------------------------
IF DB_ID(N'DxtTestDb') IS NOT NULL
BEGIN

  DECLARE @Sql1 nvarchar(1000) = N'
EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N''DxtTestDb'';
ALTER DATABASE [DxtTestDb] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE DxtTestDb;
';
  EXEC(@Sql1);
END;

EXEC sp_configure 'contained database authentication', 1;
GO
RECONFIGURE
GO

CREATE DATABASE DxtTestDb
  CONTAINMENT = PARTIAL
  COLLATE SQL_Latin1_General_CP1_CI_AS
  WITH DEFAULT_LANGUAGE = english;

DECLARE @Sql2 nvarchar(2000) = N'ALTER AUTHORIZATION ON database::[DxtTestDb] TO ' + QUOTENAME(SYSTEM_USER);
EXECUTE(@Sql2);

GO

USE DxtTestDb;
GO

CREATE USER DxtTestDbReader WITH PASSWORD = N'DxtTestDbR003$', DEFAULT_SCHEMA=[dbo];
GRANT CONNECT TO [DxtTestDbReader];
ALTER ROLE [db_datareader]     ADD MEMBER [DxtTestDbReader];
ALTER ROLE [db_denydatawriter] ADD MEMBER [DxtTestDbReader];

GO

CREATE TABLE dbo.Languages
( Id             char(3)      NOT NULL             -- The identifier of the language
, Code2          char(2)      NOT NULL             -- The 2-letter identifying ISO code for the supported language
, Code3          char(3)      NOT NULL             -- The 3-letter identifying ISO code for the supported language
, Code5          varchar(12)  NOT NULL             -- The .Net localization code for the supported language 
                                                   -- in the format of xx-XX. See: CultureInfo Class @ https://docs.microsoft.com/en-us/dotnet/api/system.globalization.cultureinfo?view=netframework-4.7.2
, EnglishName    nvarchar(36) NOT NULL             -- The language name in English
, NativeName     nvarchar(36) NOT NULL             -- The native language name
, CONSTRAINT PK_Languages_Prefix PRIMARY KEY (Id)
);
GO

CREATE INDEX DboLanguagesCode2Index ON dbo.Languages(Code2);
GO
CREATE INDEX DboLanguagesCode3Index ON dbo.Languages(Code3);
GO
CREATE INDEX DboLanguagesCode5Index ON dbo.Languages(Code5);
GO

INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Eng', 'en', 'eng', 'en-US'     , N'English'                 , N'English');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Nld', 'nl', 'nld', 'nl-NL'     , N'Dutch'                   , N'Nederlands');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Esp', 'es', 'spa', 'es-ES'     , N'Spanish (Europe)'        , N'Español (Europa)');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Spa', 'es', 'spa', 'es-US'     , N'Spanish (v. 1993)'       , N'Español (v. 1993)');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Spi', 'es', 'spa', 'es-US'     , N'Spanish (International)' , N'Español (Internacional)');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Fre', 'fr', 'fre', 'fr-FR'     , N'French'                  , N'Français');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Ger', 'de', 'ger', 'de-DE'     , N'German'                  , N'Deutsch');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Pol', 'pl', 'pol', 'pl-PL'     , N'Polish'                  , N'Polski');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Rus', 'ru', 'rus', 'ru-RU'     , N'Russian'                 , N'Pусский');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Por', 'pt', 'por', 'pt-PT'     , N'Portuguese'              , N'Português');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Hun', 'hu', 'hun', 'hu-HU'     , N'Hungarian'               , N'Magyar');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Rou', 'ro', 'ron', 'ro-RO'     , N'Romanian'                , N'Română');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Bul', 'bg', 'bul', 'bg-BG'     , N'Bulgarian'               , N'Български');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Ita', 'it', 'ita', 'it-IT'     , N'Italian'                 , N'Italiano');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Dan', 'da', 'dan', 'da-DA'     , N'Danish'                  , N'Dansk');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Est', 'et', 'est', 'et-EE'     , N'Estonian'                , N'Eesti');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Lit', 'lt', 'lit', 'lt-LT'     , N'Lithuanian'              , N'Lietuvių');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Swe', 'sv', 'swe', 'sv-FI'     , N'Swedish'                 , N'Svenska');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Fin', 'fi', 'fin', 'fi-FI'     , N'Finnish'                 , N'Suomi');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Cze', 'cs', 'ces', 'cs-CZ'     , N'Czech'                   , N'Čeština');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Ind', 'id', 'ind', 'id-ID'     , N'Indonesian'              , N'Indonesian');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Tur', 'tr', 'tur', 'tr-TR'     , N'Turkish'                 , N'Türkçe');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Ara', 'ar', 'ara', 'ar-EG'     , N'Arabic'                  , N'عربي');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Zh1', 'zh', 'zho', 'zh-Hans-CN', N'Chinese (Simplified)'    , N'中文（简体）');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Kor', 'ko', 'kor', 'ko-KR'     , N'Korean'                  , N'한국어');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Heb', 'he', 'heb', 'he-IL'     , N'Hebrew'                  , N'עברית');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('zh2', 'zh', 'zho', 'zh-Hant-CN', N'Chinese (Traditional)'  , N'中国传统的');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Fas', 'fa', 'fas', 'fa-IR'     , N'Farsi'                  , N'فارسی');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Ell', 'el', 'ell', 'el-GR'     , N'Greek'                  , N'Ελληνικά');
INSERT INTO dbo.Languages(Id, Code2, Code3, Code5, EnglishName, NativeName) VALUES ('Jpn', 'ja', 'jpn', 'ja-JP'     , N'Japanese'               , N'日本語');

GO
