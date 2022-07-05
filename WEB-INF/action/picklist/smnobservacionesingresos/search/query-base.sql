select	
	smn_salud.smn_observaciones_ingresos.*
from
	smn_salud.smn_observaciones_ingresos 
where
	smn_observaciones_ingresos_id is not null
	${filter}