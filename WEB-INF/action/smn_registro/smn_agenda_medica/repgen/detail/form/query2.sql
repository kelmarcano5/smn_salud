select
		smn_salud.smn_agenda_medica.smn_agenda_id,
	smn_salud.smn_agenda_medica.smn_entidades_rf,
	smn_salud.smn_agenda_medica.smn_sucursales_rf,
	smn_salud.smn_agenda_medica.smn_areas_servicios_rf,
	smn_salud.smn_agenda_medica.smn_unidades_servicios_rf,
	smn_salud.smn_agenda_medica.smn_grupo_prestador_servicio_rf,
	smn_salud.smn_agenda_medica.smn_prestador_servicio_rf,
	smn_salud.smn_agenda_medica.smn_especialidad_rf,
	smn_salud.smn_agenda_medica.agm_jornada_desde_rf,
	smn_salud.smn_agenda_medica.agm_frecuencia,
	smn_salud.smn_agenda_medica.agm_cantidad_frecuencia,
	smn_salud.smn_agenda_medica.agm_estatus,
	smn_salud.smn_agenda_medica.agm_fecha_registro
from
	smn_salud.smn_agenda_medica 
where
	smn_salud.smn_agenda_medica.smn_agenda_medica_id = ${fld:id}
