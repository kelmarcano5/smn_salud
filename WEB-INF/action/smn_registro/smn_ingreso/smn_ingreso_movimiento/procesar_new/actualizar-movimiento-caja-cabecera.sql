UPDATE smn_caja.smn_mov_caja_cabecera SET 
	mcc_saldo_ml_documento=?,
	mcc_monto_ma_documento=?,
	mcc_saldo_ma_documento=?,
	smn_moneda_rf=?,
	smn_tasa_rf=?,
	mcc_idioma=?,
	mcc_usuario=?,
	mcc_fecha_registro=?,
	mcc_hora=?,
	mcc_monto_original_doc_ml=?
	mcc_monto_original_doc_ma=? 

WHERE
	smn_mov_caja_cabecera_id=${fld:smn_mov_caja_cabecera_id}