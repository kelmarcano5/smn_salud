UPDATE smn_salud.smn_rel_tipodoc_patologia SET
	smn_tipo_documento_id=${fld:smn_tipo_documento_id},
	smn_patologia_id=${fld:smn_patologia_id}

WHERE
	smn_rel_tipodoc_patologia_id=${fld:id}

