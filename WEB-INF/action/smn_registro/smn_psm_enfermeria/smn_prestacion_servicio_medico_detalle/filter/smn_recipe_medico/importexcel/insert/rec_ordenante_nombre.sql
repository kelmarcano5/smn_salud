select 
	smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id as rec_ordenante_nombre_ref 
from   
	smn_base.smn_prestadores_servicios 
where  
	upper(smn_base.smn_prestadores_servicios.prs_descripcion) = upper(${fld:rec_ordenante_nombre_desc})
