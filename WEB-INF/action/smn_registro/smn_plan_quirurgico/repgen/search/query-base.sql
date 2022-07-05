select
		smn_salud.smn_plan_quirurgico.smn_plan_quirurgico_id,
	${field}
from
	smn_salud.smn_plan_quirurgico
where
		smn_salud.smn_plan_quirurgico.smn_plan_quirurgico_id is not null
	${filter}
	
	
