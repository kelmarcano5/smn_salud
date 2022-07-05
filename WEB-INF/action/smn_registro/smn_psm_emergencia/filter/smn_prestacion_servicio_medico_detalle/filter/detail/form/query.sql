select
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_detalle_id,
	smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id,
	smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id,
	case
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes='IT' then '${lbl:b_item}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes='SE' then '${lbl:b_services}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes='HO' then '${lbl:b_honorary}'
	end as psd_tipo_componentes,
	case
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='RE' then '${lbl:b_register}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='AP' then '${lbl:b_aprobated}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='RZ' then '${lbl:b_not_aprobated}'
	end as psd_estatus,
	case
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_agregado_usuario='SI' then '${lbl:b_yes}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_agregado_usuario='NO' then '${lbl:b_not}'
	end as psd_agregado_usuario,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_mov_caja_detalle_id as smn_mov_caja_detalle_id,
	smn_base.smn_almacen.alm_nombre as smn_almacen_rf,
	smn_base.smn_unidades_servicios.uns_descripcion as smn_unidades_servicios_rf,
	smn_base.smn_componentes.cmp_descripcion as smn_componentes_rf,
	smn_base.smn_item.itm_nombre as smn_item_rf,
	smn_base.smn_prestadores_servicios.prs_descripcion as smn_prestador_servicio_rf,
	smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_observaciones_rf as obs_descripcion,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_cantidad,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_monto_descuento_propuesto_ma,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_monto_descuento_propuesto_ml,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_monto_neto_propuesto_ma,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_monto_neto_propuesto_ml,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_monto_propuesto_ma,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_monto_propuesto_ml,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_precio_propuesto_ma,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_precio_propuesto_ml,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_descuento_ml_rf,
	case
	 when smn_salud.smn_rol.rol_tipo='SO' THEN 'Solicitante'
	end as smn_rol_id,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_fecha_registro
	
	
from
	smn_salud.smn_prestacion_servicio_medico_detalle
	inner join smn_salud.smn_prestacion_servicio_medico_cabecera on smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id
	left join smn_salud.smn_ingreso_movimiento on smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id
	left join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_moneda_rf 
	left join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_servicios_rf
	left join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_componentes_rf
	left join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_item_rf
	left join smn_salud.smn_rol on smn_salud.smn_rol.smn_rol_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_rol_id
	left join smn_base.smn_almacen on smn_base.smn_almacen.smn_almacen_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_almacen_rf
	left join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_unidades_servicios_rf
	left join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestador_servicio_rf
where
	smn_prestacion_servicio_medico_detalle_id = ${fld:id}
