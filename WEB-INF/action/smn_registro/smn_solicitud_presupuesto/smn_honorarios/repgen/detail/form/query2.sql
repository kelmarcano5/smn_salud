select
		smn_salud.smn_plan_quirurgico.smn_entidad_rf,
	smn_salud.smn_plan_quirurgico.smn_sucursal_rf,
	smn_salud.smn_plan_quirurgico.smn_habitaciones_id,
	smn_salud.smn_plan_quirurgico.smn_presupuesto_id,
	smn_salud.smn_plan_quirurgico.smn_contratante_id,
	smn_salud.smn_plan_quirurgico.smn_clase_auxiliar_rf,
	smn_salud.smn_plan_quirurgico.smn_auxiliar_rf,
	smn_salud.smn_plan_quirurgico.smn_patologia_rf,
	smn_salud.smn_plan_quirurgico.plq_fecha_cirugia,
	smn_salud.smn_plan_quirurgico.plq_observaciones,
	smn_salud.smn_plan_quirurgico.plq_estatus,
	smn_salud.smn_plan_quirurgico.plq_fecha_registro
from
	smn_salud.smn_plan_quirurgico 
where
	smn_salud.smn_plan_quirurgico.smn_plan_quirurgico_id = ${fld:id}
