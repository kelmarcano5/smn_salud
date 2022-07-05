select 
	smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id as afi_auxiliar_rf_ref 
from   
	smn_base.smn_auxiliar_terceros 
where  
	upper(smn_base.smn_auxiliar_terceros.atr_descripcion) = upper(${fld:afi_auxiliar_rf_desc})
