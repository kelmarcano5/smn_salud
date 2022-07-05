select
	smn_salud.smn_citas_servicios.*,
	smn_base.smn_servicios.*
from 
	smn_salud.smn_citas_servicios,
	smn_base.smn_servicios
where 
	smn_salud.smn_citas_servicios.smn_citas_id = ${fld:id} and
	smn_salud.smn_citas_servicios.smn_servicios_id = smn_base.smn_servicios.smn_servicios_id