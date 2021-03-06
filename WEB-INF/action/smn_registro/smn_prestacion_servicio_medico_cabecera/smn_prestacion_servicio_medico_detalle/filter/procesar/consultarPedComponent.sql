SELECT DISTINCT
	smn_salud.smn_prestacion_servicio_medico_cabecera.smn_ingresos_id as ingreso_id,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_servicios_rf as servicios_id,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes as tipo_componentes,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_componentes_rf as componentes_id,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestador_servicio_rf  as prestador,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_detalle_id as prestacion_detalle_id
	
FROM
	smn_salud.smn_prestacion_servicio_medico_cabecera
	INNER JOIN smn_salud.smn_prestacion_servicio_medico_detalle ON smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id
	INNER JOIN smn_salud.smn_ingresos ON smn_salud.smn_prestacion_servicio_medico_cabecera.smn_ingresos_id = smn_salud.smn_ingresos.smn_ingresos_id
	INNER JOIN smn_comercial.smn_pedido_componentes ON smn_salud.smn_ingresos.smn_ingresos_id = smn_comercial.smn_pedido_componentes.smn_ingresos_rf 
	AND smn_salud.smn_prestacion_servicio_medico_detalle.smn_servicios_rf = smn_comercial.smn_pedido_componentes.smn_servicio_rf 
	AND smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes = smn_comercial.smn_pedido_componentes.pco_tipo_componente 
	AND smn_salud.smn_prestacion_servicio_medico_detalle.smn_componentes_rf = smn_comercial.smn_pedido_componentes.smn_componente_rf 
WHERE
	smn_salud.smn_prestacion_servicio_medico_cabecera.smn_ingresos_id = ${fld:ingreso_id} --and smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestador_servicio_rf is not null 
	and smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_detalle_id=${fld:id}