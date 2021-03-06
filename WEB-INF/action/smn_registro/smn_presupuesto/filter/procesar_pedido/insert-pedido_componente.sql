INSERT INTO smn_salud.smn_pedido_componentes
(
  smn_pedido_componentes_id,
  smn_pedido_detalle_id,
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
  smn_pedido_cabecera_id
)
VALUES
(
  ${seq:nextval@smn_salud.seq_smn_pedido_componentes},
  (select last_value from smn_salud.seq_smn_pedido_detalle),
  ${fld:smn_grupo_componente_rf},
  ${fld:pde_naturaleza},
  ${fld:smn_componentes_rf},
  ${fld:pco_es_prestador_servicio},
  ${fld:smn_clase_auxiliar_rf},
  ${fld:smn_auxiliar_rf},
  ${fld:pde_naturaleza},
  ${fld:smn_item_rf},
  ${fld:smn_servicios_rf},
  ${fld:pco_cantidad},
  ${fld:prd_precio},
  ${fld:prd_monto_moneda_local},
  ${fld:smn_moneda_rf},
  ${fld:prd_precio_ma},
  ${fld:prd_moneda_alterna},
  ${fld:pco_imprime},
  ${fld:smn_grupo_titulo_impresion_rf},
  ${fld:smn_tipo_gasto_rf},
  ${fld:smn_sub_tipo_gasto_rf},
  'GE',
  '${def:locale}',
  '${def:user}',
  {d '${def:date}'},
  '${def:time}',
  (select last_value from smn_salud.seq_smn_pedido_cabecera)
);

update smn_salud.smn_presupuesto set smn_estado_presupuesto_id = 2 where
smn_salud.smn_presupuesto.smn_presupuesto_id=${fld:smn_presupuesto_id};
