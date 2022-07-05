SELECT smn_v_servicio_precio_id AS id_servicio,
	CASE
		WHEN smn_moneda_alterna <> 0  then smn_precio_neto_ma_servicio*(select smn_base.smn_tasas_de_cambio.tca_tasa_cambio 
			from smn_base.smn_tasas_de_cambio where smn_base.smn_tasas_de_cambio.tca_fecha_vigencia=(select smn_salud.smn_ingresos.igs_fecha_ingreso from smn_salud.smn_ingresos where smn_salud.smn_ingresos.smn_ingresos_id=${fld:smn_ingreso_id}) 
			and smn_base.smn_tasas_de_cambio.tca_tipo_tasa=${fld:tipo_tasa} 
			and smn_base.smn_tasas_de_cambio.tca_estatus='AC') ELSE smn_precio_neto_ml_servicio
	END AS smn_precio_neto_ml_servicio,
	(COALESCE ( smn_precio_neto_ma_servicio, 0 )) AS smn_precio_neto_ma_servicio,
	(COALESCE ( smn_moneda_alterna, 0 )) AS smn_moneda_alterna,
	1 AS cantidad,
	CASE
		WHEN smn_moneda_alterna <> 0  then smn_precio_neto_ma_servicio*(select smn_base.smn_tasas_de_cambio.tca_tasa_cambio 
			from smn_base.smn_tasas_de_cambio where smn_base.smn_tasas_de_cambio.tca_fecha_vigencia=(select smn_salud.smn_ingresos.igs_fecha_ingreso from smn_salud.smn_ingresos where smn_salud.smn_ingresos.smn_ingresos_id=${fld:smn_ingreso_id}) 
			and smn_base.smn_tasas_de_cambio.tca_tipo_tasa=${fld:tipo_tasa} 
			and smn_base.smn_tasas_de_cambio.tca_estatus='AC') ELSE  smn_precio_neto_ml_servicio
	END AS inm_monto_ml,
	1 * (COALESCE ( smn_precio_neto_ma_servicio, 0 )) AS inm_monto_ma,
	(COALESCE ( smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id, 0 )) AS smn_tasas_de_cambio_id,
	0 AS id_detalle,
	0 AS id_ingreso 
FROM smn_base.smn_v_servicio_precio
LEFT JOIN smn_base.smn_tasas_de_cambio on
smn_base.smn_v_servicio_precio.smn_moneda_alterna = smn_base.smn_tasas_de_cambio.smn_monedas_id
WHERE smn_base.smn_v_servicio_precio.smn_tipo_precio = ${fld:tipo_precio} and smn_v_servicio_precio_id = ${fld:smn_servicios_rf} AND smn_base.smn_tasas_de_cambio.tca_fecha_vigencia=(select smn_salud.smn_ingresos.igs_fecha_ingreso from smn_salud.smn_ingresos where smn_salud.smn_ingresos.smn_ingresos_id=${fld:smn_ingreso_id}) 
			and smn_base.smn_tasas_de_cambio.tca_tipo_tasa=${fld:tipo_tasa} 
			and smn_base.smn_tasas_de_cambio.tca_estatus='AC'