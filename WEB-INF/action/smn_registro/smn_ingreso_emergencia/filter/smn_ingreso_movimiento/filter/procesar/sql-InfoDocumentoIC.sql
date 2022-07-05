SELECT
		smn_caja.smn_documento.smn_documento_id AS smn_documento_id_caja
	FROM
		smn_salud.smn_documento
		INNER JOIN smn_base.smn_documentos_generales ON smn_salud.smn_documento.smn_documento_general_rf = smn_base.smn_documentos_generales.smn_documentos_generales_id
		INNER JOIN smn_caja.smn_documento ON smn_base.smn_documentos_generales.smn_documentos_generales_id = smn_caja.smn_documento.smn_documento_general_rf
		INNER JOIN smn_salud.smn_ingresos ON smn_salud.smn_documento.smn_documento_id = smn_salud.smn_ingresos.smn_documento_id
		INNER JOIN smn_caja.smn_tipo_documento ON smn_caja.smn_documento.smn_tipo_documento_id = smn_caja.smn_tipo_documento.smn_tipo_documento_id 
	WHERE
		smn_salud.smn_ingresos.smn_contratante_id IS NULL AND 
		smn_salud.smn_ingresos.smn_ingresos_id = ${fld:smn_ingresos_id} AND smn_caja.smn_tipo_documento.tdo_tipo_movimiento='IC'