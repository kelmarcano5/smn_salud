select
	(select smn_base.smn_servicios.svc_codigo || ' - ' || smn_base.smn_servicios.svc_descripcion from  smn_base.smn_servicios  where smn_base.smn_servicios.smn_servicios_id is not null  and smn_base.smn_servicios.smn_servicios_id=smn_salud.smn_patologia.smn_servicio_rf  order by smn_base.smn_servicios.svc_descripcion ) as smn_servicio_rf,
	smn_salud.smn_rel_patologia_servicios.*
from 
	smn_salud.smn_rel_patologia_servicios,
	smn_salud.smn_patologia
where
	smn_salud.smn_rel_patologia_servicios.smn_patologia_id=smn_salud.smn_patologia.smn_patologia_id and 
	smn_salud.smn_patologia.smn_patologia_id=${fld:id}
