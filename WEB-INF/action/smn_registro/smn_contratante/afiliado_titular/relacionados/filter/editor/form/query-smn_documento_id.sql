select smn_salud.smn_documento.smn_documento_id as id, 
smn_salud.smn_documento.doc_codigo|| ' - ' || smn_salud.smn_documento.doc_nombre as item 
from smn_salud.smn_documento 
where smn_salud.smn_documento.smn_tipo_documento_id=1
order by smn_salud.smn_documento.doc_nombre