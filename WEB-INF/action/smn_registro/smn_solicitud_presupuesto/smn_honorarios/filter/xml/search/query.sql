select
		smn_salud.smn_plan_quirurgico.smn_plan_quirurgico_id,
select
		smn_salud.smn_plan_quirurgico.smn_plan_quirurgico_id,
select
		smn_salud.smn_plan_quirurgico.smn_plan_quirurgico_id,
select
		smn_salud.smn_plan_quirurgico.smn_plan_quirurgico_id,
select
		smn_salud.smn_plan_quirurgico.smn_plan_quirurgico_id,
select
		smn_salud.smn_plan_quirurgico.smn_plan_quirurgico_id,
select
		smn_salud.smn_plan_quirurgico.smn_plan_quirurgico_id,
select
		smn_salud.smn_plan_quirurgico.smn_plan_quirurgico_id,
	case
	when smn_salud.smn_plan_quirurgico.plq_estatus='AC' then '${lbl:b_active}'
	when smn_salud.smn_plan_quirurgico.plq_estatus='IIN' then '${lbl:b_inactive}'
	end as plq_estatus,
	smn_salud.smn_plan_quirurgico.smn_entidad_rf,
	smn_salud.smn_plan_quirurgico.smn_sucursal_rf,
	smn_salud.smn_plan_quirurgico.smn_habitaciones_id,
	smn_salud.smn_plan_quirurgico.smn_contratante_id,
	smn_salud.smn_plan_quirurgico.smn_clase_auxiliar_rf,
	smn_salud.smn_plan_quirurgico.smn_auxiliar_rf,
	smn_salud.smn_plan_quirurgico.smn_patologia_rf,
	smn_salud.smn_plan_quirurgico.plq_fecha_cirugia,
	smn_salud.smn_plan_quirurgico.plq_hora_inicial,
	smn_salud.smn_plan_quirurgico.plq_hora_final,
	smn_salud.smn_plan_quirurgico.plq_cantidad_horas,
	smn_salud.smn_plan_quirurgico.plq_estatus,
	smn_salud.smn_plan_quirurgico.plq_fecha_registro
	
from
	smn_salud.smn_plan_quirurgico
