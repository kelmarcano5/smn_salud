INSERT INTO smn_salud.smn_ingreso_cola_virtual
(

	smn_ingreso_cola_virtual_id,
	smn_entidad_rf,
	smn_sucursal_rf,
	smn_area_servicio_rf,
	smn_unidad_servicio_rf,
	smn_serie_id,
	icv_numero_ticket,
	icv_fecha_registro_evento,
	smn_clase_auxiliar_rf,
	icv_numero_documento_identidad,
	icv_idioma,
	icv_usuario,
 	icv_fecha_registro,
 	icv_hora

)
VALUES
(
	${seq:currval@smn_salud.seq_smn_ingreso_cola_virtual},
	 ${fld:entidad_prestador},
    ${fld:sucursal_prestador},
    ${fld:smn_area_servicio},
	${fld:smn_unidades_servicios_id},
	${fld:serie},
	(select sri_ultimo_numero+1 from smn_salud.smn_series where sri_codigo = ${fld:serie}),
	'${def:date}',
	(select smn_clase_auxiliar_id from smn_base.smn_clase_auxiliar where smn_base.smn_clase_auxiliar.cla_codigo='PA'),
	${fld:cedula},
	'${def:locale}',
	'${def:user}',
	'${def:date}',
	'${def:time}'
)


