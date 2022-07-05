UPDATE smn_salud.smn_ingresos
   SET smn_salud.smn_ingresos.igs_monto_moneda_local = (select SUM(smn_salud.smn_ingreso_movimiento.inm_monto_ml) from smn_salud.smn_ingreso_movimiento where smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:id_ingreso}),
   	   smn_salud.smn_ingresos.igs_monto_moneda_alterna = (select SUM(smn_salud.smn_ingreso_movimiento.inm_monto_ma) from smn_salud.smn_ingreso_movimiento where smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:id_ingreso}),
   	   smn_salud.smn_ingresos.smn_moneda_rf = ${fld:smn_moneda_rf}
 WHERE smn_ingresos_id = ${fld:id_ingreso} and 
 	smn_salud.smn_ingresos.igs_estatus_financiero = 'PE' 