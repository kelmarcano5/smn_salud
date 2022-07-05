select
	smn_salud.smn_rel_cobertura_horario.*,
	smn_salud.smn_horario.*
from 
	smn_salud.smn_rel_cobertura_horario,
	smn_salud.smn_horario
where 
	smn_salud.smn_rel_cobertura_horario.smn_coberturas_id = ${fld:id} and
	smn_salud.smn_rel_cobertura_horario.smn_horarios_id = smn_salud.smn_horario.smn_horarios_id