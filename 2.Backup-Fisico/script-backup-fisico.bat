@echo off
:: Verifica si se ha proporcionado una ruta como parámetro
if "%1"=="" (
    echo Debes proporcionar una ruta donde se almacenará el backup.
    echo Ejemplo: script-backup-fisico.bat C:\Backups
    exit /b 1
)

:: Ruta proporcionada como parámetro
set "backup_dir=%1"

:: Verifica si la ruta proporcionada existe
if not exist "%backup_dir%" (
    echo La ruta %backup_dir% no existe.
    exit /b 1
)

:: Obtener la fecha en formato YYYY-MM-DD
for /f "tokens=2-4 delims=/- " %%a in ('date /t') do (
    set "day=%%a"
    set "month=%%b"
    set "year=%%c"
)

:: Obtener la hora en formato HH-MM, reemplazando los dos puntos (:)
for /f "tokens=1-2 delims=: " %%a in ("%time%") do (
    set "hour=%%a"
    set "minute=%%b"
)
set "hour=%hour: =0%"  rem Reemplaza espacios por ceros si es necesario

:: Construir el timestamp en formato yyyy-mm-dd-hh-mm
set "timestamp=%year%-%month%-%day%-%hour%-%minute%"

:: Nombre del archivo de backup
set "filename=BK_fisico_%timestamp%.sql"

:: Realiza el backup completo de la base de datos
mysqldump -u franco -pcucul --databases doce_salud doce_administracion doce_logistica > "%backup_dir%\%filename%"

:: Verifica si el backup fue exitoso
if %ERRORLEVEL% equ 0 (
    echo Backup físico completo realizado correctamente en %backup_dir%\%filename%.
) else (
    echo Ocurrió un error al realizar el backup.
)
