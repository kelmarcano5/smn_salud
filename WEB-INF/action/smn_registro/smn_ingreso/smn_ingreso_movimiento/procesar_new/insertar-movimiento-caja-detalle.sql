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
	mcd_hora,
	mcd_prestador_servicio,
	smn_contratante_clase_rf,
	smn_contratante_rf
) SELECT ${seq:nextval@smn_caja.seq_smn_mov_caja_detalle}, 
		 ${seq:currval@smn_caja.seq_smn_mov_caja_cabecera},
		 ?, 
		 smn_servicios_rf, 
		 inm_monto_ml, 
		 inm_monto_ml, 
		 inm_monto_ma, 
		 inm_monto_ma, 
		 smn_moneda_rf, 
		 smn_tasa_rf,
		 ?, 
		 ?,
		 ?, 
		 ?, 
		 ?, 
		 ?, 
		 ? 
  FROM 
  	smn_salud.smn_ingreso_movimiento 
  WHERE smn_ingreso_id = ? AND 
        smn_servicios_rf NOT IN (SELECT 
        						 	smn_id_rf 
                                 FROM 
                                 	smn_caja.smn_mov_caja_detalle 
                                 WHERE mcd_tipo_producto = ? AND 
                                       smn_mov_caja_cabecera_id = ${seq:currval@smn_caja.seq_smn_mov_caja_cabecera} AND 
                                       mcd_fecha_registro <> current_date) 
  ORDER BY 
  	smn_ingresos_mov_id DESC;
