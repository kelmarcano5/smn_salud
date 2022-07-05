select
		smn_salud.smn_ingreso_movimiento.smn_servicios_rf
from
		smn_salud.smn_ingreso_movimiento
where
		smn_salud.smn_ingreso_movimiento.smn_servicios_rf = ${fld:smn_servicios_rf} and 
		smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:smn_ingreso_id}
