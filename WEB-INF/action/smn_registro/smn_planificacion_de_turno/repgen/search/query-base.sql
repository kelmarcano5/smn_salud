select
		smn_salud.smn_planificacion_de_turno.smn_planificacion_de_turno_id,
	${field}
from
	smn_salud.smn_planificacion_de_turno
where
		smn_salud.smn_planificacion_de_turno.smn_planificacion_de_turno_id is not null
	${filter}
	
	
