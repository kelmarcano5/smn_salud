select	
	smn_salud.smn_origen.*
from
	smn_salud.smn_origen 
where
	smn_origen_id is not null
	${filter}