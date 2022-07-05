select
		smn_salud.smn_presupuesto_componente.smn_presupuesto_componente_id,
	${field}
from
	smn_salud.smn_presupuesto_componente
where
		smn_salud.smn_presupuesto_componente.smn_presupuesto_componente_id is not null
	${filter}
	
	
