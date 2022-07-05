select
	smn_salud.smn_coberturas_servicios.*,
	smn_base.smn_unidades_servicios.*
from 
	smn_salud.smn_coberturas_servicios,
	smn_base.smn_unidades_servicios
where 
	smn_salud.smn_coberturas_servicios.smn_coberturas_id = ${fld:id} and
	smn_salud.smn_coberturas_servicios.smn_unidades_servicios_id = smn_base.smn_unidades_servicios.smn_unidades_servicios_id