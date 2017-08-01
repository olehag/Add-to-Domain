#Lord Hagen / olehag04@nfk.no

#DOMAIN, example: 'google.local'.
$Domain = ""
#A DC in the Domain, example: 'dc1.google.local'.
$DomainDC = ""
#OU path, example: 'OU=Machine, OU=SalesTeam, DC=google, DC=local'.
$OUPath = ""


#Print ComputerName.
Write-Host ""
Write-Host ""
Write-Host "`tComputername: " -NoNewline -ForegroundColor Yellow
$env:computername

Write-Host ""
Write-Host ""

#Test if computer can reach the DC. If it can't, Exit.
if (Test-Connection $DomainDC -Quiet)
    {
        Write-Host "`tReady to continue!" -ForegroundColor Green
    }
else 
    {
        Write-Host "`tCan't reach the Domain!" -ForegroundColor Red
        Start-Sleep -Seconds 3
        Exit
    }

Start-Sleep -s 3
Write-Host ""
Write-Host ""

Write-Host "`tPress any button to continue..." -ForegroundColor Yellow

$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Write-Host ""
Write-Host ""

Write-Host "`tAuthenticate with admin credentials!"

add-computer -domainname $Domain -oupath $OUPath -Credential get-credential

Write-Host "`tPress any button to exit..." -ForegroundColor Yellow

$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
