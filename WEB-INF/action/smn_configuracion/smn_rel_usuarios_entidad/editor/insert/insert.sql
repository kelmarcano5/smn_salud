INSERT INTO smn_salud.smn_rel_usuarios_entidad
(
	smn_rel_usuario_entidad_id,
	smn_usuario_rf,
	smn_entidades_rf,
	smn_sucursales_rf,
	smn_area_servicio_rf,
	smn_unidad_servicio_rf
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_rel_usuarios_entidad},
	${fld:smn_usuario_rf},
	${fld:smn_entidades_rf},
	${fld:smn_sucursales_rf},
	${fld:smn_area_servicio_rf},
	${fld:smn_unidad_servicio_rf}
)
