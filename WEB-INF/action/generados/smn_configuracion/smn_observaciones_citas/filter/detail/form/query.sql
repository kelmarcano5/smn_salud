select
	smn_salud.smn_observaciones_citas.*
from 
	smn_salud.smn_observaciones_citas
where
	smn_observaciones_citas_id = ${fld:id}
