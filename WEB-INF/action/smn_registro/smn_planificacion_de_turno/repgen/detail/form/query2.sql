select
		smn_salud.smn_planificacion_de_turno.smn_plan_turno_id,
	smn_salud.smn_planificacion_de_turno.smn_rol_id,
	smn_salud.smn_planificacion_de_turno.ptu_fecha,
	smn_salud.smn_planificacion_de_turno.smn_serie_id,
	smn_salud.smn_planificacion_de_turno.smn_entidades_rf,
	smn_salud.smn_planificacion_de_turno.smn_sucursales_rf,
	smn_salud.smn_planificacion_de_turno.smn_areas_servicios_rf,
	smn_salud.smn_planificacion_de_turno.ptu_estatus,
	smn_salud.smn_planificacion_de_turno.ptu_fecha_registro
from
	smn_salud.smn_planificacion_de_turno 
where
	smn_salud.smn_planificacion_de_turno.smn_planificacion_de_turno_id = ${fld:id}
