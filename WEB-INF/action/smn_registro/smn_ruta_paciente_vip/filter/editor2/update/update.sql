UPDATE smn_salud.smn_ruta_paciente SET
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	rta_numero_documento_identidad=${fld:rta_numero_documento_identidad},
	smn_entidad_rf=${fld:smn_entidad_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	smn_area_servicio_rf=${fld:smn_area_servicio_rf},	
	smn_unidad_servicio_rf=${fld:smn_unidad_servicio_rf},
	smn_grupo_prestador_rf=${fld:smn_grupo_prestador_rf},
  	smn_prestador_servicio_rf=${fld:smn_prestador_servicio_rf},
  	rta_estatus=${fld:rta_estatus},
	rta_secuencia=${fld:rta_secuencia},
	smn_serie_id=${fld:smn_serie_id},
	rta_ticket=${fld:rta_ticket},
	rta_hora_llegada_unidad=${fld:rta_hora_llegada_unidad},
	rta_hora_salida_unidad=${fld:rta_hora_salida_unidad},
	rta_idioma='${def:locale}',
	rta_usuario='${def:user}',
	rta_fecha_registro='${def:date}',
	rta_hora='${def:time}'

WHERE
	smn_ruta_id=${fld:id}

