INSERT INTO smn_salud.smn_campos_visualizacion_monitores_dispositivos
(
	smn_campos_vis_mon_dis_id,
	smn_dispositivos_id,
	smn_series_id,
	cvm_datos_pac,
	cvm_unidad_llamada,
	cvm_pacientes_espera,
	cvm_tiempo_aprox_espera,
	cvm_idioma,
	cvm_usuario_id,
	cvm_fecha_registro,
	cvm_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_campos_visualizacion_monitores_dispositivos},
	${fld:smn_dispositivos_id},
	${fld:smn_series_id},
	${fld:cvm_datos_pac},
	${fld:cvm_unidad_llamada},
	${fld:cvm_pacientes_espera},
	${fld:cvm_tiempo_aprox_espera},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
