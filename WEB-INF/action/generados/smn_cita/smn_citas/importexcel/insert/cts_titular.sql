select 
	smn_salud.smn_afiliados.smn_afiliados_id as cts_titular_ref 
from   
	smn_salud.smn_afiliados 
where  
	upper(smn_salud.smn_afiliados.afi_apellidos) = upper(${fld:cts_titular_desc})
