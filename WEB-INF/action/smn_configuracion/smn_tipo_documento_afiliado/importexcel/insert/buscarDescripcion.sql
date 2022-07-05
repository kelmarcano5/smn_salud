select
		smn_salud.smn_tipo_documento_afiliado.tdo_descripcion
from
		smn_salud.smn_tipo_documento_afiliado
where
		upper(smn_salud.smn_tipo_documento_afiliado.tdo_descripcion) = upper(${fld:tdo_descripcion})
