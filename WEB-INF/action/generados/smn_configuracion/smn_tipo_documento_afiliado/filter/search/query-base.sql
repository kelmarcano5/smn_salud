select	
	smn_salud.smn_tipo_documento_afiliado.tdo_codigo,
	smn_salud.smn_tipo_documento_afiliado.tdo_descripcion,
	smn_salud.smn_tipo_documento_afiliado.tdo_idioma,
	smn_salud.smn_tipo_documento_afiliado.tdo_usuario,
	smn_salud.smn_tipo_documento_afiliado.tdo_fecha_registro,
	smn_salud.smn_tipo_documento_afiliado.tdo_hora,
	smn_salud.smn_tipo_documento_afiliado.smn_tipo_documento_afiliado_id

from
	smn_salud.smn_tipo_documento_afiliado
where
	smn_tipo_documento_afiliado_id is not null	
 	 	${filter}
order by 
	smn_tipo_documento_afiliado_id