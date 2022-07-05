select 
	smn_base.smn_auxiliar_persona_natural.smn_auxiliar_persona_natural_id as cts_auxiliar_ref 
from   
	smn_base.smn_auxiliar_persona_natural 
where  
	upper(smn_base.smn_auxiliar_persona_natural.ant_apellidos) = upper(${fld:cts_auxiliar_desc})
