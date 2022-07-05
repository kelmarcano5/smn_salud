select	
	*
from 
	smn_salud.smn_afiliado_titular
		left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_afiliado_titular.afi_auxiliar_rf
where 
	smn_afiliados_id = ${fld:id}


