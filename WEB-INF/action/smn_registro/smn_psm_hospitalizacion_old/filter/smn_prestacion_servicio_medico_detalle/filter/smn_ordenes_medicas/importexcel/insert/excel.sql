INSERT INTO smn_salud.smn_ordenes_medicas
(
	smn_ordenes_medicas_id,
	smn_ingreso_id,
	omd_numero_orden,
	omd_descripcion,
	smn_prestador_servicio_rf,
	omd_clase_auxiliar,
	omd_auxiliar,
	omd_num_doc_oficial,
	omd_tipo_orden,
	omd_indicaciones,
	omd_fecha_registro
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_ordenes_medicas},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
