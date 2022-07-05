select
		smn_salud.smn_rel_patologia_servicios.smn_rel_patologia_servicios_id,
	smn_salud.smn_patologia.smn_patologia_id,
	smn_salud.smn_patologia.pat_descripcion as smn_patologia_id,
	smn_base.smn_servicios.svc_descripcion as smn_servicio_rf,
	smn_salud.smn_rel_patologia_servicios.rps_cantidad,
	smn_salud.smn_rel_patologia_servicios.rps_fecha_registro
	
from
	smn_salud.smn_rel_patologia_servicios
	inner join smn_salud.smn_patologia on smn_salud.smn_patologia.smn_patologia_id = smn_salud.smn_rel_patologia_servicios.smn_patologia_id
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_rel_patologia_servicios.smn_servicio_rf
where
	smn_salud.smn_rel_patologia_servicios.smn_patologia_id='${fld:patologia_id}' and smn_rel_patologia_servicios_id is not null
	${filter}
order by
		smn_rel_patologia_servicios_id
