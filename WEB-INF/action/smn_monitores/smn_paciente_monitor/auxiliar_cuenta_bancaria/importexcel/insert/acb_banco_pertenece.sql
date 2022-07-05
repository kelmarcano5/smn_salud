select 
	smn_base.smn_entidades_financieras.smn_entidades_financieras_id as acb_banco_pertenece_ref 
from   
	smn_base.smn_entidades_financieras 
where  
	upper(smn_base.smn_entidades_financieras.efi_nombre) = upper(${fld:acb_banco_pertenece_desc})
