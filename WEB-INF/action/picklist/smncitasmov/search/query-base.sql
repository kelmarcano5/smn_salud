select	
	smn_salud.smn_citas_mov.*
from
	smn_salud.smn_citas_mov 
where
	smn_citas_mov_id is not null
	${filter}