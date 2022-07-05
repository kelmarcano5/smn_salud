select
		smn_salud.smn_motivos.smn_motivos_id,
	${field}
from
	smn_salud.smn_motivos
where
		smn_salud.smn_motivos.smn_motivos_id is not null
	${filter}
	
	
