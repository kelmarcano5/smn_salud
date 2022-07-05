select
	smn_salud.smn_estatus_citas.eci_descripcion,
	${field}
from
	smn_salud.smn_estatus_citas,
	smn_salud.smn_ingreso_movimiento
where
	smn_salud.smn_estatus_citas.smn_estatus_citas_id = smn_salud.smn_ingreso_movimiento.inm_estatus and
		smn_salud.smn_ingreso_movimiento.smn_ingreso_movimiento_id is not null
