INSERT INTO smn_caja.smn_mov_caja_detalle
(
	smn_mov_caja_detalle_id,
	smn_mov_caja_cabecera_id,
	mcd_tipo_producto,
	smn_id_rf,
	mcd_monto_por_pagar_ml,
	mcd_saldo_pago_ml,
	mcd_monto_por_pagar_ma,
	mcd_saldo_pago_ma,
	smn_moneda_rf,
	smn_tasa_rf,
	mcd_idioma,
	mcd_usuario,
	mcd_fecha_registro,
	mcd_hora
)
VALUES
(
	${seq:nextval@smn_caja.seq_smn_mov_caja_detalle},
	${fld:smn_mov_caja_cabecera_id},
	'SS',
	(select smn_salud.smn_documento.smn_servicios_cobertura from smn_salud.smn_documento where smn_salud.smn_documento.smn_documento_id = ${fld:smn_documento_id}),
	${fld:igs_monto_moneda_local},
	${fld:igs_monto_moneda_local},
	${fld:igs_monto_moneda_alternal},
	${fld:igs_monto_moneda_alternal},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);
