select
		smn_salud.smn_tipo_documento.tdc_codigo
from
		smn_salud.smn_tipo_documento
where
		upper(smn_salud.smn_tipo_documento.tdc_codigo) = upper(${fld:tdc_codigo})
