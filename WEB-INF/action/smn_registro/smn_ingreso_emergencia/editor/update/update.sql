UPDATE smn_salud.smn_ingresos SET
	smn_doc_orig=${fld:smn_doc_orig},
	smn_documento_id=${fld:smn_documento_id},
	igs_doc_origen=${fld:igs_doc_origen},
	igs_num_ingreso=${fld:igs_num_ingreso},
	smn_entidades_rf=${fld:smn_entidades_rf},
	smn_sucursales_rf=${fld:smn_sucursales_rf},
	smn_areas_servicios_rf=${fld:smn_areas_servicios_rf},
	smn_unidades_servicios_rf=${fld:smn_unidades_servicios_rf},
	ctm_observaciones_id=${fld:ctm_observaciones_id},
	--igs_ticket=${fld:igs_ticket},
	smn_clase_rf=${fld:cts_clase_auxiliar},
	smn_auxiliar_rf=${fld:cts_auxiliar},
	smn_contratante_id=${fld:smn_contratante_id},
	smn_auxiliar_sucursales_rf=${fld:smn_auxiliar_sucursales_rf},
	smn_auxiliar_areas_servicios_rf=${fld:smn_auxiliar_areas_servicios_rf},
	smn_auxilia_unidad_servicio_rf=${fld:smn_auxilia_unidad_servicio_rf},
	smn_motivos_id=${fld:smn_motivos_id},
	smn_observaciones_ingresos_id=${fld:smn_observaciones_ingresos_id},
	igs_monto_moneda_local=${fld:igs_monto_moneda_local},
	smn_moneda_rf=${fld:smn_moneda_rf},
	igs_monto_moneda_alterna=${fld:igs_monto_moneda_alterna},
	smn_sintoma_id=${fld:smn_sintoma_id},
	igs_estatus_financiero=${fld:igs_estatus_financiero},
	igs_idioma='${def:locale}',
	igs_usuario='${def:user}',
	igs_fecha_registro={d '${def:date}'},
	igs_hora='${def:time}',
	smn_patologia_id=${fld:smn_patologia_id},
	smn_prestador_servicio_rf=${fld:smn_prestador_servicio_rf},
	igs_numero_autorizacion=${fld:igs_numero_autorizacion},
	igs_fecha_ingreso=${fld:igs_fecha_ingreso},
	igs_dias_hospitalizacion=${fld:igs_dias_hospitalizacion},
	igs_fecha_salida=${fld:igs_fecha_salida},
	smn_activo_fijo=${fld:smn_activo_fijo_rf},
	igs_monto_cobertura=${fld:igs_monto_cobertura}
WHERE
	smn_ingresos_id=${fld:id};

UPDATE smn_salud.smn_habitaciones SET hab_estatus='OC'
WHERE smn_salud.smn_habitaciones.smn_habitaciones_id=${fld:smn_activo_fijo_rf};

UPDATE smn_salud.smn_habitaciones_disponibles SET
	had_estatus='OC'
WHERE
	smn_habitaciones_id=${fld:smn_activo_fijo_rf} AND smn_ingreso_id=${fld:id};

