INSERT INTO smn_salud.smn_rel_plan_contrato
(
	smn_rel_plan_contrato_modulo_id,
	smn_planes_id,
	smn_contrato_modulo_id,
	rpc_vigencia,
	rpc_fecha_vigencia
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_plan_contrato},
	${seq:currval@smn_salud.seq_smn_planes},
	${fld:smn_contrato_modulo_id},
	${fld:pla_inactivo},
	${fld:pla_vigencia_hasta}
)
