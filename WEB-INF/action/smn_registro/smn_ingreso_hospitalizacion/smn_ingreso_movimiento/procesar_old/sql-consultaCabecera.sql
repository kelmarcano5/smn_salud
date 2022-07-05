SELECT
	smn_salud.smn_ingreso_movimiento.smn_ingreso_id as smn_ingresos_id,
	smn_salud.smn_ingreso_movimiento.smn_servicios_rf,
	smn_base.smn_componentes.cmp_grupo_prestador as smn_grupo_prestador_servicio_rf,
	smn_salud.smn_ingreso_movimiento.smn_unidades_servicios_rf,
smn_salud.smn_ingreso_movimiento.smn_prestador_servicio_rf
FROM
	smn_salud.smn_ingreso_movimiento
	INNER JOIN smn_base.smn_servicios ON smn_salud.smn_ingreso_movimiento.smn_servicios_rf = smn_base.smn_servicios.smn_servicios_id
	INNER JOIN smn_base.smn_servicios_componentes ON smn_base.smn_servicios_componentes.smn_servicios_id = smn_base.smn_servicios.smn_servicios_id AND smn_base.smn_servicios.smn_servicios_id = smn_base.smn_servicios_componentes.smn_servicios_id
	INNER JOIN smn_base.smn_componentes ON smn_base.smn_servicios_componentes.smn_componentes_id = smn_base.smn_componentes.smn_componentes_id
WHERE
	smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:id_ingreso} AND
	smn_base.smn_componentes.cmp_grupo_prestador IS NOT NULL