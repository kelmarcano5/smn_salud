select	
	smn_base.smn_contactos.*
from
	smn_base.smn_contactos 
where
	smn_contactos_id is not null
	${filter}