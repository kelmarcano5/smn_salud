select	
	smn_salud.smn_coberturas.*
from
	smn_salud.smn_coberturas 
where
	smn_coberturas_id is not null
	${filter}