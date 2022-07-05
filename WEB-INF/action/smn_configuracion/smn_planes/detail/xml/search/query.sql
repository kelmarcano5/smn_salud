select
	smn_base.smn_entidades.ent_descripcion_corta,
	smn_salud.smn_contrato_modulo.smn_documento_id,
	case
	when smn_salud.smn_planes.pla_inactivo='S' then '${lbl:b_yes}'
	when smn_salud.smn_planes.pla_inactivo='N' then '${lbl:b_not}'
	end as pla_inactivo_combo,
select
select
	smn_salud.smn_planes.*
from
	smn_salud.smn_planes
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_salud.smn_planes.pla_empresa
	left outer join smn_salud.smn_contrato_modulo on smn_salud.smn_contrato_modulo.smn_contrato_modulo_id = smn_salud.smn_planes.pla_modelo_contrato
where
	smn_planes_id = ${fld:id}
