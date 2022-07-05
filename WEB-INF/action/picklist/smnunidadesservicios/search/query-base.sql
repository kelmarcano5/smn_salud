select	
	smn_base.smn_unidades_servicios.*
from
	smn_base.smn_unidades_servicios 
where
	smn_unidades_servicios_id is not null
	${filter}