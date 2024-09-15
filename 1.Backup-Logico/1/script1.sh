#!/bin/bash
backup_dir="/home/menwic/Pra-Backups-BD2/1.Backup-Logico/1"
timestamp=$(date +"%Y-%m-%d-%a-%H-%M")
filename="BK_tipo1_$timestamp.sql"

mysqldump -u franco -pcucul --databases doce_salud doce_administracion doce_logistica > "$backup_dir/$filename"
