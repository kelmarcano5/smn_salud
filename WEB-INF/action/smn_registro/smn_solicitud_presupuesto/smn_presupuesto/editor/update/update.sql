UPDATE smn_salud.smn_presupuesto SET
	smn_documento_id=${fld:smn_documento_id},
	smn_entidades_rf=${fld:smn_entidades_rf},
	smn_sucursales_rf=${fld:smn_sucursales_rf},
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	smn_clase_ord_rf=${fld:smn_clase_ord_rf},
	smn_auxiliar_ord_rf=${fld:smn_auxiliar_ord_rf},
	smn_baremo_rf=${fld:smn_baremo_rf},
	smn_auxiliar_unidades_negocios_rf=${fld:smn_auxiliar_unidades_negocios_rf},
	smn_auxiliar_sucursales_rf=${fld:smn_auxiliar_sucursales_rf},
	smn_auxiliar_areas_servicios_rf=${fld:smn_auxiliar_areas_servicios_rf},
	smn_auxiliar_unidades_servicios_rf=${fld:smn_auxiliar_unidades_servicios_rf},
	pre_vigencia_hasta=${fld:pre_vigencia_hasta},
	smn_ordenes_medicas_id=${fld:smn_ordenes_medicas_id},
	pre_fecha_entrega=${fld:pre_fecha_entrega},
	pre_idioma='${def:locale}',
	pre_usuario='${def:user}',
	pre_fecha_registro={d '${def:date}'},
	pre_hora='${def:time}',
	smn_contratante_id=${fld:smn_contratante_id},
	pre_tipo=${fld:tipo},
	smn_patologia_id=${fld:smn_patologia_id},
	pre_observaciones=${fld:pre_observaciones}

WHERE
	smn_presupuesto_id=${fld:id}

