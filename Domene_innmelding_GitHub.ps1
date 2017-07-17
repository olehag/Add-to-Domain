#Lord Hagen / olehag04@nfk.no

Write-Host ""
Write-Host ""
Write-Host "`tDatamaskinnavn: " -NoNewline -ForegroundColor Yellow
$env:computername

Write-Host ""
Write-Host ""

if (Test-Connection 'DOMENEKONTROLLEREN. EG: testdc.evry.local' -Quiet)
    {
        Write-Host "`tKlar til innmelding!" -ForegroundColor Green
    }
else 
    {
        Write-Host "`tMå kobles til nettverket med Kabel!" -ForegroundColor Yellow
    }

Start-Sleep -s 2
Write-Host ""
Write-Host ""

Write-Host "`tTrykk på en knapp for å fortsette..." -ForegroundColor Yellow

$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Write-Host ""
Write-Host ""

Write-Host "`tAutentiser med Passord!"
                                                                                                    
add-computer -domainname 'DOMENE' -oupath 'STI TIL OU' -Credential get-credential 'DOMENE'\

Write-Host "`tTrykk på en knapp for å avslutte..." -ForegroundColor Yellow

$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")