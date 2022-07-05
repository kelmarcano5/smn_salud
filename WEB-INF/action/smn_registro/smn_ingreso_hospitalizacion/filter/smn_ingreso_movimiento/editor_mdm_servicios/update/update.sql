UPDATE smn_base.smn_componentes SET
	cmp_codigo=${fld:cmp_codigo},
	cmp_descripcion=${fld:cmp_descripcion},
	cmp_area_servicio=${fld:cmp_area_servicio},
	cmp_unidad_servicio=${fld:cmp_unidad_servicio},
	cmp_vigencia_desde=${fld:cmp_vigencia_desde},
	cmp_vigencia_hasta=${fld:cmp_vigencia_hasta},
	cmp_visible=${fld:cmp_visible},
	cmp_req_grupo_prestador=${fld:cmp_req_grupo_prestador},
	cmp_grupo_prestador=${fld:cmp_grupo_prestador},
	cmp_req_honorario=${fld:cmp_req_honorario},
	cmp_tiempo_estimado=${fld:cmp_tiempo_estimado},
	cmp_clase_auxiliar=${fld:cmp_clase_auxiliar},
	cmp_tipo=${fld:cmp_tipo},
	cmp_almacen=${fld:cmp_almacen},
	cmp_calculo=${fld:cmp_calculo},
	cmp_cantidad=${fld:cmp_cantidad},
	cmp_precio=${fld:cmp_precio},
	cmp_porcentaje=${fld:cmp_porcentaje},
	cmp_trans_general=${fld:cmp_trans_general},
	cmp_idioma='${def:locale}',
	cmp_usuario='${def:user}'
WHERE
	smn_base.smn_componentes.smn_componentes_id=${fld:id}

