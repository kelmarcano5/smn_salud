UPDATE smn_salud.smn_campos_visualizacion_monitores_dispositivos SET
	smn_dispositivos_id=${fld:smn_dispositivos_id},
	smn_series_id=${fld:smn_series_id},
	cvm_datos_pac=${fld:cvm_datos_pac},
	cvm_unidad_llamada=${fld:cvm_unidad_llamada},
	cvm_pacientes_espera=${fld:cvm_pacientes_espera},
	cvm_tiempo_aprox_espera=${fld:cvm_tiempo_aprox_espera},
	cvm_idioma='${def:locale}',
	cvm_usuario_id='${def:user}',
	cvm_fecha_registro={d '${def:date}'},
	cvm_hora='${def:time}'

WHERE
	smn_campos_vis_mon_dis_id=${fld:id}

