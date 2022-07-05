select
	case
	when smn_salud.smn_seguimiento.seg_estatus=AB then '${lbl:b_open}'
	when smn_salud.smn_seguimiento.seg_estatus=CE then '${lbl:b_close}'
	end as seg_estatus,
	smn_salud.smn_seguimiento.*
from
	smn_salud.smn_seguimiento
where
	smn_seguimiento_id = ${fld:id}
