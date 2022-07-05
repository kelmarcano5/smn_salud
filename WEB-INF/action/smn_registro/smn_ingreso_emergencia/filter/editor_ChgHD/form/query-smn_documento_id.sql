select 
	smn_salud.smn_documento.smn_documento_id as id, 
	smn_salud.smn_documento.doc_codigo || ' - ' || smn_salud.smn_documento.doc_nombre as item 
from 
	smn_salud.smn_documento 
	inner join smn_salud.smn_tipo_documento on
smn_salud.smn_documento.smn_tipo_documento_id = smn_salud.smn_tipo_documento.smn_tipo_documento_id
where smn_salud.smn_tipo_documento.tdc_codigo IN ('EM','HO')
order by smn_salud.smn_documento.doc_nombre
