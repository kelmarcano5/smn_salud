UPDATE smn_salud.smn_ingresos
   SET igs_monto_moneda_local = (select SUM(smn_salud.smn_ingreso_movimiento.inm_monto_ml) from smn_salud.smn_ingreso_movimiento where smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:id_ingreso}),
   	   igs_monto_moneda_alterna = (select SUM(smn_salud.smn_ingreso_movimiento.inm_monto_ma) from smn_salud.smn_ingreso_movimiento where smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:id_ingreso}),
   	   smn_moneda_rf = (select smn_moneda_rf from smn_salud.smn_ingreso_movimiento where smn_salud.smn_ingreso_movimiento.smn_ingreso_id=${fld:id_ingreso} limit 1)
 WHERE smn_ingresos_id = ${fld:id_ingreso} and 
 	smn_salud.smn_ingresos.igs_estatus_financiero = 'PE' 