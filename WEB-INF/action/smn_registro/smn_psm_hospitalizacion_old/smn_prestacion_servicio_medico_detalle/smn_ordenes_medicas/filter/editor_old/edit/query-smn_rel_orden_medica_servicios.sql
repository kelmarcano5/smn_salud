select smn_base.smn_servicios.*
from smn_salud.smn_rel_orden_medica_servicios
left outer join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id =smn_salud.smn_rel_orden_medica_servicios.smn_servicios_rf
where smn_salud.smn_rel_orden_medica_servicios.smn_ordenes_medicas_id=${fld:id} order by smn_base.smn_servicios.svc_codigo desc