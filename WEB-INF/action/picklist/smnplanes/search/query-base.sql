select	
	smn_salud.smn_planes.*
from
	smn_salud.smn_planes 
where
	smn_planes_id is not null
	${filter}