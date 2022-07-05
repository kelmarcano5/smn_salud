UPDATE smn_salud.smn_recipe_medico SET
	rec_fecha=${fld:rec_fecha},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	smn_patologia_id=${fld:smn_patologia_id},
	smn_prestador_servicio_rf=${fld:smn_prestador_servicio_rf},
	rec_ordenante_nombre=${fld:rec_ordenante_nombre},
	smn_contratante_id=${fld:smn_contratante_id},
	smn_farmaceuta_prestador_servicio_rf=${fld:smn_farmaceuta_prestador_servicio_rf},
	rec_fecha_aprobacion=${fld:rec_fecha_aprobacion},
	rec_estatus=${fld:rec_estatus},
	rec_idioma='${def:locale}',
	rec_usuario='${def:user}',
	rec_fecha_registro={d '${def:date}'},
	rec_hora='${def:time}'

WHERE
	smn_recipe_medico_id=${fld:id}

