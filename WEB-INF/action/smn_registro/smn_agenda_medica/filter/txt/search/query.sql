select
	smn_base.smn_agenda.age_descripcion,
		smn_salud.smn_agenda_medica.smn_agenda_medica_id,
select
		smn_salud.smn_agenda_medica.smn_agenda_medica_id,
select
		smn_salud.smn_agenda_medica.smn_agenda_medica_id,
select
		smn_salud.smn_agenda_medica.smn_agenda_medica_id,
select
		smn_salud.smn_agenda_medica.smn_agenda_medica_id,
select
		smn_salud.smn_agenda_medica.smn_agenda_medica_id,
select
		smn_salud.smn_agenda_medica.smn_agenda_medica_id,
select
		smn_salud.smn_agenda_medica.smn_agenda_medica_id,
select
		smn_salud.smn_agenda_medica.smn_agenda_medica_id,
	case
	when smn_salud.smn_agenda_medica.agm_estatus='AC' then '${lbl:b_active}'
	when smn_salud.smn_agenda_medica.agm_estatus='IN' then '${lbl:b_inactive}'
	end as agm_estatus,
	smn_salud.smn_agenda_medica.smn_agenda_id,
	smn_salud.smn_agenda_medica.smn_entidades_rf,
	smn_salud.smn_agenda_medica.smn_sucursales_rf,
	smn_salud.smn_agenda_medica.smn_areas_servicios_rf,
	smn_salud.smn_agenda_medica.smn_unidades_servicios_rf,
	smn_salud.smn_agenda_medica.smn_grupo_prestador_servicio_rf,
	smn_salud.smn_agenda_medica.smn_prestador_servicio_rf,
	smn_salud.smn_agenda_medica.smn_especialidad_rf,
	smn_salud.smn_agenda_medica.agm_estatus,
	smn_salud.smn_agenda_medica.agm_fecha_registro
	
from

	smn_base.smn_agenda,
	smn_salud.smn_agenda_medica
where
	smn_base.smn_agenda.smn_agenda_id = smn_salud.smn_agenda_medica.agm_jornada_desde_rf
