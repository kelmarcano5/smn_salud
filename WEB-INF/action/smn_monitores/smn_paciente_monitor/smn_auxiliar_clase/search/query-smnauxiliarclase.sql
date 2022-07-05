select
	smn_base.smn_auxiliar_clase.smn_auxiliar_clase_id,
	smn_base.smn_auxiliar.aux_descripcion as smn_auxiliar_id,
	smn_base.smn_clase_auxiliar.cla_nombre as smn_clase_auxiliar_id,
	smn_base.smn_auxiliar_clase.acl_fecha_registro
	
from
	smn_base.smn_auxiliar_clase
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_base.smn_auxiliar_clase.smn_auxiliar_id
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_base.smn_auxiliar_clase.smn_clase_auxiliar_id
where 
	smn_base.smn_auxiliar_clase.smn_auxiliar_id=${fld:id}
