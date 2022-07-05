select 
	smn_salud.smn_documento.smn_documento_id
from 
	smn_salud.smn_documento 
where 
	smn_salud.smn_documento.smn_documento_id=${fld:smn_documento_id}
