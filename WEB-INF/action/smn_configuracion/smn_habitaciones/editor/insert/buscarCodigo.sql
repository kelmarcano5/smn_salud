select
		smn_salud.smn_habitaciones.hab_codigo
from
		smn_salud.smn_habitaciones
where
		upper(smn_salud.smn_habitaciones.hab_codigo) = upper(${fld:hab_codigo})
