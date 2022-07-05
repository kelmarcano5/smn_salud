select  smn_salud.smn_presupuesto.pre_monto_ml as netoml,
smn_salud.smn_presupuesto.pre_monto_neto_moneda_alterna as netoma
--SUM(smn_salud.smn_presupuesto_detalle.prd_moneda_alterna+smn_salud.smn_presupuesto_detalle.prd_monto_incremento_ma-smn_salud.smn_presupuesto_detalle.prd_monto_descuento_ma) as netoma

from smn_salud.smn_presupuesto_detalle
	inner join smn_salud.smn_presupuesto on smn_salud.smn_presupuesto.smn_presupuesto_id = smn_salud.smn_presupuesto_detalle.smn_presupuesto_id
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_presupuesto_detalle.smn_servicios_rf
	left outer join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_salud.smn_presupuesto_detalle.smn_componentes_rf
	left outer join smn_base.smn_grupo_titulo_impresion on smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id =  smn_base.smn_componentes.smn_grupo_titulo_impresion_rf
	left outer join smn_base.smn_descuentos_retenciones on smn_base.smn_descuentos_retenciones.smn_descuentos_retenciones_id = 
	smn_salud.smn_presupuesto_detalle.smn_codigo_descuento_rf
where 
	smn_salud.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id} and smn_salud.smn_presupuesto_detalle.smn_tipo_componentes_rf in('SE','IT') and smn_salud.smn_presupuesto_detalle.prd_estatus<>'RZ' limit 1