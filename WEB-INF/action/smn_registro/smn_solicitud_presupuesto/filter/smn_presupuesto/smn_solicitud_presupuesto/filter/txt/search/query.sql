select
		smn_salud.smn_solicitud_presupuesto.smn_solicitud_presupuesto_id,
select
		smn_salud.smn_solicitud_presupuesto.smn_solicitud_presupuesto_id,
select
		smn_salud.smn_solicitud_presupuesto.smn_solicitud_presupuesto_id,
select
		smn_salud.smn_solicitud_presupuesto.smn_solicitud_presupuesto_id,
	case
	when smn_salud.smn_solicitud_presupuesto.spr_estatus='SO' then '${lbl:b_solicitado}'
	when smn_salud.smn_solicitud_presupuesto.spr_estatus='GE' then '${lbl:b_generado}'
	when smn_salud.smn_solicitud_presupuesto.spr_estatus='AP' then '${lbl:b_aprobado}'
	when smn_salud.smn_solicitud_presupuesto.spr_estatus='EN' then '${lbl:b_enviado}'
	end as spr_estatus,
	smn_salud.smn_solicitud_presupuesto.spr_solicitud,
	smn_salud.smn_solicitud_presupuesto.smn_auxiliar,
	smn_salud.smn_solicitud_presupuesto.smn_contratante_id,
	smn_salud.smn_solicitud_presupuesto.smn_patologia_id,
	smn_salud.smn_solicitud_presupuesto.spr_dias_hospitalizacion,
	smn_salud.smn_solicitud_presupuesto.spr_horas_quirofano,
	smn_salud.smn_solicitud_presupuesto.spr_instrumentales,
	smn_salud.smn_solicitud_presupuesto.spr_honorarios,
	smn_salud.smn_solicitud_presupuesto.spr_estatus,
	smn_salud.smn_solicitud_presupuesto.spr_fecha_registro
	
from
	smn_salud.smn_solicitud_presupuesto
