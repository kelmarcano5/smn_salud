INSERT INTO smn_base.smn_servicios_componentes
(
	smn_servicios_componentes_id,
	smn_servicios_id,
	smn_componentes_id
)
VALUES
(
	${seq:nextval@smn_base.seq_smn_servicios_componentes},
	${fld:smn_servicios_id},
	${seq:currval@smn_base.seq_smn_componentes}
)
