#!/bin/bash
backup_dir="/home/menwic/Pra-Backups-BD2/1.Backup-Logico/3"
timestamp=$(date +"%Y-%m-%d-%a-%H-%M")
filename="BK_tipo3_$timestamp.sql"

mysqldump -u franco -pcucul --no-create-info --databases doce_salud doce_administracion doce_logistica > "$backup_dir/$filename"
