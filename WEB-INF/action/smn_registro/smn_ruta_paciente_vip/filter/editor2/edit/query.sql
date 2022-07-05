select	
	*
from 
	smn_salud.smn_ruta_paciente
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id  = smn_salud.smn_ruta_paciente.smn_auxiliar_rf
	left outer join smn_base.smn_tipo_doc_oficial on smn_base.smn_tipo_doc_oficial.smn_tipo_doc_oficial_id = smn_base.smn_auxiliar.aux_tipo_doc_oficial_rf
where 
	smn_ruta_id = ${fld:id}


