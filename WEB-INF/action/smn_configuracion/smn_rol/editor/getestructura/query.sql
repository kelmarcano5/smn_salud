SELECT 
	smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id as id,
	smn_base.smn_estructura_organizacional.eor_codigo|| ' - ' || smn_base.smn_estructura_organizacional.eor_nombre as item,
	smn_base.smn_entidades.smn_entidades_id
FROM 
	smn_base.smn_estructura_organizacional
	left OUTER join smn_base.smn_rel_entidad_estructura on 
		smn_base.smn_estructura_organizacional.smn_configuracion_estructura_id = smn_base.smn_rel_entidad_estructura.smn_configuracion_estructura_id
	inner join smn_base.smn_entidades on 
		smn_base.smn_entidades.smn_entidades_id=smn_base.smn_rel_entidad_estructura.smn_entidades_id
WHERE
	smn_base.smn_rel_entidad_estructura.smn_entidades_id=${fld:id}