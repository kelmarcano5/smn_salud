select 
	smn_base.smn_tipos_servicios.smn_tipos_servicios_id as hab_tipo_servicio_ref 
from   
	smn_base.smn_tipos_servicios 
where  
	upper(smn_base.smn_tipos_servicios.tsr_descripcion) = upper(${fld:hab_tipo_servicio_desc})
