SELECT smn_salud.smn_presupuesto.smn_presupuesto_id,
smn_salud.smn_presupuesto.smn_entidades_rf,
case
	when smn_salud.smn_presupuesto.smn_sucursales_rf is null then 0 else smn_salud.smn_presupuesto.smn_sucursales_rf
end as smn_sucursales_rf,
smn_salud.smn_presupuesto.smn_documento_id,
smn_salud.smn_presupuesto.smn_baremo_rf,
smn_salud.smn_presupuesto.smn_clase_auxiliar_rf,
smn_salud.smn_presupuesto.smn_auxiliar_rf,
smn_salud.smn_documento.dcf_descripcion as pca_descripcion,
smn_salud.smn_orden_servicio.smn_prestador_servicio_rf,
smn_salud.smn_orden_servicio.ors_numero,
smn_salud.smn_orden_servicio.smn_cliente_id,
smn_salud.smn_orden_servicio.smn_tipo_servicio_rf,
smn_salud.smn_centro_facturacion.smn_centro_costo_rf,
smn_salud.smn_centro_facturacion.smn_areas_servicios_rf,
smn_salud.smn_centro_facturacion.smn_unidades_servicios_rf,
case
	when smn_salud.smn_centro_facturacion.smn_almacen_rf is null then 0 else smn_salud.smn_centro_facturacion.smn_almacen_rf
end as smn_almacen_rf,
smn_salud.smn_presupuesto.pre_monto_ml,
smn_salud.smn_presupuesto.pre_monto_ma,
smn_salud.smn_presupuesto.pre_monto_neto_moneda_local,
smn_salud.smn_presupuesto.pre_monto_neto_moneda_alterna,
case
	when smn_salud.smn_presupuesto.pre_monto_impuesto_ml is null then 0 else smn_salud.smn_presupuesto.pre_monto_impuesto_ml
end as pre_monto_impuesto_ml,
case
	when smn_salud.smn_presupuesto.pre_monto_impuesto_ma is null then 0 else smn_salud.smn_presupuesto.pre_monto_impuesto_ma
end as pre_monto_impuesto_ma,
smn_salud.smn_presupuesto.pre_monto_descuento,
smn_salud.smn_presupuesto.pre_monto_descuento_moneda_alterna,
case
	when smn_salud.smn_presupuesto.smn_moneda_rf is null then 0 else smn_salud.smn_presupuesto.smn_moneda_rf
end as smn_moneda_rf,
smn_salud.smn_orden_servicio.smn_centro_facturacion_id,
smn_base.smn_usuarios.smn_usuarios_id as smn_usuario_rf,
smn_salud.smn_presupuesto.pre_numero_control
FROM smn_salud.smn_presupuesto
inner join smn_salud.smn_orden_servicio on smn_salud.smn_orden_servicio.smn_orden_servicio_id = smn_salud.smn_presupuesto.smn_orden_servicio_id
inner join smn_salud.smn_centro_facturacion on smn_salud.smn_centro_facturacion.smn_centro_facturacion_id = smn_salud.smn_orden_servicio.smn_centro_facturacion_id
inner join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_orden_servicio.smn_documento_id
inner join smn_seguridad.s_user on smn_seguridad.s_user.userlogin = '${def:user}'
inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_user_rf = smn_seguridad.s_user.user_id
WHERE smn_presupuesto_id=${fld:smn_presupuesto_id}