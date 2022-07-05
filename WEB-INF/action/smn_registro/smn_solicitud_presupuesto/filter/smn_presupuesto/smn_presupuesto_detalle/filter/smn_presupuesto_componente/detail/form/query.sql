select
		smn_salud.smn_presupuesto_componente.smn_presupuesto_componente_id,
	case
	when smn_salud.smn_presupuesto_componente.smn_tipos_componentes_rf='IT' then '${lbl:b_item}'
	when smn_salud.smn_presupuesto_componente.smn_tipos_componentes_rf='HO' then '${lbl:b_honorary}'
	when smn_salud.smn_presupuesto_componente.smn_tipos_componentes_rf='SE' then '${lbl:b_services}'
	end as smn_tipos_componentes_rf,
	case
	when smn_salud.smn_presupuesto_componente.prc_forma_calculo_rf='R' then '${lbl:b_price_inv}'
	when smn_salud.smn_presupuesto_componente.prc_forma_calculo_rf='RP' then '${lbl:b_price_inv_plus}'
	when smn_salud.smn_presupuesto_componente.prc_forma_calculo_rf='PP' then '${lbl:b_presupuesto_plus}'
	when smn_salud.smn_presupuesto_componente.prc_forma_calculo_rf='PR' then '${lbl:b_presupuesto}'
	when smn_salud.smn_presupuesto_componente.prc_forma_calculo_rf='D' then '${lbl:b_diference}'
	when smn_salud.smn_presupuesto_componente.prc_forma_calculo_rf='M' then '${lbl:b_amount}'
	when smn_salud.smn_presupuesto_componente.prc_forma_calculo_rf='PO' then '${lbl:b_porcentage}'
	end as prc_forma_calculo_rf,
	smn_salud.smn_presupuesto_componente.smn_presupuesto_detalle_id,
	smn_salud.smn_presupuesto_componente.smn_presupuesto_id,
	smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	smn_base.smn_componentes.cmp_descripcion as smn_componentes_rf,
	smn_base.smn_grupos_prestadores.gpp_descripcion as smn_grupo_prestador_rf,
	smn_base.smn_prestadores_servicios.prs_descripcion as smn_prestadores_servicios_rf,
	smn_salud.smn_presupuesto_componente.prc_cantidad,
	smn_salud.smn_presupuesto_componente.prc_monto_ml,
	smn_salud.smn_presupuesto_componente.prc_monto_ma,
	smn_salud.smn_presupuesto_componente.prc_monto_neto_ml,
	smn_salud.smn_presupuesto_componente.prc_monto_descuento_ma,
	smn_salud.smn_presupuesto_componente.prc_monto_descuento_ml,
	smn_salud.smn_presupuesto_componente.prc_monto_impuesto_ma,
	smn_salud.smn_presupuesto_componente.prc_monto_impuesto_ml,
	smn_salud.smn_presupuesto_componente.prc_monto_incremento_ma,
	smn_salud.smn_presupuesto_componente.prc_monto_incremento_ml,
	smn_salud.smn_presupuesto_componente.prc_monto_ma,
	smn_salud.smn_presupuesto_componente.prc_monto_ml,
	smn_salud.smn_presupuesto_componente.prc_monto_neto_ml,
	smn_salud.smn_presupuesto_componente.prc_monto_neto_ma,
	smn_salud.smn_presupuesto_componente.prc_porcentaje_prestador,
	smn_salud.smn_presupuesto_componente.prc_precio_ma,
	smn_salud.smn_presupuesto_componente.prc_precio_ml,
	smn_salud.smn_presupuesto_componente.prc_visible_rf,
	smn_salud.smn_presupuesto_componente.smn_incrementos_porcentaje_rf,
	smn_base.smn_monedas.mon_simbolo ||' - '|| smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_salud.smn_presupuesto_componente.prc_fecha_registro
	
from
	smn_salud.smn_presupuesto_componente
	inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_salud.smn_presupuesto_componente.smn_componentes_rf
	left join smn_base.smn_grupos_prestadores on smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id = smn_salud.smn_presupuesto_componente.smn_grupo_prestador_rf
	inner join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_salud.smn_presupuesto_componente.smn_prestadores_servicios_rf
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_presupuesto_componente.smn_servicios_rf
	left join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_salud.smn_presupuesto_componente.smn_moneda_rf

where
	smn_presupuesto_componente_id = ${fld:id}
