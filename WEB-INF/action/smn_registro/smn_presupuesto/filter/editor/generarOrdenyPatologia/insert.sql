with orden as (
	select DISTINCT smn_salud.smn_rel_orden_medica_servicios.smn_ordenes_medicas_id as id_orden,
	smn_salud.smn_rel_orden_medica_servicios.smn_servicios_rf as servicio,
	smn_base.smn_baremos_detalle.bad_precio_moneda_local as precio_local,
	smn_base.smn_baremos_detalle.bad_precio_moneda_alterna as precio_alterno,
	smn_base.smn_baremos_detalle.bad_cantidad as cantidad,
	smn_base.smn_baremos_detalle.smn_moneda_rf as moneda,
	(select smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id from smn_base.smn_tasas_de_cambio where smn_base.smn_tasas_de_cambio.tca_fecha_vigencia=CURRENT_DATE LIMIT 1) AS smn_tasa_rf,
	case 
		when smn_base.smn_baremos_detalle.smn_moneda_rf is null then smn_base.smn_baremos_detalle.bad_precio_moneda_local else smn_base.smn_baremos_detalle.bad_precio_moneda_alterna*smn_base.smn_baremos_detalle.bad_cantidad*(select smn_base.smn_tasas_de_cambio.tca_tasa_cambio from smn_base.smn_tasas_de_cambio where smn_base.smn_tasas_de_cambio.tca_fecha_vigencia=CURRENT_DATE LIMIT 1)
	end as monto_local,
	smn_base.smn_baremos_detalle.bad_precio_moneda_alterna*smn_base.smn_baremos_detalle.bad_cantidad as monto_alterno,
	smn_base.smn_baremos_detalle.bad_tipo_componente as tipo_componente,
	smn_base.smn_baremos_detalle.smn_item_rf as item,
	smn_salud.smn_ordenes_medicas.omd_indicaciones as observaciones,
	smn_salud.smn_ordenes_medicas.smn_prestador_servicio_rf as prestador,
	case 
		when smn_base.smn_rel_grupo_prestador_servicio.smn_grupos_prestadores_id is null then 0 else smn_base.smn_rel_grupo_prestador_servicio.smn_grupos_prestadores_id
	end as grupo_prestador

	from smn_salud.smn_rel_orden_medica_servicios
	inner join smn_salud.smn_ordenes_medicas on smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id = smn_salud.smn_rel_orden_medica_servicios.smn_ordenes_medicas_id
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_rel_orden_medica_servicios.smn_servicios_rf
	inner join smn_base.smn_baremos_detalle on smn_base.smn_baremos_detalle.smn_servicios_rf = smn_salud.smn_rel_orden_medica_servicios.smn_servicios_rf
	left join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_base.smn_baremos_detalle.smn_item_rf
	inner join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_salud.smn_ordenes_medicas.smn_prestador_servicio_rf
	left join smn_base.smn_rel_grupo_prestador_servicio on smn_base.smn_rel_grupo_prestador_servicio.smn_prestadores_servicios_id = smn_salud.smn_ordenes_medicas.smn_prestador_servicio_rf
	where smn_salud.smn_rel_orden_medica_servicios.smn_ordenes_medicas_id=${fld:orden} and smn_base.smn_baremos_detalle.smn_baremos_id=${fld:baremos}
)
INSERT INTO smn_salud.smn_presupuesto_detalle
(
	smn_presupuesto_detalle_id,
	smn_presupuesto_id,
	smn_servicios_rf,
	prd_cantidad,
	prd_precio,
	smn_moneda_rf,
	prd_precio_ma,
	prd_monto_moneda_local,
	prd_moneda_alterna,
	prd_idioma,
	prd_usuario,
	prd_fecha_registro,
	prd_hora,
	smn_tipo_componentes_rf,
	smn_componentes_rf,
	smn_codigo_descuento_rf,
	smn_tasa_rf,
	prd_observaciones,
	smn_item_rf,
	prd_monto_descuento_ml,
	prd_monto_neto_ml,
	prd_monto_impuesto_ml,
	prd_monto_descuento_ma,
	prd_monto_neto_ma,
	prd_monto_impuesto_ma,
	smn_prestadores_servicios_rf,
	smn_grupo_prestador_rf,
	prd_porcentaje_prestador,
	prd_forma_calculo_rf,
	prd_monto_incremento_ml,
	prd_monto_incremento_ma,
	smn_incrementos_rf,
	prd_estatus,
	prd_naturaleza
)
select 
	nextval('smn_salud.seq_smn_presupuesto_detalle'),
	(SELECT last_value FROM smn_salud.seq_smn_presupuesto),
	orden.servicio,
	orden.cantidad,
	orden.precio_local,
	orden.moneda,
	orden.precio_alterno,
	orden.monto_local,
	orden.monto_alterno,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	orden.tipo_componente,
	0,
	0,
	orden.smn_tasa_rf,
	orden.observaciones,
	orden.item,
	0,
	0,
	0,
	0,
	0,
	0,
	orden.prestador,
	orden.grupo_prestador,
	0,
	0,
	0,
	0,
	0,
	'GE',
	'SE' from orden