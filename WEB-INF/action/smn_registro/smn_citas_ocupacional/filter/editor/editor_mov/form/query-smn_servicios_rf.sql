select smn_base.smn_servicios.smn_servicios_id as id, smn_base.smn_servicios.svc_codigo || ' - ' || smn_base.smn_servicios.svc_descripcion as item 
from smn_base.smn_servicios 
inner join smn_base.smn_rel_servicio_area_unidad on smn_base.smn_rel_servicio_area_unidad.smn_servicios_id = smn_base.smn_servicios.smn_servicios_id
order by smn_base.smn_servicios.svc_descripcion