select
		smn_salud.smn_localidad.loc_descripcion
from
		smn_salud.smn_localidad
where
		upper(smn_salud.smn_localidad.loc_descripcion) = upper(${fld:loc_descripcion})
