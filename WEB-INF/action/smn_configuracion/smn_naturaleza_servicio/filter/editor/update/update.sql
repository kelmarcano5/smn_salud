UPDATE smn_salud.smn_naturaleza_servicio SET
	smn_tipo_servicio_rf=${fld:smn_tipo_servicio_rf},
	nts_naturaleza=${fld:nts_naturaleza},
	nts_idioma='${def:locale}',
	nts_usuario='${def:user}',
	nts_fecha_registro={d '${def:date}'},
	nts_hora='${def:time}'

WHERE
	smn_naturaleza_servicio_id=${fld:id}

