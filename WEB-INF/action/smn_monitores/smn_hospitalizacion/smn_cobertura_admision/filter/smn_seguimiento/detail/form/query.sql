select
		smn_salud.smn_seguimiento.smn_seguimiento_id,
	case
	when smn_salud.smn_seguimiento.seg_estatus='AB' then '${lbl:b_open}'
	when smn_salud.smn_seguimiento.seg_estatus='CE' then '${lbl:b_close}'
	end as seg_estatus,
	smn_salud.smn_seguimiento.smn_ingreso_id,
	smn_salud.smn_seguimiento.seg_fecha,
	smn_salud.smn_seguimiento.seg_hora_seg,
	smn_salud.smn_acciones.acc_descripcion as seg_accion,
	smn_salud.smn_seguimiento.seg_observacion,
	smn_salud.smn_seguimiento.seg_fecha_registro
	
from
	smn_salud.smn_seguimiento
	inner join smn_salud.smn_acciones on smn_salud.smn_acciones.smn_acciones_id= smn_salud.smn_seguimiento.seg_accion

where
	smn_seguimiento_id = ${fld:id}
