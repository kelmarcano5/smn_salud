select
	doc_contenido as content_type, 
	doc_desc_documento as filename
from smn_salud.smn_documento_afiliados
where smn_documento_afiliados_id = ${fld:id}
