INSERT INTO smn_comercial.smn_pedido_componentes
(
	smn_pedido_componentes_id,
	smn_pedido_detalle_id,
	smn_mov_caja_detalle_id,
	smn_ingresos_rf,
	smn_pedido_cabecera_id,
	smn_grupo_componente_rf,
	pco_tipo_componente,
	smn_componente_rf,
	pco_es_prestador_servicio,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	pco_naturaleza,
	smn_item_rf,
	smn_servicio_rf,
	pco_cantidad,
	smn_precio_ml_rf,
	pco_monto_ml,
	smn_moneda_rf,
	smn_tasa_rf,
	smn_precio_ma,
	smn_monto_ma,
	pco_imprime,
	smn_grupo_titulo_impresion_rf,
	smn_tipo_gasto_rf,
	smn_sub_tipo_gasto_rf,
	pco_estatus,
	pco_idioma,
	pco_usuario,
	pco_fecha_registro,
	pco_hora,
	smn_prestador_servicio_rf
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_pedido_componentes},
	${fld:smn_pedido_detalle_id},
	0,
	${fld:smn_num_doc_origen_rf},
	(select last_value from smn_comercial.seq_smn_pedido_cabecera),
	${fld:smn_grupo_componente_rf},
	${fld:cmp_tipo_componente},
	${fld:smn_componentes_id},
	${fld:cmp_grupo_prestador},
	(select smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id from smn_base.smn_clase_auxiliar where smn_base.smn_clase_auxiliar.cla_codigo='PA' limit 1),
	${fld:smn_auxiliar_rf},
	${fld:smn_tipo_componentes_rf},
	0,
	${fld:smn_servicios_rf},
	${fld:pde_cantidad_pedido},
	${fld:pde_precio},
	${fld:monto_componente_ml},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:pde_precio_moneda_alterna},
    ${fld:monto_componente_ma},
	${fld:smn_imprime},
	${fld:smn_grupo_titulo_impresion_rf},
	${fld:smn_tipo_gasto_rf},
	${fld:smn_sub_tipo_gasto_rf},
	'GE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	0
);