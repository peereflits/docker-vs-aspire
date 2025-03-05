# Docker versus Aspire

This repo contains sample code that demonstrates sample applications running under Docker and .NET Aspire.

The sample code is build around an application that holds a Blazor WASM frontend and a .NET Core Backend API that relies on a SQL Server database.

There are three different projects:
* [local](./src/Readme.01.local.md): the initial stand-alone solution/application that runs in a local configuration (it works on my machine :smile:). No Docker. No Aspire. Just on your machine.
* [docker](./src/Readme.02.docker.md): the solution that runs on docker locally on Docker Desktop.
* [aspire](./src/Readme.03.aspire.md): the solution that runs with .NET Aspire

Both `docker` and `aspire` have an *initial* solution (a copy of the initial stand-alone solution) with some blank files or projects to be filled in by you; the *final* solution hold a working implementation. 

## Links

* .NET Aspire overview<br/>
https://learn.microsoft.com/en-us/dotnet/aspire/get-started/aspire-overview

* .NET Aspire documentation<br/>
https://learn.microsoft.com/en-us/dotnet/aspire/

* Adding .NET Aspire to your existing .NET apps<br/>
https://devblogs.microsoft.com/dotnet/adding-dotnet-aspire-to-your-existing-dotnet-apps/

* .NET Aspire Learning Tutorials<br/>
https://learn.microsoft.com/en-us/collections/2203hjxnnrop11?sharingId=BB94A7F34409BD5E

* Azure Developers .NET Aspire Day 2024 (playlist)<br/>
https://www.youtube.com/playlist?list=PLI7iePan8aH70Ref8ac9oB3D4F3CQ-mhO

* Azure Developers .NET Aspire Day (Official Collection)<br/>
https://learn.microsoft.com/en-us/collections/gxo6hn8oxmn24j

* .NET Aspire Developers Day (8.1)<br/>
https://www.youtube.com/playlist?list=PLdo4fOcmZ0oWMbEO7CiaDZh6cqSTU_lzJ

* Getting started with testing and .NET Aspire<br/>
https://devblogs.microsoft.com/dotnet/getting-started-with-testing-and-dotnet-aspire/

