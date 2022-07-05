select 
	smn_base.smn_tipo_cuenta_banco.smn_tipo_cuenta_banco_id as acb_tipo_cta_banco_ref 
from   
	smn_base.smn_tipo_cuenta_banco 
where  
	upper(smn_base.smn_tipo_cuenta_banco.tcb_descripcion) = upper(${fld:acb_tipo_cta_banco_desc})
