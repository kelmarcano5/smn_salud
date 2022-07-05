select 
	smn_salud.smn_contrato_modulo.smn_contrato_modulo_id as pla_modelo_contrato_ref 
from   
	smn_salud.smn_contrato_modulo 
where  
	upper(smn_salud.smn_contrato_modulo.smn_documento_id) = upper(${fld:pla_modelo_contrato_desc})
