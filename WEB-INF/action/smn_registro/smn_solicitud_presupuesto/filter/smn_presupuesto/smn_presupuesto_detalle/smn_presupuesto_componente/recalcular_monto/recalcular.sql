with tas as (
	select smn_salud.smn_presupuesto_componente.smn_presupuesto_componente_id as idcomp,
	smn_salud.smn_presupuesto_componente.smn_presupuesto_detalle_id,
	smn_salud.smn_presupuesto_componente.prc_monto_ma as monto_ma,
	case 
	 when smn_salud.smn_presupuesto_componente.smn_moneda_rf is not null then smn_salud.smn_presupuesto_componente.prc_monto_ma*(select smn_base.smn_tasas_de_cambio.tca_tasa_cambio from smn_base.smn_tasas_de_cambio where smn_base.smn_tasas_de_cambio.tca_fecha_vigencia=CURRENT_DATE) else smn_salud.smn_presupuesto_componente.prc_precio_ml
	end as monto_ml
	from smn_salud.smn_presupuesto_componente
	inner join smn_salud.smn_presupuesto_detalle on smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id = smn_salud.smn_presupuesto_componente.smn_presupuesto_detalle_id
	left join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_salud.smn_presupuesto_detalle.smn_tasa_rf 
	WHERE smn_salud.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id2}
)
	update smn_salud.smn_presupuesto_componente set 
		prc_monto_ml=tas.monto_ml,
		prc_monto_neto_ml=tas.monto_ml,
		prc_monto_neto_ma=tas.monto_ma from tas
	where smn_salud.smn_presupuesto_componente.smn_presupuesto_componente_id = tas.idcomp 
	and smn_salud.smn_presupuesto_componente.smn_presupuesto_id=${fld:id2}
