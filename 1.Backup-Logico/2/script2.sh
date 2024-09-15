#!/bin/bash
backup_dir="/home/menwic/Pra-Backups-BD2/1.Backup-Logico/2"
timestamp=$(date +"%Y-%m-%d-%a-%H-%M")
filename="BK_tipo2_$timestamp.sql"

mysqldump -u franco -pcucul doce_salud pacientes medicos citas_medicas ^
doce_administracion empleados departamentos proyectos ^
doce_logistica productos proveedores pedidos > "$backup_dir/$filename"
