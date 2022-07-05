select
select
select
select
select
select
select
select
select
select
	smn_base.smn_agenda.age_descripcion,
	case
	when smn_salud.smn_agenda_medica.agm_estatus='AC' then '${lbl:b_active}'
	when smn_salud.smn_agenda_medica.agm_estatus='IN' then '${lbl:b_inactive}'
	end as agm_estatus,
	smn_salud.smn_agenda_medica.*
from
	smn_base.smn_agenda,
	smn_salud.smn_agenda_medica
where
	smn_base.smn_agenda.smn_agenda_id = smn_salud.smn_agenda_medica.agm_jornada_desde_rf and
	smn_agenda_medica_id = ${fld:id}
