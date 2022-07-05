select
		smn_salud.smn_seguimiento.smn_ingreso_id,
	smn_salud.smn_seguimiento.seg_fecha,
	smn_salud.smn_seguimiento.seg_accion,
	smn_salud.smn_seguimiento.seg_observacion,
	smn_salud.smn_seguimiento.seg_estatus,
	smn_salud.smn_seguimiento.seg_fecha_registro
from
	smn_salud.smn_seguimiento 
where
	smn_salud.smn_seguimiento.smn_seguimiento_id = ${fld:id}
