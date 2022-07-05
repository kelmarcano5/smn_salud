select 
	smn_salud.smn_estatus_citas.smn_estatus_citas_id as inm_estatus_ref 
from   
	smn_salud.smn_estatus_citas 
where  
	upper(smn_salud.smn_estatus_citas.eci_descripcion) = upper(${fld:inm_estatus_desc})
