select
		smn_salud.smn_localidad.loc_codigo
from
		smn_salud.smn_localidad
where
		upper(smn_salud.smn_localidad.loc_codigo) = upper(${fld:loc_codigo})
