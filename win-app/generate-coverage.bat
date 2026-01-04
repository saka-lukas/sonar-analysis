@echo off
setlocal

REM Run specific .NET test with code coverage
dotnet test src\Common\ProtonVPN.Common.Core.Tests\ProtonVPN.Common.Core.Tests.csproj ^
  --filter "FullyQualifiedName~ProtonVPN.Common.Core.Tests.Extensions.StringExtensionsTest.TestUrlValidation" ^
  --collect:"XPlat Code Coverage" ^
  --results-directory ./coverage

REM Generate HTML coverage report
reportgenerator ^
  -reports:./coverage/**/coverage.cobertura.xml ^
  -targetdir:./coverage/coverage-report ^
  -reporttypes:Html

endlocal