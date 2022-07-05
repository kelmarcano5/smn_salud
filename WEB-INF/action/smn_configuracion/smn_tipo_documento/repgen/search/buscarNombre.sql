select
		smn_salud.smn_tipo_documento.tdc_nombre
from
		smn_salud.smn_tipo_documento
where
		upper(smn_salud.smn_tipo_documento.tdc_nombre) = upper(${fld:tdc_nombre})
