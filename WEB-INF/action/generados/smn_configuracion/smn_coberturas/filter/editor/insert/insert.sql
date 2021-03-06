INSERT INTO smn_salud.smn_coberturas
(
	smn_coberturas_id,
	cob_codigo,
	cob_descripcion,
	cob_horario_dias,
	cob_horario_horas,
	cob_area_cobertura,
	cob_descuento,
	cob_tiempo_servicio,
	smn_tipo_coberturas_id,
	cob_deducible,
	cob_time_desp_afil,
	cob_otros_centros,
	cob_cantidad_servicio,
	cob_vigencia_desde,
	cob_vigencia_hasta,
	cob_cobertura_desde,
	cob_cobertura_hasta,
	cob_deducible_centro,
	cob_porc_deducible,
	cob_idioma,
	cob_usuario,
	cob_fecha_registro,
	cob_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_coberturas},
	${fld:cob_codigo},
	${fld:cob_descripcion},
	${fld:cob_horario_dias},
	${fld:cob_horario_horas},
	${fld:cob_area_cobertura},
	${fld:cob_descuento},
	${fld:cob_tiempo_servicio},
	${fld:smn_tipo_coberturas_id},
	${fld:cob_deducible},
	${fld:cob_time_desp_afil},
	${fld:cob_otros_centros},
	${fld:cob_cantidad_servicio},
	${fld:cob_vigencia_desde},
	${fld:cob_vigencia_hasta},
	${fld:cob_cobertura_desde},
	${fld:cob_cobertura_hasta},
	${fld:cob_deducible_centro},
	${fld:cob_porc_deducible},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
