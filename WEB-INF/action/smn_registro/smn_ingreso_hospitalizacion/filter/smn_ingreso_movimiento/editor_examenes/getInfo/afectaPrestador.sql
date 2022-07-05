select 
	svc_req_prestador
from 
	smn_base.smn_servicios
where
	smn_base.smn_servicios.smn_servicios_id = ${fld:id}