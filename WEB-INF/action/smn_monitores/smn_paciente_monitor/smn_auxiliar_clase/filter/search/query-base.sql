select
		smn_base.smn_auxiliar_clase.smn_auxiliar_clase_id,
	smn_base.smn_v_auxiliar.smn_item as smn_auxiliar_id,
	smn_base.smn_clase_auxiliar.cla_nombre as smn_clase_auxiliar_id,
	smn_base.smn_auxiliar_clase.acl_fecha_registro
	
from
	smn_base.smn_auxiliar_clase
	inner join smn_base.smn_v_auxiliar on smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_base.smn_auxiliar_clase.smn_auxiliar_id
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_base.smn_auxiliar_clase.smn_clase_auxiliar_id
where
	smn_auxiliar_clase_id is not null
	${filter}
order by
		smn_auxiliar_clase_id
