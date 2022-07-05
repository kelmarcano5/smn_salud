UPDATE smn_salud.smn_contrato_modulo SET
	smn_contrato_base_rf=${fld:smn_contrato_base_rf},
	smn_documento_id=${fld:smn_documento_id},
	ctm_numero_contrato=${fld:ctm_numero_contrato},
	smn_contratante_id=${fld:smn_contratante_id},
	ctm_fecha_vigencia_desde=${fld:ctm_fecha_vigencia_desde},
	ctm_fecha_vigencia_hasta=${fld:ctm_fecha_vigencia_hasta},
	smn_planes_id=${fld:smn_planes_id},
	ctm_cantidad_afiliados=${fld:ctm_cantidad_afiliados},
	ctm_monto_contrato=${fld:ctm_monto_contrato},
	ctm_monto_cobertura_afiliado=${fld:ctm_monto_cobertura_afiliado},
	ctm_cantidad_servicio_afiliado=${fld:ctm_cantidad_servicio_afiliado},
	ctm_cantidad_dias_cobertura=${fld:ctm_cantidad_dias_cobertura},
	ctm_cantidad_citas=${fld:ctm_cantidad_citas},
	smn_descuento_rf=${fld:smn_descuento_rf},
	ctm_dia_factura=${fld:ctm_dia_factura},
	ctm_idioma='${def:locale}',
	ctm_usuario_id='${def:user}',
	ctm_fecha_registro={d '${def:date}'},
	ctm_hora='${def:time}'

WHERE
	smn_contrato_modulo_id=${fld:id}

