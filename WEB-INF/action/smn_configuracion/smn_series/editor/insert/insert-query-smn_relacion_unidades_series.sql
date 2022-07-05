INSERT INTO smn_salud.smn_relacion_unidades_series
(
	smn_relacion_unidades_series_id,
	smn_series_id,
	smn_unidades_servicios_id
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_relacion_unidades_series},
	${seq:currval@smn_salud.seq_smn_series},
	${fld:smn_unidades_servicios_id}
)
