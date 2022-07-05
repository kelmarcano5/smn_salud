select
	doc_datos as image_data
from smn_salud.smn_documento_afiliados
where smn_documento_afiliados_id = ${fld:id}
