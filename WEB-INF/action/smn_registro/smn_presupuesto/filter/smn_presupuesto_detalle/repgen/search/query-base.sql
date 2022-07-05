select
		smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id,
	${field}
from
	smn_salud.smn_presupuesto_detalle
where
		smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id is not null
	${filter}
	
	
