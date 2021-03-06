INSERT INTO smn_salud.smn_pedido_detalle
(
	smn_pedido_detalle_id,
	smn_pedido_cabecera_id,
	pde_naturaleza,
	smn_servicios_rf,
	smn_item_rf,
	pde_cantidad_oferta,
	pde_cantidad_pedido,
	pde_cantidad_aprobada,
	pde_precio,
	pde_monto,
	smn_moneda_rf,
	smn_tasa_rf,
	pde_precio_moneda_alterna,
	pde_monto_moneda_alterna,
	pde_fecha_requerida,
	pde_estatus,
	pde_idioma,
	pde_usuario,
	pde_fecha_registro,
	pde_hora
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_pedido_detalle},
	(select last_value from smn_salud.seq_smn_pedido_cabecera),
	${fld:pde_naturaleza},
	${fld:smn_servicios_rf},
	${fld:smn_item_rf},
	${fld:pde_cantidad_oferta},
	${fld:pde_cantidad_pedido},
	0,
	${fld:prd_precio},
	${fld:prd_monto_moneda_local},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:prd_precio_ma},
	${fld:prd_moneda_alterna},
	{d '${def:date}'},
	'GE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
