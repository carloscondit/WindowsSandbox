Function Start-WindowsSandbox {
    [cmdletbinding()]
    [alias("wsb")]
    Param(
        [Parameter(ParameterSetName = "config")]
        [ValidateScript({Test-Path $_})]
        [string]$Configuration
    )

    Write-Verbose "Стартуем $($myinvocation.mycommand)"

    if ($Configuration) {
        Write-Verbose "Запускаем песочницу с конфигурационным файлом $Configuration"
        c:\windows\system32\WindowsSandbox.exe
    }
    else {
        Write-Verbose "Запускаем стоковую песочницу"
        Invoke-Item $Configuration
    }

    Write-Verbose "Конец работы $($myinvocation.mycommand)"
}    