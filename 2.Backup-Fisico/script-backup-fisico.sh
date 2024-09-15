#!/bin/bash

# Verifica si se ha proporcionado una ruta como parámetro
if [ -z "$1" ]; then
    echo "Debes proporcionar una ruta donde se almacenará el backup."
    echo "Ejemplo: ./script-backup-fisico.sh /ruta/de/usb"
    exit 1
fi

# Ruta proporcionada como parámetro
backup_dir="$1"

# Verifica si la ruta proporcionada existe
if [ ! -d "$backup_dir" ]; then
    echo "La ruta $backup_dir no existe."
    exit 1
fi

# Obtener la fecha en formato YYYY-MM-DD
year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)

# Obtener la hora en formato HH-MM
hour=$(date +%H)
minute=$(date +%M)

# Construir el timestamp en formato yyyy-mm-dd-hh-mm
timestamp="$year-$month-$day-$hour-$minute"

# Nombre del archivo de backup
filename="BK_fisico_$timestamp.sql"

# Realiza el backup completo de la base de datos
mysqldump -u franco -pcucul --databases doce_salud doce_administracion doce_logistica > "$backup_dir/$filename"

# Verifica si el backup fue exitoso
if [ $? -eq 0 ]; then
    echo "Backup físico completo realizado correctamente en $backup_dir/$filename."
else
    echo "Ocurrió un error al realizar el backup."
    exit 1
fi


# NOTA: Otorga permisos de ejcucionn al archivo con:
# chmod +x /home/menwic/Pra-Backups-BD2/2.Backup-Fisico/script-backup-fisico.sh
