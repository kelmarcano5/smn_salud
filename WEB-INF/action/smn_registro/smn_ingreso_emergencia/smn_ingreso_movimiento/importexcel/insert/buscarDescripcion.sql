select
		smn_salud.smn_ingreso_movimiento.inm_ordenante_descripcion
from
		smn_salud.smn_ingreso_movimiento
where
		upper(smn_salud.smn_ingreso_movimiento.inm_ordenante_descripcion) = upper(${fld:inm_ordenante_descripcion})
