INSERT INTO smn_salud.smn_historia_medica
(
	smn_historia_medica_id,
	smn_auxiliar_rf,
	him_fecha,
	him_hora,
	him_entrevistador,
	rango_edad,
	grupo_etnico,
	enfermedades,
	alergias,
	vicio_error,
	medicamentos_sistemicos,
	uso_de_esteroides,
	enfermedad_ocular,
	glaucoma_en_familiares,
	ceguera_en_familiares,
	paquimetria,
	aguadeza_visual,
	parpados,
	otros_parpados,
	conjuntiva,
	cornea,
	camara_anterior,
	iris_pupila,
	cristalino,
	gonioscopia,
	disco_nervio,
	excavacion,
	rebote_neutral,
	vasos_sanguineos,
	retina,
	ojo_derecho,
	ojo_izquierdo,
	plan,
	observacion,
	estudios_complementarios,
	tratamiento_hipotensor,
	procedimiento_laser,
	procedimiento_quirurgico,
	smn_prestador_servicio_detalle_id,
	presion_intraocular_oi,
	presion_intraocular_od,
	presion_intraocular_corregida_oi,
	presion_intraocular_corregida_od,
	astismagtismo_eje,
	vicio_error_mayor,
	vicio_error_txt

)
VALUES
(
	${seq:currval@smn_salud.seq_smn_historia_medica},
	${fld:smn_auxiliar_rf},
	{d '${def:date}'},
	'${def:time}',
	${fld:him_entrevistador},
	${fld:rango_edad},
	${fld:grupo_etnico},
	${fld:enfermedades_hd},
	${fld:alergias},
	${fld:vicio_error_hd},
	${fld:medicamentos_sistemicos},
	${fld:uso_de_esteroides},
	${fld:enfermedad_ocular},
	${fld:glaucoma_en_familiares_hd},
	${fld:ceguera_en_familiares_hd},
	${fld:paquimetria_hd},
	${fld:aguadeza_visual_hd},
	${fld:parpados_hd},
	${fld:otros_parpados},
	${fld:conjuntiva_hd},
	${fld:cornea_hd},
	${fld:camara_anterior_hd},
	${fld:iris_pupila_hd},
	${fld:cristalino_hd},
	${fld:gonioscopia_hd},
	${fld:disco_nervio_hd},
	${fld:excavacion_hd},
	${fld:rebote_neutral_hd},
	${fld:vasos_sanguineos_hd},
	${fld:retina},
	${fld:ojo_derecho},
	${fld:ojo_izquierdo},
	${fld:plan},
	${fld:observacion},
	${fld:estudios_complementarios_hd},
	${fld:tratamiento_hipotensor_hd},
	${fld:procedimiento_laser_hd},
	${fld:procedimiento_quirurgico_hd},
	${fld:id_prestacion},
	${fld:presion_intraocular_oi},
	${fld:presion_intraocular_od},
	${fld:presion_intraocular_corregida_oi},
	${fld:presion_intraocular_corregida_od},
	${fld:astismagtismo},
	${fld:vicio_error_mayor},
	${fld:vicio_error_txt}

)


