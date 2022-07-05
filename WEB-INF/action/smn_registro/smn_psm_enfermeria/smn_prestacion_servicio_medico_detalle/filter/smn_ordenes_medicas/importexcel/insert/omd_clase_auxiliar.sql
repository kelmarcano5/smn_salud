select 
	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id as omd_clase_auxiliar_ref 
from   
	smn_base.smn_clase_auxiliar 
where  
	upper(smn_base.smn_clase_auxiliar.cla_nombre) = upper(${fld:omd_clase_auxiliar_desc})
