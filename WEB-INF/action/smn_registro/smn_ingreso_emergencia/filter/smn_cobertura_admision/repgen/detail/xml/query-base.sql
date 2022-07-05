select
	smn_base.smn_auxiliar.aux_descripcion,
	${field}
from
	smn_salud.smn_cobertura_admision
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_cobertura_admision.coa_ejecutivo_atencion_pagador
where
		smn_salud.smn_cobertura_admision.smn_cobertura_admision_id = ${fld:id}
	
