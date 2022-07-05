update smn_salud.smn_ingreso_movimiento set  
	inm_cantidad = ${fld:cantidad}, 
	inm_precio_ml =  ${fld:smn_precio_neto_ml_servicio}, 
	inm_monto_ml =  ${fld:inm_monto_ml}, 
	inm_precio_ma =  ${fld:smn_precio_neto_ma_servicio}, 
	inm_monto_ma = ${fld:inm_monto_ma}, 
	smn_moneda_rf = ${fld:smn_moneda_alterna}, 
	smn_tasa_rf = ${fld:smn_tasas_de_cambio_id}, 
	inm_estatus = 'AC' 
where 
	smn_ingresos_mov_id = ${fld:id_detalle};

update smn_salud.smn_ingresos set 
	igs_monto_moneda_local = (select 
							  	sum(smn_salud.smn_ingreso_movimiento.inm_monto_ml) 
							  from 
							  	smn_salud.smn_ingreso_movimiento 
							  where 
							  	smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:id_ingreso}),
   	igs_monto_moneda_alterna = (select 
   									sum(smn_salud.smn_ingreso_movimiento.inm_monto_ma) 
   								from 
   									smn_salud.smn_ingreso_movimiento 
   								where 
   									smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:id_ingreso}),
   	smn_moneda_rf = ${fld:smn_moneda_alterna} 
 where 
 	smn_ingresos_id = ${fld:id_ingreso} and 
 	igs_estatus_financiero = 'PE' and 
 	smn_ingresos_id = (select 
 						 smn_ingreso_id 
 					   from 
 					   	 smn_salud.smn_ingreso_movimiento 
 					   where 
 					   	 smn_ingresos_mov_id = ${fld:id_detalle} and 
 					   	 inm_estatus = 'AC');
 