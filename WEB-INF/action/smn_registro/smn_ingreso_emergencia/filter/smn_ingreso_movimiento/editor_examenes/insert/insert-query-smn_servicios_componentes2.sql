INSERT INTO smn_salud.smn_rel_ingreso_mov_examenes
(
	smn_rel_ingreso_mov_examenes_id,
	smn_ingresos_mov_id,
	smn_servicios_id
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_rel_ingreso_mov_examenes},
	${seq:currval@smn_salud.seq_smn_ingreso_movimiento},
	${fld:smn_servicios_id}
)