select	
	smn_base.smn_servicios.smn_servicios_id,
	smn_base.smn_servicios.svc_codigo,
	smn_base.smn_servicios.svc_descripcion,
	smn_base.smn_tipos_servicios.tsr_codigo||'-'|| smn_base.smn_tipos_servicios.tsr_descripcion as svc_tipo_servicio,
	smn_base.smn_servicios.svc_inactivo
	
from
	smn_base.smn_servicios 
	left join smn_base.smn_tipos_servicios on smn_base.smn_tipos_servicios.smn_tipos_servicios_id = smn_base.smn_servicios.smn_tipo_servicio_rf
	left join smn_base.smn_rel_servicio_area_unidad on smn_base.smn_rel_servicio_area_unidad.smn_servicios_id = smn_base.smn_servicios.smn_servicios_id
where
	smn_base.smn_servicios.smn_servicios_id is not null
	${filter}