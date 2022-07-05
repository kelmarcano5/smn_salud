select
		smn_salud.smn_tipo_documento_afiliado.tdo_codigo
from
		smn_salud.smn_tipo_documento_afiliado
where
		upper(smn_salud.smn_tipo_documento_afiliado.tdo_codigo) = upper(${fld:tdo_codigo})
