UPDATE smn_salud.smn_rel_patologia_item SET
	smn_patologia_id=${fld:smn_patologia_id},
	smn_item_rf=${fld:smn_item_rf},
	rps_cantidad=${fld:rps_cantidad},
	rps_idioma='${def:locale}',
	rps_usuario_id='${def:user}',
	rps_fecha_registro={d '${def:date}'},
	rps_hora='${def:time}'

WHERE
	smn_rel_patologia_item_id=${fld:id}

