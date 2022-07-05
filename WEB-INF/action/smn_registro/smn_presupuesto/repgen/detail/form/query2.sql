select
	smn_salud.smn_presupuesto.pre_numero_control,
	smn_salud.smn_presupuesto.smn_clase_auxiliar_rf,
	smn_salud.smn_presupuesto.smn_clase_ord_rf,
	smn_salud.smn_presupuesto.smn_auxiliar_ord_rf,
	smn_salud.smn_presupuesto.smn_baremo_rf,
	smn_salud.smn_presupuesto.smn_auxiliar_unidades_negocios_rf,
	smn_salud.smn_presupuesto.smn_auxiliar_areas_servicios_rf,
	smn_salud.smn_presupuesto.smn_auxiliar_unidades_servicios_rf,
	smn_salud.smn_presupuesto.pre_vigencia_hasta,
	smn_salud.smn_presupuesto.smn_ordenes_medicas_id,
	smn_salud.smn_presupuesto.pre_fecha_entrega,
	smn_salud.smn_presupuesto.pre_monto_ml,
	smn_salud.smn_presupuesto.smn_moneda_rf,
	smn_salud.smn_presupuesto.pre_monto_ma,
	smn_salud.smn_presupuesto.smn_presupuesto_id,
	smn_salud.smn_documento.dcf_descripcion as smn_documento_id,
	smn_base.smn_entidades.ent_descripcion_corta as smn_entidades_rf,
	smn_base.smn_sucursales.suc_nombre as smn_sucursales_rf,
	smn_salud.smn_estado_presupuesto.epr_descripcion as smn_estado_presupuesto_id,
	smn_base.smn_auxiliar.aux_descripcion as smn_auxiliar_rf,
	smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_base.smn_item.itm_nombre as smn_item_rf,
	smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	smn_salud.smn_presupuesto.smn_codigo_descuento_rf,
	smn_salud.smn_presupuesto.pre_monto_descuento,
	smn_salud.smn_presupuesto.pre_monto_descuento_moneda_alterna,
	smn_salud.smn_presupuesto.pre_monto_impuesto_ml,
	smn_salud.smn_presupuesto.pre_monto_impuesto_ma,
	smn_salud.smn_presupuesto_detalle.prd_cantidad,
	smn_salud.smn_presupuesto_detalle.prd_precio,
	smn_salud.smn_presupuesto_detalle.prd_precio_ma,
	smn_salud.smn_presupuesto_detalle.prd_monto_moneda_local,
	smn_salud.smn_presupuesto_detalle.prd_moneda_alterna,
	smn_salud.smn_presupuesto_detalle.prd_observaciones,
	smn_salud.smn_presupuesto_detalle.smn_tipo_componentes_rf,
	smn_salud.smn_presupuesto_detalle.smn_componentes_rf,
	smn_salud.smn_presupuesto_detalle.smn_codigo_descuento_rf,
	smn_salud.smn_presupuesto_detalle.prd_monto_descuento_ml,
	smn_salud.smn_presupuesto_detalle.prd_monto_descuento_ma,
	smn_salud.smn_presupuesto_detalle.prd_monto_impuesto_ml,
	smn_salud.smn_presupuesto_detalle.prd_monto_impuesto_ma,
	smn_salud.smn_presupuesto_detalle.prd_monto_incremento_ml,
	smn_salud.smn_presupuesto_detalle.prd_monto_incremento_ma,
	smn_salud.smn_presupuesto_detalle.prd_monto_neto_ml,
	smn_salud.smn_presupuesto_detalle.prd_monto_neto_ma,
	smn_salud.smn_presupuesto_detalle.prd_porcentaje_prestador,
	smn_salud.smn_presupuesto_detalle.prd_forma_calculo_rf
from
	smn_salud.smn_presupuesto
	inner join smn_salud.smn_presupuesto_detalle on smn_salud.smn_presupuesto_detalle.smn_presupuesto_id = smn_salud.smn_presupuesto.smn_presupuesto_id
	left outer join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_presupuesto.smn_documento_id
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_salud.smn_presupuesto.smn_entidades_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_salud.smn_presupuesto.smn_sucursales_rf
	left outer join smn_salud.smn_estado_presupuesto on smn_salud.smn_estado_presupuesto.smn_estado_presupuesto_id = smn_salud.smn_presupuesto.smn_estado_presupuesto_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_presupuesto.smn_auxiliar_rf 
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_salud.smn_presupuesto.smn_moneda_rf
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_salud.smn_presupuesto_detalle.smn_item_rf
	left outer join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_presupuesto_detalle.smn_servicios_rf
where
	smn_salud.smn_presupuesto.smn_presupuesto_id = ${fld:id}
