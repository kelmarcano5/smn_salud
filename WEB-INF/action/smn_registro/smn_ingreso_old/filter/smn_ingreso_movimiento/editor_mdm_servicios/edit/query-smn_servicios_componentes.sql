select
	smn_base.smn_servicios_componentes.*,
	smn_base.smn_servicios.*
from 
	smn_base.smn_servicios_componentes,
	smn_base.smn_servicios
where 
	smn_base.smn_servicios_componentes.smn_componentes_id = ${fld:id} and
	smn_base.smn_servicios_componentes.smn_servicios_id = smn_base.smn_servicios.smn_servicios_id