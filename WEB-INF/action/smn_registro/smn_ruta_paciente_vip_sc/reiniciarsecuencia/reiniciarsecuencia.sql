UPDATE smn_salud.smn_ruta_paciente set
	rta_estatus='PE',
	rta_ejecutivo_asignado='',
	rta_hora_llegada_unidad=''
where
	smn_salud.smn_ruta_paciente.smn_ruta_id=${fld:id} and rta_secuencia=1
