INSERT INTO smn_salud.smn_dispositivos
(
	smn_dispositivos_id,
	dis_codigo,
	dis_nombre,
	dis_tipo,
	dis_mac_address,
	smn_usuario_id,
	smn_entidades_rf,
	smn_sucursales_rf,
	smn_areas_servicios_rf,
	smn_unidad_servicio_rf,
	dis_idioma,
	dis_usuario_id,
	dis_fecha_registro,
	dis_hora
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_dispositivos},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	'${def:locale
}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)