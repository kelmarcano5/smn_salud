select smn_salud.smn_presupuesto_componente.smn_presupuesto_componente_id,
smn_salud.smn_presupuesto_componente.smn_presupuesto_detalle_id,
smn_salud.smn_presupuesto_componente.smn_presupuesto_id,
smn_salud.smn_presupuesto_componente.smn_componentes_rf,
smn_salud.smn_presupuesto_componente.prc_cantidad as pco_cantidad,
smn_salud.smn_presupuesto_componente.smn_servicios_rf,
smn_salud.smn_presupuesto_componente.smn_tipos_componentes_rf as pde_naturaleza,
smn_salud.smn_presupuesto_componente.smn_prestadores_servicios_rf,
smn_salud.smn_presupuesto_componente.smn_grupo_prestador_rf,
smn_salud.smn_presupuesto_componente.smn_moneda_rf,
smn_salud.smn_presupuesto_componente.prc_forma_calculo_rf,
smn_salud.smn_presupuesto_componente.prc_monto_ml as prd_monto_moneda_local,
smn_salud.smn_presupuesto_componente.prc_monto_ma as prd_moneda_alterna,
smn_salud.smn_presupuesto_componente.prc_monto_neto_ml,
smn_salud.smn_presupuesto_componente.prc_monto_neto_ma,
smn_salud.smn_presupuesto_componente.prc_precio_ml as prd_precio,
smn_salud.smn_presupuesto_componente.prc_precio_ma as prd_precio_ma,
case
	when smn_salud.smn_presupuesto_componente.smn_prestadores_servicios_rf IS NULL then 'NO' 
	when smn_salud.smn_presupuesto_componente.smn_prestadores_servicios_rf IS NOT NULL then 'SI' 
end as pco_es_prestador_servicio,
case
	when smn_base.smn_componentes.cmp_forma_calculo in('RP','PP') then  smn_base.smn_componentes.smn_item_rf
	when smn_base.smn_componentes.cmp_forma_calculo in('R','PR') then 0
end as smn_item_rf,
smn_base.smn_componentes.smn_imprime as pco_imprime,
smn_base.smn_componentes.smn_almacen_rf,
case
	when smn_base.smn_componentes.smn_sub_tipo_gasto_rf IS NULL then 0 else smn_base.smn_componentes.smn_sub_tipo_gasto_rf
end as smn_sub_tipo_gasto_rf,
case
	when smn_base.smn_componentes.smn_tipo_gasto_rf IS NULL then 0 else smn_base.smn_componentes.smn_tipo_gasto_rf
end as smn_tipo_gasto_rf,
smn_base.smn_componentes.cmp_clase_auxiliar_rf as smn_clase_auxiliar_rf,
case
	when smn_salud.smn_presupuesto.smn_auxiliar_rf IS NULL then 0 else smn_salud.smn_presupuesto.smn_auxiliar_rf
end as smn_auxiliar_rf,
smn_base.smn_componentes.smn_grupo_componente_rf,
smn_base.smn_componentes.cmp_forma_calculo,
smn_base.smn_componentes.smn_grupo_titulo_impresion_rf as smn_grupo_titulo_impresion_rf
from smn_salud.smn_presupuesto_componente 
inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_salud.smn_presupuesto_componente.smn_componentes_rf
inner join smn_salud.smn_presupuesto on smn_salud.smn_presupuesto.smn_presupuesto_id = smn_salud.smn_presupuesto_componente.smn_presupuesto_id
where smn_salud.smn_presupuesto_componente.smn_presupuesto_id = ${fld:smn_presupuesto_id}