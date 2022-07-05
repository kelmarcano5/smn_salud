select	
	smn_salud.smn_tipo_documento_afiliado.*
from
	smn_salud.smn_tipo_documento_afiliado 
where
	smn_tipo_documento_afiliado_id is not null
	${filter}