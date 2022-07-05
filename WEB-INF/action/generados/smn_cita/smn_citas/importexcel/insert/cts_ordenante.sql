select 
	smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id as cts_ordenante_ref 
from   
	smn_base.smn_prestadores_servicios 
where  
	upper(smn_base.smn_prestadores_servicios.prs_apellidos) = upper(${fld:cts_ordenante_desc})
