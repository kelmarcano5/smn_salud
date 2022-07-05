select
		smn_salud.smn_documento.smn_documento_id,
	${field}
from
	smn_salud.smn_documento
where
		smn_salud.smn_documento.smn_documento_id is not null
	${filter}
	
	
