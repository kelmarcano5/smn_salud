select
	smn_base.smn_entidades.ent_descripcion_corta,
	smn_salud.smn_planes.smn_planes_id,
	case
	when smn_salud.smn_planes.pla_inactivo='S' then '${lbl:b_yes}'
	when smn_salud.smn_planes.pla_inactivo='N' then '${lbl:b_not}'
	end as pla_inactivo_combo,
	smn_salud.smn_planes.smn_planes_id,
	smn_salud.smn_planes.pla_codigo,
	smn_salud.smn_planes.pla_descripcion,
	smn_salud.smn_planes.pla_vigencia_desde,
	smn_salud.smn_planes.pla_vigencia_hasta,
	smn_salud.smn_planes.pla_inactivo,
	smn_salud.smn_planes.pla_fecha_registro
	
from
	smn_salud.smn_planes
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_salud.smn_planes.pla_empresa
	