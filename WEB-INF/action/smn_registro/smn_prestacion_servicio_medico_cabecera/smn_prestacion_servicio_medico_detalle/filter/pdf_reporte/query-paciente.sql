SELECT
	smn_base.smn_entidades.ent_codigo || ' - ' || smn_base.smn_entidades.ent_descripcion_corta AS smn_entidades_rf_combo,
	smn_base.smn_entidades.ent_nro_id_fiscal AS ent_rif,
	smn_base.smn_auxiliar.aux_descripcion AS aux_nombre_paciente,
	smn_base.smn_auxiliar.aux_num_doc_oficial AS aux_cedula,
	smn_base.smn_auxiliar.aux_fecha_nac AS fecha_nac,
	smn_base.smn_contactos.cnt_descripcion as correo,
	smn_base.smn_contactos.cnt_descripcion1 as telefono
FROM
	smn_salud.smn_prestacion_servicio_medico_cabecera
	INNER JOIN smn_salud.smn_ingresos ON smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_prestacion_servicio_medico_cabecera.smn_ingresos_id
	LEFT OUTER JOIN smn_base.smn_entidades ON smn_base.smn_entidades.smn_entidades_id = smn_salud.smn_ingresos.smn_entidades_rf
	INNER JOIN smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_ingresos.smn_auxiliar_rf 
	inner join smn_base.smn_contactos on smn_base.smn_contactos.smn_auxiliar_id = smn_base.smn_auxiliar.smn_auxiliar_id
WHERE
	smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id =${fld:id_cab}