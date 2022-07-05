select 
	svc_req_prestador
from 
	smn_base.smn_servicios
where
	smn_base.smn_servicios.smn_servicios_id = ${fld:smn_servicios_rf} and 
	svc_req_prestador != 'S' and
	'${fld:smn_prestador_servicio_rf}'  = 'NULL'
	