UPDATE smn_salud.smn_ruta_paciente SET
	smn_unidad_servicio_rf=${fld:smn_unidad_servicio_rf},
	rta_secuencia=${fld:rta_secuencia},
	rta_idioma='${def:locale}',
	rta_usuario='${def:user}',
	rta_fecha_registro='${def:date}',
	rta_hora='${def:time}'

WHERE
	smn_ruta_id=${fld:id}

