select	
	smn_salud.smn_citas.*
from
	smn_salud.smn_citas 
where
	smn_citas_id is not null
	${filter}