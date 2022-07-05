UPDATE smn_salud.smn_ingreso_movimiento
	SET 
	inm_cantidad = ${fld:cantidad},
	inm_precio_ml =  ${fld:smn_precio_neto_ml_servicio},
	inm_monto_ml =  ${fld:inm_monto_ml},
	inm_precio_ma =  ${fld:smn_precio_neto_ma_servicio},
	inm_monto_ma = ${fld:inm_monto_ma},
	smn_moneda_rf = ${fld:smn_moneda_alterna},
	smn_tasa_rf = ${fld:smn_tasas_de_cambio_id},
	inm_estatus = 'AC'
WHERE smn_ingresos_mov_id = ${fld:id_detalle};

UPDATE smn_salud.smn_ingresos
   SET igs_monto_moneda_local = (select SUM(smn_salud.smn_ingreso_movimiento.inm_monto_ml) from smn_salud.smn_ingreso_movimiento where smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:id_ingreso}),
   	   igs_monto_moneda_alterna = (select SUM(smn_salud.smn_ingreso_movimiento.inm_monto_ma) from smn_salud.smn_ingreso_movimiento where smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:id_ingreso}),
   	   smn_moneda_rf = ${fld:smn_moneda_alterna}
 WHERE smn_ingresos_id = ${fld:id_ingreso} and 
 	igs_estatus_financiero = 'PE' --and 
 	--smn_ingresos_id = (SELECT smn_ingreso_id FROM smn_salud.smn_ingreso_movimiento WHERE smn_ingresos_mov_id = ${fld:id_detalle} and inm_estatus = 'PR' LIMIT 1);
 