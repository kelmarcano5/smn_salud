select	
	smn_salud.smn_acciones.acc_codigo,
	smn_salud.smn_acciones.acc_descripcion,
	smn_salud.smn_acciones.acc_fecha_registro,
	smn_salud.smn_acciones.smn_acciones_id

from
	smn_salud.smn_acciones
where
	smn_acciones_id is not null	
 	 	${filter}
order by 
	smn_acciones_id