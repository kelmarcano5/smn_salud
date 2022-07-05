select
	(select smn_salud.smn_tipo_documento.tdc_codigo || ' - ' || smn_salud.smn_tipo_documento.tdc_descripcion from  smn_salud.smn_tipo_documento  where smn_salud.smn_tipo_documento.smn_tipo_documento_id is not null  and smn_salud.smn_tipo_documento.smn_tipo_documento_id=smn_salud.smn_rel_tipodoc_patologia.smn_tipo_documento_id  order by smn_salud.smn_tipo_documento.tdc_descripcion asc ) as smn_tipo_documento_id_combo,
	(select smn_salud.smn_patologia.pat_codigo || ' - ' ||smn_salud.smn_patologia.pat_descripcion from  smn_salud.smn_patologia ORDER BY smn_salud.smn_patologia.pat_codigo asc where smn_salud.smn_patologia.smn_patologia_id is not null  and smn_salud.smn_patologia.smn_patologia_id=smn_salud.smn_rel_tipodoc_patologia.smn_patologia_id) as smn_patologia_id_combo,
	smn_salud.smn_rel_tipodoc_patologia.*
from 
	smn_salud.smn_rel_tipodoc_patologia
where
	smn_rel_tipodoc_patologia_id = ${fld:id}
