select
	smn_auxiliar_id
from 
	smn_base.smn_auxiliar
where 
	smn_auxiliar_id = ${fld:cts_auxiliar} and 
	aux_codigo = ${fld:icv_numero_documento_identidad}
