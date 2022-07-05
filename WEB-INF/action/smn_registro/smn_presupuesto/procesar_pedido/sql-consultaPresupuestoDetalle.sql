select 
smn_salud.smn_presupuesto_detalle.smn_presupuesto_id,
smn_salud.smn_presupuesto_detalle.smn_servicios_rf,
smn_salud.smn_presupuesto_detalle.prd_forma_calculo_rf as prd_forma_calculo_rf,
smn_salud.smn_presupuesto_detalle.prd_cantidad as pde_cantidad_oferta,
smn_salud.smn_presupuesto_detalle.prd_cantidad as pde_cantidad_pedido,
smn_salud.smn_presupuesto_detalle.smn_tipo_componentes_rf as pde_naturaleza,
case
	when smn_salud.smn_presupuesto_detalle.prd_forma_calculo_rf in('RP','PP') then smn_salud.smn_presupuesto_detalle.smn_item_rf  
	when smn_salud.smn_presupuesto_detalle.prd_forma_calculo_rf in('R','PR') then 0
end as smn_item_rf,
case
	when smn_salud.smn_presupuesto_detalle.prd_moneda_alterna is null then 0 else smn_salud.smn_presupuesto_detalle.prd_moneda_alterna
end as prd_moneda_alterna,
case
	when smn_salud.smn_presupuesto_detalle.prd_monto_moneda_local is null then 0 else smn_salud.smn_presupuesto_detalle.prd_monto_moneda_local
end as prd_monto_moneda_local,
case
	when smn_salud.smn_presupuesto.smn_moneda_rf is null then 0 else smn_salud.smn_presupuesto.smn_moneda_rf
end as smn_moneda_rf,
case
	when smn_salud.smn_presupuesto_detalle.smn_tasa_rf is null then 0 else smn_salud.smn_presupuesto_detalle.smn_tasa_rf
end as smn_tasa_rf,
case
	when smn_salud.smn_presupuesto_detalle.prd_precio is null then 0 else smn_salud.smn_presupuesto_detalle.prd_precio
end as prd_precio,
case
	when smn_salud.smn_presupuesto_detalle.prd_precio_ma is null then 0 else smn_salud.smn_presupuesto_detalle.prd_precio_ma
end as prd_precio_ma
from smn_salud.smn_presupuesto_detalle
inner join smn_salud.smn_presupuesto on smn_salud.smn_presupuesto.smn_presupuesto_id = smn_salud.smn_presupuesto_detalle.smn_presupuesto_id
inner join smn_salud.smn_orden_servicio on smn_salud.smn_orden_servicio.smn_orden_servicio_id = smn_salud.smn_presupuesto.smn_orden_servicio_id
inner join smn_salud.smn_centro_facturacion on smn_salud.smn_centro_facturacion.smn_centro_facturacion_id = smn_salud.smn_orden_servicio.smn_centro_facturacion_id
inner join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_orden_servicio.smn_documento_id
left join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_salud.smn_presupuesto_detalle.smn_componentes_rf
WHERE smn_salud.smn_presupuesto_detalle.smn_presupuesto_id = ${fld:smn_presupuesto_id} 
ORDER BY  smn_salud.smn_presupuesto_detalle.smn_tipo_componentes_rf ASC