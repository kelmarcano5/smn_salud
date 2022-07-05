SELECT
${fld:smn_pedido_cabecera_id}  as smn_pedido_cabecera_id,
${fld:smn_mov_caja_cabecera_id}  as smn_mov_caja_cabecera_id,
${fld:ingresoid} as ingresoid,
smn_salud.smn_ingreso_movimiento.smn_ingreso_id,
smn_salud.smn_ingreso_movimiento.smn_unidades_servicios_rf,
smn_salud.smn_ingreso_movimiento.smn_servicios_rf,
smn_salud.smn_ingreso_movimiento.smn_prestacion_servicio_medico_cabecera_id,
Sum(smn_salud.smn_ingreso_movimiento.inm_monto_ml) AS monto_ml,
Sum(smn_salud.smn_ingreso_movimiento.inm_monto_ma) AS monto_ma
FROM
smn_salud.smn_ingreso_movimiento
WHERE
smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:ingresoid} AND
smn_salud.smn_ingreso_movimiento.smn_item_rf IS NOT NULL
GROUP BY
smn_salud.smn_ingreso_movimiento.smn_ingreso_id,
smn_salud.smn_ingreso_movimiento.smn_unidades_servicios_rf,
smn_salud.smn_ingreso_movimiento.smn_servicios_rf,
smn_salud.smn_ingreso_movimiento.smn_prestacion_servicio_medico_cabecera_id