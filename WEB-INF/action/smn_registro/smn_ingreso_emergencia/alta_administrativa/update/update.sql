UPDATE smn_salud.smn_ingresos SET
	igs_fecha_salida=${fld:igs_fecha_salida},
	igs_hora_salida=${fld:igs_hora_salida},
	ctm_observaciones_id=${fld:ctm_observaciones_id},
	igs_estatus_financiero='AT'
WHERE
	smn_ingresos_id=${fld:id};

UPDATE smn_salud.smn_habitaciones SET hab_estatus='DI'
WHERE smn_salud.smn_habitaciones.smn_habitaciones_id=${fld:smn_activo_fijo_rf};

UPDATE smn_salud.smn_habitaciones_disponibles SET
	had_fecha_egreso=${fld:igs_fecha_salida},
	had_estatus='DI'
WHERE
	smn_habitaciones_id=${fld:smn_activo_fijo_rf} AND smn_ingreso_id=${fld:id};


