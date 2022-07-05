select
		smn_salud.smn_localidad.loc_codigo,
	smn_salud.smn_localidad.loc_descripcion,
	smn_salud.smn_localidad.loc_status,
	smn_salud.smn_localidad.loc_fecha_registro
from
	smn_salud.smn_localidad 
where
	smn_salud.smn_localidad.smn_localidad_id = ${fld:id}
