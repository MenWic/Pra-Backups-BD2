@echo off
set "backup_dir=C:\Users\lamr4\OneDrive\Escritorio\Pra-Backups-BD2\1.Backup-Logico\1"

rem Obtener la fecha en formato YYYY-MM-DD, detectando la configuración regional
for /f "tokens=2-4 delims=/- " %%a in ('date /t') do (
    set "day=%%a"
    set "month=%%b"
    set "year=%%c"
)

rem Obtener el día de la semana sin acentos (sab, dom, lun, mar, etc.)
for /f "tokens=1" %%a in ('wmic path win32_localtime get dayofweek /value') do set "dow=%%a"

if "%dow%"=="0" set "day_of_week=dom"
if "%dow%"=="1" set "day_of_week=lun"
if "%dow%"=="2" set "day_of_week=mar"
if "%dow%"=="3" set "day_of_week=mie"
if "%dow%"=="4" set "day_of_week=jue"
if "%dow%"=="5" set "day_of_week=vie"
if "%dow%"=="6" set "day_of_week=sab"

rem Obtener la hora en formato HH-MM, reemplazando los dos puntos (:)
for /f "tokens=1-2 delims=: " %%a in ("%time%") do (
    set "hour=%%a"
    set "minute=%%b"
)
set "hour=%hour: =0%"  rem Reemplazar espacio por cero si es necesario

rem Construir el timestamp en formato yyyy-mm-dd-day-hh-mm
set "timestamp=%year%-%month%-%day%-%day_of_week%-%hour%-%minute%"

echo El nombre del archivo será: BK_tipo1_%timestamp%.sql
pause

set "filename=BK_tipo1_%timestamp%.sql"

mysqldump -u franco -pcucul --databases doce_salud doce_administracion doce_logistica > "%backup_dir%\%filename%"
