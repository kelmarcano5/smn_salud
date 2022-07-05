SELECT DISTINCT
	smn_salud.smn_ruta_paciente.smn_ruta_id AS smn_ruta_id_ea,
	smn_salud.smn_ruta_paciente.rta_numero_documento_identidad AS rta_numero_documento_identidad_ea,
	smn_salud.smn_ruta_paciente.rta_ticket AS rta_ticket_ea,
	smn_base.smn_clase_auxiliar.cla_codigo || ' - ' || smn_base.smn_clase_auxiliar.cla_nombre AS smn_clase_auxiliar_rf_combo_ea,
	smn_base.smn_auxiliar.aux_nombres || ' - ' || smn_base.smn_auxiliar.aux_apellidos AS smn_auxiliar_rf_combo_ea,
	smn_base.smn_entidades.ent_codigo || ' - ' || smn_base.smn_entidades.ent_descripcion_corta AS smn_entidad_rf_combo_ea,
	smn_base.smn_unidades_servicios.uns_descripcion AS smn_unidad_servicio_rf_ea,
	smn_salud.smn_ruta_paciente.rta_fecha_registro AS rta_fecha_registro_ea,
	0 AS saldo_ea,
	0 AS frecuencia_ea,
	smn_salud.smn_ruta_paciente.smn_serie_id AS serie,
	eje.aux_descripcion AS rta_ejecutivo_asignado_ea,
	smn_salud.smn_puesto_atencion.put_descripcion AS puesto 
FROM
	smn_salud.smn_ruta_paciente
	LEFT OUTER JOIN smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_ruta_paciente.smn_auxiliar_rf
	LEFT OUTER JOIN smn_base.smn_clase_auxiliar ON smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_ruta_paciente.smn_clase_auxiliar_rf
	LEFT OUTER JOIN smn_base.smn_entidades ON smn_base.smn_entidades.smn_entidades_id = smn_salud.smn_ruta_paciente.smn_entidad_rf
	LEFT OUTER JOIN smn_base.smn_unidades_servicios ON smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_salud.smn_ruta_paciente.smn_unidad_servicio_rf
	LEFT JOIN smn_base.smn_usuarios ON smn_base.smn_usuarios.smn_usuarios_id = smn_salud.smn_ruta_paciente.rta_ejecutivo_asignado
	LEFT JOIN smn_base.smn_auxiliar eje ON eje.smn_auxiliar_id = smn_base.smn_usuarios.smn_auxiliar_rf
	LEFT JOIN smn_salud.smn_planificacion_de_turno ON smn_salud.smn_planificacion_de_turno.smn_usuario_id = smn_base.smn_usuarios.smn_usuarios_id
	LEFT JOIN smn_salud.smn_puesto_atencion ON smn_salud.smn_puesto_atencion.smn_puesto_atencion_id = smn_salud.smn_planificacion_de_turno.smn_puesto_atencion_id 
WHERE
	smn_salud.smn_ruta_paciente.smn_area_servicio_rf = ${ fld : smn_areas_servicios } 
	AND smn_salud.smn_ruta_paciente.smn_unidad_servicio_rf =${ fld : smn_unidad_servicios } 
	AND UPPER ( smn_salud.smn_ruta_paciente.rta_estatus ) = 'EA' 
	AND smn_salud.smn_ruta_paciente.rta_fecha_registro = '${def:date}' 
ORDER BY
	smn_salud.smn_ruta_paciente.rta_ticket ASC 
LIMIT 4