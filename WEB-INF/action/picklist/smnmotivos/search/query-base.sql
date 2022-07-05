select	
	smn_salud.smn_motivos.*
from
	smn_salud.smn_motivos 
where
	smn_motivos_id is not null
	${filter}