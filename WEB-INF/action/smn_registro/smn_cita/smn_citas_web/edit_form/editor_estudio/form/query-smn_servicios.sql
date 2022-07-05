SELECT 
distinct(smn_base.smn_servicios.smn_servicios_id) as id,
smn_base.smn_servicios.svc_codigo||'-'||smn_base.smn_servicios.svc_descripcion as item
	
from 
	smn_base.smn_servicios,
	smn_base.smn_unidades_servicios
where 
	smn_base.smn_unidades_servicios.smn_unidades_servicios_id = ${fld:id}
