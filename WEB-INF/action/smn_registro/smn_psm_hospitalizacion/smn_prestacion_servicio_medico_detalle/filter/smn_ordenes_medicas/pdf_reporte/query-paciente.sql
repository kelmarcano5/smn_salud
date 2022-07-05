SELECT
	smn_base.smn_entidades.ent_codigo ||' - '|| smn_base.smn_entidades.ent_descripcion_corta AS smn_entidades_rf_combo,
	smn_base.smn_entidades.ent_nro_id_fiscal AS ent_rif,
	smn_base.smn_auxiliar.aux_descripcion AS aux_nombre_paciente,
	smn_base.smn_auxiliar.aux_num_doc_oficial AS aux_cedula,
	(DATE_PART('year',current_date::date) - DATE_PART('year',smn_base.smn_auxiliar.aux_fecha_nac::date)) AS aux_edad,
	CASE
		WHEN smn_base.smn_auxiliar.aux_sexo='FE' THEN '${lbl:b_female}'	
		WHEN smn_base.smn_auxiliar.aux_sexo='MA' THEN '${lbl:b_male}'
	END AS aux_sexo
FROM
	smn_salud.smn_ordenes_medicas
	INNER JOIN
	smn_salud.smn_ingresos ON smn_salud.smn_ingresos.smn_ingresos_id=smn_salud.smn_ordenes_medicas.smn_ingreso_id
	LEFT OUTER JOIN
	smn_base.smn_entidades ON smn_base.smn_entidades.smn_entidades_id=smn_salud.smn_ingresos.smn_entidades_rf
	INNER JOIN
	smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id=smn_salud.smn_ingresos.smn_auxiliar_rf
WHERE
	smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id=${fld:id}