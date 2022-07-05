UPDATE smn_salud.smn_prestacion_servicio_medico_detalle SET
	smn_prestacion_servicio_medico_cabecera_id=${fld:smn_prestacion_servicio_medico_cabecera_id},
	smn_mov_caja_detalle_id=${fld:smn_mov_caja_detalle_id},
	smn_ingresos_mov_id=${fld:smn_ingresos_mov_id},
	smn_unidades_servicios_rf=${fld:smn_unidades_servicios_rf},
	smn_almacen_rf=${fld:smn_almacen_rf},
	smn_servicios_rf=${fld:smn_servicios_rf},
	psd_tipo_componentes=${fld:psd_tipo_componentes},
	smn_componentes_rf=${fld:smn_componentes_rf},
	smn_prestador_servicio_rf=${fld:smn_prestador_servicio_rf},
	psd_cantidad=${fld:psd_cantidad},
	psd_precio_propuesto_ml=${fld:psd_precio_propuesto_ml},
	psd_monto_propuesto_ml=${fld:psd_monto_propuesto_ml},
	smn_descuento_ml_rf=${fld:smn_descuento_ml_rf},
	smn_moneda_rf=${fld:smn_moneda_rf},
	psd_precio_propuesto_ma=${fld:psd_precio_propuesto_ma},
	psd_monto_propuesto_ma=${fld:psd_monto_propuesto_ma},
	psd_monto_descuento_propuesto_ml=${fld:psd_monto_descuento_propuesto_ml},
	psd_monto_descuento_propuesto_ma=${fld:psd_monto_descuento_propuesto_ma},
	psd_monto_neto_propuesto_ml=${fld:psd_monto_neto_propuesto_ml},
	psd_monto_neto_propuesto_ma=${fld:psd_monto_neto_propuesto_ma},
	psd_estatus=${fld:psd_estatus},
	psd_agregado_usuario=${fld:psd_agregado_usuario},
	psd_observaciones_rf=${fld:psd_observaciones_rf},
	smn_rol_id=${fld:smn_rol_id},
	psd_idioma='${def:locale}',
	psd_usuario='${def:user}',
	psd_fecha_registro={d '${def:date}'},
	psd_hora='${def:time}'

WHERE
	smn_prestacion_servicio_medico_detalle_id=${fld:id}

