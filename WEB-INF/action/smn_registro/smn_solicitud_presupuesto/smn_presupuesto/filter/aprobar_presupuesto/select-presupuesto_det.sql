select 
	smn_salud.smn_presupuesto_detalle.*, 
	${fld:smn_ingresos_id} as smn_ingresos_id, 
	${fld:smn_clase_rf} as smn_clase_auxiliar_rf, 
	${fld:smn_auxiliar_rf} as smn_auxiliar_rf 
from 
	smn_salud.smn_presupuesto_detalle 
where 
	smn_salud.smn_presupuesto_detalle.smn_presupuesto_id=${fld:smn_presupuesto_id};