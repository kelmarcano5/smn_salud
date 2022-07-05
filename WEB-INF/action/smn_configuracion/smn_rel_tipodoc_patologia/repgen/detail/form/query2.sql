select
		smn_salud.smn_rel_tipodoc_patologia.smn_tipo_documento_id,
	smn_salud.smn_rel_tipodoc_patologia.smn_patologia_id
from
	smn_salud.smn_rel_tipodoc_patologia 
where
	smn_salud.smn_rel_tipodoc_patologia.smn_rel_tipodoc_patologia_id = ${fld:id}
