#Enable-PSRemoting -force -SkipNetworkProfileCheck

Install-PackageProvider -name nuget -force -forcebootstrap -scope allusers

#вручную обновляем модуль PowerShellGet
Save-Module -Name PowerShellGet -Path C:\Temp -Repository PSGallery
'PowerShellGet', 'PackageManagement' | ForEach-Object {
  $targetDir = "$env:ProgramFiles\WindowsPowerShell\Modules\$_"
  Remove-Item $targetDir\* -Recurse -Force
  Copy-Item C:\Temp\$_\*\* $targetDir\ -Recurse -Force
}

#запускаем задания, чтобы настройка прошла быстрее
Start-Job {Install-Module BurntToast -force}
Start-Job -FilePath C:\Distr\Scripts\WindowsSandbox\install-vscodesandbox.ps1

#ожидаем окончание всех заданий
Get-Job | Wait-Job

#оповещение об окончании настройки песочницы
$params = @{
    Text = "Братан, песочница готова!"
    Header = $(New-BTHeader -Id 1 -Title "Сашкина песочница")
    #Applogo = "C:\Distr\Scripts\WindowsSandbox\gazoo.bmp"
}
New-BurntToastNotification @params