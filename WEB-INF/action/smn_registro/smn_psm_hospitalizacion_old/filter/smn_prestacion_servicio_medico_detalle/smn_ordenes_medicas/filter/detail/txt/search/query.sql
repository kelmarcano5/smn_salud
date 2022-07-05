select
select
select
select
	smn_base.smn_v_auxiliar.smn_item,
	smn_base.smn_clase_auxiliar.cla_nombre,
	case
	when smn_salud.smn_ordenes_medicas.omd_tipo_orden='UG' then '${lbl:b_urgente}'
	when smn_salud.smn_ordenes_medicas.omd_tipo_orden='NR' then '${lbl:b_normal}'
	end as omd_tipo_orden,
	smn_salud.smn_ordenes_medicas.*
from
	smn_salud.smn_ordenes_medicas
	left outer join smn_base.smn_v_auxiliar on smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_salud.smn_ordenes_medicas.omd_auxiliar
	left outer join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_ordenes_medicas.omd_clase_auxiliar
where
	smn_ordenes_medicas_id = ${fld:id}
