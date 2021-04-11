Источник: https://jdhitsolutions.com/blog/powershell/7621/doing-more-with-windows-sandbox/
Требования для запуска песочницы:
Сборка Windows должна быть от 2004
Включенная виртуализация в BIOS

Проверить наличие песочницы:
Get-WindowsOptionalFeature -online -FeatureName Containers-DisposableClientVM

При необходимости включаем и перезагружаемся
Enable-WindowsOptionalFeature -Online -FeatureName Containers-DisposableClientVM

Все необходимые файлы копируем в каталог "C:\Distr\Scripts\WindowsSandbox"

Описание файлов:
папка Start-WindowsSandbox	- модуль PowerShell для удобного и быстрого запуска песочницы
WinSandBx.wsb				- конфигурационный файл песочницы
sandbox-setup.cmd			- первый скрипт, который запускается при старте песочницы (прописан в конфигурационном файле песочницы)
sandbox-config.ps1			- второй скрипт, который делает основные настройки (прописан в sandbox-setup.cmd)
install-vscodesandbox.ps1	- дополнительный скрипт, который скачивает, устанавливает и настраивает VS Code.