UPDATE smn_salud.smn_ingreso_movimiento SET
	smn_ingreso_id=${fld:smn_ingreso_id},
	smn_servicios_rf=${fld:smn_servicios_rf},
	smn_componente_rf=${fld:smn_componente_rf},
	inm_accion=${fld:inm_accion},
	smn_tipo_consulta_rf=${fld:smn_tipo_consulta_rf},
	smn_grupo_prestador_servicio_rf=${fld:smn_grupo_prestador_servicio_rf},
	smn_prestador_servicio_rf=${fld:smn_prestador_servicio_rf},
	smn_motivos_id=${fld:smn_motivos_id},
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	inm_ordenante_descripcion=${fld:inm_ordenante_descripcion},
	smn_sintoma_id=${fld:smn_sintoma_id},
	inm_tipo_orden=${fld:inm_tipo_orden},
	inm_num_orden_medica=${fld:inm_num_orden_medica},
	inm_idioma='${def:locale}',
	inm_usuario='${def:user}',
	inm_fecha_registro={d '${def:date}'},
	inm_hora='${def:time}'

WHERE
	smn_ingresos_mov_id=${fld:id} --and and inm_estatus = 'PE'

