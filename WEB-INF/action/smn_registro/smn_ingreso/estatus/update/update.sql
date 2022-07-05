UPDATE smn_salud.smn_ruta_paciente SET
	rta_estatus=(CASE when ${fld:smn_estatus} is null then 'PE' ELSE ${fld:smn_estatus} END),
	rta_observacion=${fld:rta_observacion},
	rta_idioma='${def:locale}',
	rta_usuario='${def:user}',
	rta_fecha_registro='${def:date}',
	rta_hora='${def:time}'
WHERE
	smn_ruta_id=${fld:smn_ruta_id}

