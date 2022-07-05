UPDATE smn_salud.smn_citas_mov SET
	ctm_num_control_cita=${fld:ctm_num_control_cita},
	ctm_fecha=${fld:ctm_fecha},
	ctm_localidad=${fld:ctm_localidad},
	ctm_servicio=${fld:ctm_servicio},
	ctm_componente=${fld:ctm_componente},
	ctm_prestador_servicio=${fld:ctm_prestador_servicio},
	ctm_tipo_componente=${fld:ctm_tipo_componente},
	ctm_estatus=${fld:ctm_estatus},
	ctm_observ_cita=${fld:ctm_observ_cita},
	ctm_idioma='${def:locale}',
	ctm_usuario='${def:user}',
	ctm_fecha_registro={d '${def:date}'},
	ctm_hora='${def:time}'

WHERE
	smn_citas_mov_id=${fld:id}

