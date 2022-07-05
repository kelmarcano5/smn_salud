select
		smn_salud.smn_tipo_documento_afiliado.tdo_codigo,
	smn_salud.smn_tipo_documento_afiliado.tdo_descripcion,
	smn_salud.smn_tipo_documento_afiliado.tdo_fecha_registro
from
	smn_salud.smn_tipo_documento_afiliado 
where
	smn_salud.smn_tipo_documento_afiliado.smn_tipo_documento_afiliado_id = ${fld:id}
