select
	smn_salud.smn_relacion_horario_tramos.*,
	smn_salud.smn_tramos.*
from 
	smn_salud.smn_relacion_horario_tramos,
	smn_salud.smn_tramos
where 
	smn_salud.smn_relacion_horario_tramos.smn_horarios_id = ${fld:id} and
	smn_salud.smn_relacion_horario_tramos.smn_tramos_id = smn_salud.smn_tramos.smn_tramos_id