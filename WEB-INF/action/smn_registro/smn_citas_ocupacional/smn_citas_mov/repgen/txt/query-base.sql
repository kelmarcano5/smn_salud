select
	smn_salud.smn_estatus_citas.eci_descripcion,
	smn_salud.smn_observaciones.obs_descripcion,
	${field}
from
	smn_salud.smn_citas_mov
	inner join smn_salud.smn_estatus_citas on smn_salud.smn_estatus_citas.smn_estatus_citas_id = smn_salud.smn_citas_mov.ctm_estatus_id
	left outer join smn_salud.smn_observaciones on smn_salud.smn_observaciones.smn_observaciones_id = smn_salud.smn_citas_mov.ctm_observaciones_id
where
		smn_salud.smn_citas_mov.smn_citas_mov_id is not null
