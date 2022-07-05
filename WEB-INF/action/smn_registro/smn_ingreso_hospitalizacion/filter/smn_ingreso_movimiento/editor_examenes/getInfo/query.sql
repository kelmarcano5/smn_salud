select 
	smn_unidades_servicios_rf 
from 
	 smn_base.smn_rel_servicio_area_unidad
where 
	smn_base.smn_rel_servicio_area_unidad.smn_areas_servicios_rf = ${fld:id_area} and
	smn_base.smn_rel_servicio_area_unidad.smn_servicios_id = ${fld:id}