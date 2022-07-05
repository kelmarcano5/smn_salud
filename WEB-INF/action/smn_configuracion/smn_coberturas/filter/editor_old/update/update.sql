UPDATE smn_salud.smn_coberturas SET
	cob_codigo=${fld:cob_codigo},
	cob_descripcion=${fld:cob_descripcion},
	cob_descuento=${fld:cob_descuento},
	cob_tiempo_servicio=${fld:cob_tiempo_servicio},
	cob_unidad_tiempo_rf=${fld:cob_unidad_tiempo_rf},
	cob_deducible=${fld:cob_deducible},
	cob_time_desp_afil=${fld:cob_time_desp_afil},
	cob_otros_centros=${fld:cob_otros_centros},
	cob_cantidad_servicio=${fld:cob_cantidad_servicio},
	cob_vigencia_desde=${fld:cob_vigencia_desde},
	cob_vigencia_hasta=${fld:cob_vigencia_hasta},
	cob_cobertura_desde=${fld:cob_cobertura_desde},
	cob_cobertura_hasta=${fld:cob_cobertura_hasta},
	cob_deducible_centro=${fld:cob_deducible_centro},
	cob_porc_deducible=${fld:cob_porc_deducible},
	cob_idioma='${def:locale}',
	cob_usuario='${def:user}',
	cob_fecha_registro={d '${def:date}'},
	cob_hora='${def:time}'

WHERE
	smn_coberturas_id=${fld:id}

