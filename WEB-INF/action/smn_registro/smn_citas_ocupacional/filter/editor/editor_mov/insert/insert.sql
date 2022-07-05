INSERT INTO smn_salud.smn_citas_mov
(
	smn_citas_mov_id,
	smn_citas_id,
	smn_documento_id,
	ctm_num_control_cita,
	smn_servicios_rf,
	smn_componente_rf,
	ctm_accion,
	smn_tipo_consulta_id,
	smn_grupo_prestador_servicio_rf,
	smn_prestador_servicio_rf,
	ctm_fecha_cita,
	ctm_turno_cita,
	ctm_hora_cita,
	ctm_estatus_id,
	smn_motivos_id,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	cts_ordenante_descripcion,
	smn_sintoma_id,
	cts_tipo_orden,
	cts_num_orden_medica,
	smn_entidades_rf,
	smn_sucursales_rf,
	smn_areas_servicios_rf,
	smn_unidades_servicios_rf,
	ctm_observaciones_id,
	ctm_idioma,
	ctm_usuario,
	ctm_fecha_registro,
	ctm_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_citas_mov},
	${fld:smn_citas_id},
	${fld:smn_documento_id},
	${fld:ctm_num_control_cita},
	${fld:smn_servicios_rf},
	${fld:smn_componente_rf},
	${fld:ctm_accion},
	${fld:smn_tipo_consulta_id},
	${fld:smn_grupo_prestador_servicio_rf},
	${fld:smn_prestador_servicio_rf},
	${fld:ctm_fecha_cita},
	${fld:ctm_turno_cita},
	${fld:ctm_hora_cita},
	${fld:ctm_estatus_id},
	${fld:smn_motivos_id},
	${fld:smn_clase_auxiliar_rf},
	${fld:smn_auxiliar_rf},
	${fld:cts_ordenante_descripcion},
	${fld:smn_sintoma_id},
	${fld:cts_tipo_orden},
	${fld:cts_num_orden_medica},
	${fld:smn_entidades_rf},
	${fld:smn_sucursales_rf},
	${fld:smn_areas_servicios_rf},
	${fld:smn_unidades_servicios_rf},
	${fld:ctm_observaciones_id},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);

INSERT INTO smn_salud.smn_balance_capacidad_unidad
(
	smn_balance_capacidad_unidad_id,
	bcu_fecha_evento,
	smn_entidades_rf,
	smn_sucursales_rf,
	smn_areas_servicios_rf,
	smn_unidad_servicio_rf,
	bcu_capacidad_unidad,
	bcu_cant_citas_anuladas,
	bcu_cant_citas_otorgadas,
	bcu_disponibilidad_unidad,
	bcu_idioma,
	bcu_usuario,
	bcu_fecha_registro,
	bcu_hora
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_balance_capacidad_unidad},
	${fld:ctm_fecha_cita},
	(select smn_base.smn_entidades.smn_entidades_id from smn_base.smn_entidades
		inner join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.ase_empresa = smn_base.smn_entidades.smn_entidades_id
		inner join smn_base.smn_rel_servicio_area_unidad on smn_base.smn_rel_servicio_area_unidad.smn_areas_servicios_rf = smn_base.smn_areas_servicios.smn_areas_servicios_id
			where smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf=${fld:smn_unidades_servicios_rf} limit 1),
	(select smn_base.smn_sucursales.smn_sucursales_id from smn_base.smn_sucursales
		inner join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.ase_sucursal = smn_base.smn_sucursales.smn_sucursales_id
			inner join smn_base.smn_rel_servicio_area_unidad on smn_base.smn_rel_servicio_area_unidad.smn_areas_servicios_rf = smn_base.smn_areas_servicios.smn_areas_servicios_id
				where smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf=${fld:smn_unidades_servicios_rf} limit 1),
	(select smn_base.smn_areas_servicios.smn_areas_servicios_id from smn_base.smn_areas_servicios
			inner join smn_base.smn_rel_servicio_area_unidad on smn_base.smn_rel_servicio_area_unidad.smn_areas_servicios_rf = smn_base.smn_areas_servicios.smn_areas_servicios_id
				where smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf=${fld:smn_unidades_servicios_rf} limit 1),
	${fld:smn_unidades_servicios_rf},
	${fld:max_pacientes},
	0,
	1,
	${fld:max_pacientes}-1,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);

--update smn_salud.smn_capacidades_unidad set cap_cant_max_pacientes=(SELECT smn_salud.smn_balance_capacidad_unidad.bcu_disponibilidad_unidad FROM smn_salud.smn_balance_capacidad_unidad
--where smn_salud.smn_balance_capacidad_unidad.smn_unidad_servicio_rf=${fld:smn_unidades_servicios_rf} limit 1) where smn_salud.smn_capacidades_unidad.smn_unidad_servicio_rf=${fld:smn_unidades_servicios_rf}

