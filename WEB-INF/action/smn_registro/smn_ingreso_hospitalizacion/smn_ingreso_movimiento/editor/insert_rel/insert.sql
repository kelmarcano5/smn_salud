INSERT INTO smn_salud.smn_ingreso_movimiento
(
	smn_ingresos_mov_id,
	smn_ingreso_id,
	smn_servicios_rf,
	smn_unidades_servicios_rf,
	smn_componente_rf,
	inm_accion,
	smn_tipo_consulta_rf,
	smn_grupo_prestador_servicio_rf,
	smn_prestador_servicio_rf,
	smn_motivos_id,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	inm_ordenante_descripcion,
	smn_sintoma_id,
	inm_tipo_orden,
	inm_num_orden_medica,
	inm_estatus,
	inm_idioma,
	inm_usuario,
	inm_fecha_registro,
	inm_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_ingreso_movimiento},
	${fld:smn_ingreso_id},
	${fld:smn_servicios_rf},
	${fld:smn_unidades_servicios_rf},
	${fld:smn_componente_rf},
	${fld:inm_accion},
	${fld:smn_tipo_consulta_rf},
	${fld:smn_grupo_prestador_servicio_rf},
	${fld:smn_prestador_servicio_rf},
	${fld:smn_motivos_id},
	${fld:smn_clase_auxiliar_rf},
	${fld:smn_auxiliar_rf},
	${fld:inm_ordenante_descripcion},
	${fld:smn_sintoma_id},
	${fld:inm_tipo_orden},
	${fld:inm_num_orden_medica},
	'AC',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);

INSERT INTO smn_salud.smn_rel_documentos_servicios (
	smn_rel_documentos_servicios_id,
	smn_documentos_id,
	smn_servicios_id,
	rdt_tipo_generacion,
	rdt_hora_generacion
)
VALUES(
	${seq:nextval@smn_salud.seq_smn_rel_documentos_servicios},
	(select smn_documento_id from smn_salud.smn_ingresos where smn_salud.smn_ingresos.smn_ingresos_id=${fld:smn_ingreso_id}),
	${fld:smn_servicios_rf},
	'IN',
	'${def:time}'
);