select
select
select
select
select
	case
	when smn_salud.smn_relacion_unidad_paso.rup_estatus='AC' then '${lbl:b_activo}'
	when smn_salud.smn_relacion_unidad_paso.rup_estatus='IN' then '${lbl:b_inactivo}'
	end as rup_estatus_combo,
	smn_salud.smn_relacion_unidad_paso.*
from
	smn_salud.smn_relacion_unidad_paso
where
	smn_rel_unidad_paso = ${fld:id}
