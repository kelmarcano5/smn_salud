select	
	*
from 
	smn_salud.smn_presupuesto_detalle
where 
	smn_presupuesto_detalle_id = ${fld:id} 
	--and smn_salud.smn_presupuesto_detalle.smn_tipo_componentes_rf='IT'


