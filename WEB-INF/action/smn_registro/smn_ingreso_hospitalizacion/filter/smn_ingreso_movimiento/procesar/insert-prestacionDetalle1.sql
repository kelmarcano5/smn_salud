INSERT INTO smn_salud.smn_prestacion_servicio_medico_detalle
(
	smn_prestacion_servicio_medico_detalle_id,
	smn_prestacion_servicio_medico_cabecera_id,
	smn_ingresos_mov_id,
	smn_unidades_servicios_rf,
	smn_servicios_rf,
	psd_tipo_componentes,
	smn_componentes_rf,
	psd_cantidad,
	psd_precio_propuesto_ml,
	psd_monto_propuesto_ml,
	smn_moneda_rf,
	psd_estatus,
	psd_idioma,
	psd_usuario,
	psd_fecha_registro,
	psd_hora
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_prestacion_servicio_medico_detalle},
	(select last_value from smn_salud.seq_smn_prestacion_servicio_medico_cabecera),
	${fld:smn_ingresos_mov_id},
	${fld:smn_unidades_servicios_rf},
	${fld:smn_servicios_rf},
	'SE',
	0,
	${fld:psd_cantidad},
	${fld:psd_precio_propuesto_ml},
	${fld:psd_monto_propuesto_ml},
	${fld:smn_moneda_rf},
	'RE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
