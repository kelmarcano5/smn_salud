select
		smn_salud.smn_rel_plan_quirurgico_prestador.smn_rel_plan_quirurgico_prestador_id,
	${field}
from
	smn_salud.smn_rel_plan_quirurgico_prestador
where
		smn_salud.smn_rel_plan_quirurgico_prestador.smn_rel_plan_quirurgico_prestador_id is not null
	${filter}
	
	
