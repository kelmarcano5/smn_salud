select
		smn_salud.smn_habitaciones.hab_descripcion
from
		smn_salud.smn_habitaciones
where
		upper(smn_salud.smn_habitaciones.hab_descripcion) = upper(${fld:hab_descripcion})
