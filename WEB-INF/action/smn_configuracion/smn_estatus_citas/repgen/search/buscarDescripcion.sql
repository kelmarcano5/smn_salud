select
		smn_salud.smn_estatus_citas.eci_descripcion
from
		smn_salud.smn_estatus_citas
where
		upper(smn_salud.smn_estatus_citas.eci_descripcion) = upper(${fld:eci_descripcion})
