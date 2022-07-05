select
	smn_salud.smn_ingreso_movimiento.*,
	smn_base.smn_servicios.*
from 
	smn_salud.smn_ingreso_movimiento,
	smn_base.smn_servicios
where 
	smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:id} and
	smn_salud.smn_ingreso_movimiento.smn_servicios_rf = smn_base.smn_servicios.smn_servicios_id