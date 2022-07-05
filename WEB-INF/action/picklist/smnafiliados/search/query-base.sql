select	
	smn_salud.smn_afiliados.*
from
	smn_salud.smn_afiliados 
where
	smn_v_afiliados_id is not null
	${filter}