select
select
select
select
	case
	when smn_salud.smn_solicitud_presupuesto.spr_estatus='SO' then '${lbl:b_solicitado}'
	when smn_salud.smn_solicitud_presupuesto.spr_estatus='GE' then '${lbl:b_generado}'
	when smn_salud.smn_solicitud_presupuesto.spr_estatus='AP' then '${lbl:b_aprobado}'
	when smn_salud.smn_solicitud_presupuesto.spr_estatus='EN' then '${lbl:b_enviado}'
	end as spr_estatus,
	smn_salud.smn_solicitud_presupuesto.*
from
	smn_salud.smn_solicitud_presupuesto
where
	smn_solicitud_presupuesto_id = ${fld:id}
