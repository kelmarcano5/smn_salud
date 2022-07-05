select
		smn_salud.smn_dispositivos.smn_dispositivos_id,
	${field}
from
	smn_salud.smn_dispositivos
where
		smn_salud.smn_dispositivos.smn_dispositivos_id is not null
	${filter}
	
	
