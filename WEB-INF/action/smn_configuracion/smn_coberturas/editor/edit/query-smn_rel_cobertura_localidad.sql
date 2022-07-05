select
	smn_salud.smn_rel_cobertura_localidad.*,
	smn_salud.smn_localidad.*
from 
	smn_salud.smn_rel_cobertura_localidad,
	smn_salud.smn_localidad
where 
	smn_salud.smn_rel_cobertura_localidad.smn_coberturas_id = ${fld:id} and
	smn_salud.smn_rel_cobertura_localidad.smn_localidad_id = smn_salud.smn_localidad.smn_localidad_id