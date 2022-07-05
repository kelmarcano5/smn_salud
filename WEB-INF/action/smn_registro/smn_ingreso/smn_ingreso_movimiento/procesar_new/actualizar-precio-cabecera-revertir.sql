update smn_salud.smn_ingreso_movimiento set  
	inm_estatus = 'AC' 
where 
	smn_ingresos_mov_id = ${fld:smn_ingresos_mov_id}; 

update smn_salud.smn_ingresos set 
	(igs_monto_moneda_local,  igs_monto_moneda_alterna) = (select 
																igs_monto_moneda_local - inm_monto_ml, 
																igs_monto_moneda_alterna - inm_monto_ma 
														   from 
														   		smn_salud.smn_ingreso_movimiento 
														   where 
														   		smn_ingresos_mov_id = ${fld:smn_ingresos_mov_id} and 
														   		smn_ingreso_id =${fld:smn_ingreso_id} and 
														   		inm_estatus = 'AC') 
where 
	smn_ingresos_id = ${fld:smn_ingreso_id} and 
 	igs_estatus_financiero = 'PE' 
 	