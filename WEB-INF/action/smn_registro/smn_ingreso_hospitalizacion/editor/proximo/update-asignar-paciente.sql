update smn_salud.smn_ruta_paciente 
set rta_estatus = 'EA', rta_ejecutivo_asignado = ${fld:usuario} 
where 
	smn_ruta_id = ${fld:ruta_id}