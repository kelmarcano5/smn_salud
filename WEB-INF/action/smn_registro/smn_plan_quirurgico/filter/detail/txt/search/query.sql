select
select
select
select
select
select
select
select
	case
	when smn_salud.smn_plan_quirurgico.plq_estatus='AC' then '${lbl:b_active}'
	when smn_salud.smn_plan_quirurgico.plq_estatus='IIN' then '${lbl:b_inactive}'
	end as plq_estatus,
	smn_salud.smn_plan_quirurgico.*
from
	smn_salud.smn_plan_quirurgico
where
	smn_plan_quirurgico_id = ${fld:id}
