select
	smn_base.smn_v_auxiliar.smn_item,
	smn_base.smn_clase_auxiliar.cla_nombre,
		smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id,
	${field}
from
	smn_salud.smn_ordenes_medicas
	left outer join smn_base.smn_v_auxiliar on smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_salud.smn_ordenes_medicas.omd_auxiliar
	left outer join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_ordenes_medicas.omd_clase_auxiliar
where
		smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id is not null
	${filter}
	
	
