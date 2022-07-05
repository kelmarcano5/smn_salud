select 
	smn_salud.smn_estatus_citas.smn_estatus_citas_id as ctm_estatus_id_ref 
from   
	smn_salud.smn_estatus_citas 
where  
	upper(smn_salud.smn_estatus_citas.eci_descripcion) = upper(${fld:ctm_estatus_id_desc})
