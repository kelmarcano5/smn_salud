UPDATE smn_salud.smn_solicitud_presupuesto SET
	spr_estatus='GE'
WHERE
	smn_solicitud_presupuesto_id=${fld:id}