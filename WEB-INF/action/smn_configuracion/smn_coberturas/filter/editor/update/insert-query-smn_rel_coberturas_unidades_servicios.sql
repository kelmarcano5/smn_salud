INSERT INTO smn_salud.smn_rel_coberturas_unidades_servicios
(
	smn_rel_coberturas_unidades_servicios_id,
	smn_coberturas_id,
	smn_unidades_servicios_id
)
VALUES
(
	${seq:nextval@smn_salud.smn_rel_coberturas_unidades_servicios},
	${fld:id},
	${fld:smn_unidades_servicios_id}
)
