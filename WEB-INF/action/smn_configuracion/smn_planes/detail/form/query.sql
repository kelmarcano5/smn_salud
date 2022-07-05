select
	smn_base.smn_entidades.ent_descripcion_corta,
	(select smn_base.smn_entidades.ent_codigo || ' - ' || smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades  where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_salud.smn_planes.pla_empresa  order by smn_base.smn_entidades.ent_descripcion_corta ) as ent_descripcion_corta_combo,
	case
	when smn_salud.smn_planes.pla_inactivo='S' then '${lbl:b_yes}'
	when smn_salud.smn_planes.pla_inactivo='N' then '${lbl:b_not}'
	end as pla_inactivo_combo,
	smn_salud.smn_planes.*
from
	smn_salud.smn_planes
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_salud.smn_planes.pla_empresa
where
	smn_planes_id = ${fld:id}
