select
	smn_salud.smn_agenda_medica.smn_agenda_medica_id,
	case
	when smn_salud.smn_agenda_medica.agm_estatus='AC' then '${lbl:b_active}'
	when smn_salud.smn_agenda_medica.agm_estatus='IN' then '${lbl:b_inactive}'
	end as agm_estatus,
	smn_base.smn_agenda.age_descripcion as smn_agenda_id,
	smn_base.smn_entidades.ent_descripcion_corta as smn_entidades_rf,
	smn_base.smn_sucursales.suc_nombre as smn_sucursales_rf,
	smn_base.smn_areas_servicios.ase_descripcion as smn_areas_servicios_rf,
	smn_base.smn_unidades_servicios.uns_descripcion as smn_unidades_servicios_rf,
	smn_base.smn_grupos_prestadores.gpp_descripcion as smn_grupo_prestador_servicio_rf,
	smn_base.smn_prestadores_servicios.prs_descripcion as smn_prestador_servicio_rf,
	smn_base.smn_especialidad.esp_descripcion as smn_especialidad_rf,
	smn_salud.smn_agenda_medica.agm_fecha_registro
	
from
	smn_salud.smn_agenda_medica
	inner join smn_base.smn_agenda on smn_base.smn_agenda.smn_agenda_id = smn_salud.smn_agenda_medica.smn_agenda_id
	inner join smn_base.smn_especialidad on smn_base.smn_especialidad.smn_especialidad_id =	smn_salud.smn_agenda_medica.smn_especialidad_rf
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_salud.smn_agenda_medica.smn_entidades_rf
	left join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_salud.smn_agenda_medica.smn_sucursales_rf
	inner join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_salud.smn_agenda_medica.smn_areas_servicios_rf
	inner join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_salud.smn_agenda_medica.smn_unidades_servicios_rf
	inner join smn_base.smn_grupos_prestadores on smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id = smn_salud.smn_agenda_medica.smn_grupo_prestador_servicio_rf
	inner join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_salud.smn_agenda_medica.smn_prestador_servicio_rf
