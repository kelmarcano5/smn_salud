select 
	smn_base.smn_unidad_medida.smn_unidad_medida_id as cob_unidad_tiempo_rf_ref 
from   
	smn_base.smn_unidad_medida 
where  
	upper(smn_base.smn_unidad_medida.unm_descripcion) = upper(${fld:cob_unidad_tiempo_rf_desc})
