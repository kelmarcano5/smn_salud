UPDATE smn_salud.smn_ruta_paciente SET
	 rta_ejecutivo_asignado=${fld:rta_ejecutivo_asignado},
	rta_idioma='${def:locale}',
	rta_usuario='${def:user}',
	rta_fecha_registro='${def:date}',
	rta_hora='${def:time}'

WHERE
	rta_ticket=${fld:ticket} and rta_secuencia=1

