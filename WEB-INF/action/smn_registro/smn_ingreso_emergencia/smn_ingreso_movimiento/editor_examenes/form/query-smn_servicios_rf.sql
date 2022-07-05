select 
	smn_base.smn_servicios.smn_servicios_id as id, 
	smn_base.smn_servicios.svc_descripcion as item 
from 
	smn_base.smn_servicios
inner join smn_base.smn_rel_servicio_area_unidad on
	smn_base.smn_servicios.smn_servicios_id = smn_base.smn_rel_servicio_area_unidad.smn_servicios_id
inner join smn_base.smn_tipos_servicios on
	smn_base.smn_servicios.smn_tipo_servicio_rf = smn_base.smn_tipos_servicios.smn_tipos_servicios_id
where smn_base.smn_rel_servicio_area_unidad.smn_areas_servicios_rf = ${fld:id_area} and 
	  smn_base.smn_tipos_servicios.tsr_codigo != '004'
order by smn_base.smn_servicios.svc_descripcion