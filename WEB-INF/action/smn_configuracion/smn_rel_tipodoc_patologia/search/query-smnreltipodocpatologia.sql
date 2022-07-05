select
	smn_salud.smn_rel_tipodoc_patologia.smn_rel_tipodoc_patologia_id,
	smn_salud.smn_tipo_documento.tdc_codigo ||' - '|| smn_salud.smn_tipo_documento.tdc_nombre as smn_tipo_documento_id,
	smn_salud.smn_patologia.pat_codigo ||' - '|| smn_salud.smn_patologia.pat_descripcion as smn_patologia_id
from
	smn_salud.smn_rel_tipodoc_patologia
	inner join smn_salud.smn_tipo_documento on smn_salud.smn_tipo_documento.smn_tipo_documento_id = smn_salud.smn_rel_tipodoc_patologia.smn_tipo_documento_id
	inner join smn_salud.smn_patologia on smn_salud.smn_patologia.smn_patologia_id = smn_salud.smn_rel_tipodoc_patologia.smn_patologia_id
