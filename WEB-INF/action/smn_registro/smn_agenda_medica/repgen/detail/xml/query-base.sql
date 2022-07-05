select
	smn_base.smn_agenda.age_descripcion,
	${field}
from
	smn_base.smn_agenda,
	smn_salud.smn_agenda_medica
where
	smn_base.smn_agenda.smn_agenda_id = smn_salud.smn_agenda_medica.agm_jornada_desde_rf and
		smn_salud.smn_agenda_medica.smn_agenda_medica_id = ${fld:id}
	
