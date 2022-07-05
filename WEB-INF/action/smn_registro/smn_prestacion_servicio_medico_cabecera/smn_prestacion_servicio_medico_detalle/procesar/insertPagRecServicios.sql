INSERT INTO smn_pagos.smn_nota_recepcion_servicio
(
	smn_nota_recepcion_servicio_id,
	smn_centro_costo_rf,
	smn_documento_rf,
	smn_numero_documento_rf,
	smn_documento_id,
	nrs_numero,
	smn_clase_rf,
	smn_proveedor_id,
	smn_usuario_rf,
	nrs_monto_saldo_ml,
	nrs_monto_saldo_ma,
	nrs_monto_ml,
	nrs_monto_ma,
	nrs_monto_usado_ml,
	nrs_monto_usado_ma,
	nrs_estatus,
	nrs_idioma,
	nrs_usuario,
	nrs_fecha_registro,
	nrs_hora,
	smn_ingresos_rf,
	smn_prestador_servicio_rf,
	smn_componente_rf
)
VALUES
(
	${seq:nextval@smn_pagos.seq_smn_nota_recepcion_servicio},
	(select smn_base.smn_rel_servicio_area_unidad.smn_centro_costo_rf from smn_base.smn_rel_servicio_area_unidad where smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf =  ${fld:smn_unidades_servicios_rf} and 
smn_base.smn_rel_servicio_area_unidad.smn_servicios_id = ${fld:smn_servicios_rf}),
	(select smn_salud.smn_documento.smn_documento_general_rf  from smn_salud.smn_documento inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_documento_id = smn_salud.smn_documento.smn_documento_id inner join smn_salud.smn_ingreso_movimiento on smn_salud.smn_ingreso_movimiento.smn_ingreso_id = smn_salud.smn_ingresos.smn_ingresos_id inner join smn_salud.smn_prestacion_servicio_medico_detalle on smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id = smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id
	 where smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id=${fld:mov_id} limit 1),
	(select smn_salud.smn_ingresos.igs_num_ingreso  from smn_salud.smn_documento inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_documento_id = smn_salud.smn_documento.smn_documento_id inner join smn_salud.smn_ingreso_movimiento on smn_salud.smn_ingreso_movimiento.smn_ingreso_id = smn_salud.smn_ingresos.smn_ingresos_id inner join smn_salud.smn_prestacion_servicio_medico_detalle on smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id = smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id
	 where smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id=${fld:mov_id} limit 1),
	(select smn_salud.smn_documento.smn_documento_id  from smn_salud.smn_documento inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_documento_id = smn_salud.smn_documento.smn_documento_id inner join smn_salud.smn_ingreso_movimiento on smn_salud.smn_ingreso_movimiento.smn_ingreso_id = smn_salud.smn_ingresos.smn_ingresos_id inner join smn_salud.smn_prestacion_servicio_medico_detalle on smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id = smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id
	 where smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id=${fld:mov_id} limit 1),
	${seq:nextval@smn_pagos.seq_smn_nota_recepcion_number_doc},
	(select smn_salud.smn_ingresos.smn_clase_rf from smn_salud.smn_documento inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_documento_id = smn_salud.smn_documento.smn_documento_id inner join smn_salud.smn_ingreso_movimiento on smn_salud.smn_ingreso_movimiento.smn_ingreso_id = smn_salud.smn_ingresos.smn_ingresos_id inner join smn_salud.smn_prestacion_servicio_medico_detalle on smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id = smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id
	 where smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id=${fld:mov_id} limit 1),
	0,
	(select smn_seguridad.s_user.user_id from smn_seguridad.s_user where smn_seguridad.s_user.userlogin='${def:user}'),
	${fld:nrs_monto_saldo_ml},
	${fld:nrs_monto_saldo_ma},
	${fld:nrs_monto_ml},
	${fld:nrs_monto_ma},
	0,
	0,
	'GE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:ingreso},
	${fld:smn_proveedor_id},
	${fld:smn_componentes_rf}
)RETURNING smn_nota_recepcion_servicio_id, ${fld:smn_proveedor_id} as smn_proveedor_id, ${fld:ingreso} as ingreso;