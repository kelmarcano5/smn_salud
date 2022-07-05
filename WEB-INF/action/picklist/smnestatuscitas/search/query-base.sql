select	
	smn_salud.smn_estatus_citas.*
from
	smn_salud.smn_estatus_citas 
where
	smn_estatus_citas_id is not null
	${filter}