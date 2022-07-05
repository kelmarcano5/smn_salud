INSERT INTO smn_salud.smn_marca_comercial
(
	smn_marca_comercial_id,
	mac_codigo,
	mac_descripcion,
	mac_fecha_registro
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_marca_comercial},
	?,
	?,
	{d '${def:date}'}
)
