select 
	smn_base.smn_v_auxiliar.smn_v_auxiliar_id as cts_auxiliar_ref 
from   
	smn_base.smn_v_auxiliar 
where  
	upper(smn_base.smn_v_auxiliar.smn_item) = upper(${fld:cts_auxiliar_desc})
