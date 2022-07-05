select 
	smn_base.smn_auxiliar.smn_auxiliar_id as coa_ejecutivo_atención_pagador_ref 
from   
	smn_base.smn_auxiliar 
where  
	upper(smn_base.smn_auxiliar.aux_descripcion) = upper(${fld:coa_ejecutivo_atención_pagador_desc})
