REM sandbox-setup.cmd
REM Этот код написан для работы с песочницей Windows

REM Создаем папку для временных файлов
mkdir c:\Temp

REM Разрешаем запуск скриптов PowerShell
powershell.exe -command "&{Set-ExecutionPolicy RemoteSigned -force}"

REM Запускаем скрипт настройки песочницы
powershell.exe -file C:\Distr\Scripts\WindowsSandbox\sandbox-config.ps1