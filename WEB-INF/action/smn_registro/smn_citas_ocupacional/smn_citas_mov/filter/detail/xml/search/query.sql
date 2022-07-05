select
	smn_salud.smn_estatus_citas.eci_descripcion,
	smn_salud.smn_observaciones.obs_descripcion,
	smn_salud.smn_citas.smn_citas_id,
	smn_salud.smn_citas.cts_num_control as cts_num_control_pl0,
	case
	when smn_salud.smn_citas_mov.cts_tipo_orden='Urg' then '${lbl:b_Urgente}'
	when smn_salud.smn_citas_mov.cts_tipo_orden='Con' then '${lbl:b_control}'
	when smn_salud.smn_citas_mov.cts_tipo_orden='Seg' then '${lbl:b_segunda_opinion}'
	end as cts_tipo_orden_combo,
	smn_salud.smn_citas_mov.*
from
	smn_salud.smn_citas_mov
	inner join smn_salud.smn_estatus_citas on smn_salud.smn_estatus_citas.smn_estatus_citas_id = smn_salud.smn_citas_mov.ctm_estatus_id
	left outer join smn_salud.smn_observaciones on smn_salud.smn_observaciones.smn_observaciones_id = smn_salud.smn_citas_mov.ctm_observaciones_id
where
	smn_salud.smn_citas.smn_citas_id=smn_salud.smn_citas_mov.smn_citas_id
	and
	smn_citas_mov_id = ${fld:id}
