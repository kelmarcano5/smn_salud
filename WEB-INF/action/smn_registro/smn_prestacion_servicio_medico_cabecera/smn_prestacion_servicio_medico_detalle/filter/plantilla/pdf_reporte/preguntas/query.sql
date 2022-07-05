select
	smn_base.smn_rel_cues_secc_preg.*,
	smn_base.smn_rel_cues_secc_preg.smn_pregunta_id AS smn_pregunta_rf,
	smn_base.smn_rel_cues_secc_preg.csp_tamano_letra||'px' as csp_tamano_letra,
	smn_base.smn_rel_cues_secc_preg.csp_espacio_identacion || 'px' as csp_espacio_identacion,
	smn_base.smn_pregunta.prg_descripcion as pregunta_combo,
	(select tva_descripcion from smn_base.smn_tipo_variable where smn_tipo_variable_id = smn_tipo_variable_col_1_id) as smn_tipo_variable_col_1_combo,
	(select tva_descripcion from smn_base.smn_tipo_variable where smn_tipo_variable_id = smn_tipo_variable_col_2_id) as smn_tipo_variable_col_2_combo,
	(select tva_descripcion from smn_base.smn_tipo_variable where smn_tipo_variable_id = smn_tipo_variable_col_3_id) as smn_tipo_variable_col_3_combo,
	(select tva_descripcion from smn_base.smn_tipo_variable where smn_tipo_variable_id = smn_tipo_variable_col_4_id) as smn_tipo_variable_col_4_combo,
	(select smn_salud.smn_salud_plantilla_detalle.spd_valor_respuesta from smn_salud.smn_salud_plantilla_detalle inner join smn_base.smn_rel_cues_secc_preg on smn_salud.smn_salud_plantilla_detalle.smn_rel_cues_secc_preg_id=smn_base.smn_rel_cues_secc_preg.smn_rel_cues_secc_preg_id where smn_salud.smn_salud_plantilla_detalle.smn_salud_plantilla_cabecera_id=${fld:plantilla_salud_id} and smn_salud.smn_salud_plantilla_detalle.smn_variable_rf=smn_tipo_variable_col_1_id and smn_base.smn_rel_cues_secc_preg.smn_pregunta_id=smn_base.smn_pregunta.smn_pregunta_id) as respuesta1,
	(select smn_salud.smn_salud_plantilla_detalle.spd_valor_respuesta from smn_salud.smn_salud_plantilla_detalle inner join smn_base.smn_rel_cues_secc_preg on smn_salud.smn_salud_plantilla_detalle.smn_rel_cues_secc_preg_id=smn_base.smn_rel_cues_secc_preg.smn_rel_cues_secc_preg_id where smn_salud.smn_salud_plantilla_detalle.smn_salud_plantilla_cabecera_id=${fld:plantilla_salud_id} and smn_salud.smn_salud_plantilla_detalle.smn_variable_rf=smn_tipo_variable_col_2_id and smn_base.smn_rel_cues_secc_preg.smn_pregunta_id=smn_base.smn_pregunta.smn_pregunta_id) as respuesta2,
	(select smn_salud.smn_salud_plantilla_detalle.spd_valor_respuesta from smn_salud.smn_salud_plantilla_detalle inner join smn_base.smn_rel_cues_secc_preg on smn_salud.smn_salud_plantilla_detalle.smn_rel_cues_secc_preg_id=smn_base.smn_rel_cues_secc_preg.smn_rel_cues_secc_preg_id where smn_salud.smn_salud_plantilla_detalle.smn_salud_plantilla_cabecera_id=${fld:plantilla_salud_id} and smn_salud.smn_salud_plantilla_detalle.smn_variable_rf=smn_tipo_variable_col_3_id and smn_base.smn_rel_cues_secc_preg.smn_pregunta_id=smn_base.smn_pregunta.smn_pregunta_id) as respuesta3,
	(select smn_salud.smn_salud_plantilla_detalle.spd_valor_respuesta from smn_salud.smn_salud_plantilla_detalle inner join smn_base.smn_rel_cues_secc_preg on smn_salud.smn_salud_plantilla_detalle.smn_rel_cues_secc_preg_id=smn_base.smn_rel_cues_secc_preg.smn_rel_cues_secc_preg_id where smn_salud.smn_salud_plantilla_detalle.smn_salud_plantilla_cabecera_id=${fld:plantilla_salud_id} and smn_salud.smn_salud_plantilla_detalle.smn_variable_rf=smn_tipo_variable_col_4_id and smn_base.smn_rel_cues_secc_preg.smn_pregunta_id=smn_base.smn_pregunta.smn_pregunta_id) as respuesta4,
	(SELECT
		CASE
			WHEN tva_mostrar_titulo='SI' THEN ''
			WHEN tva_mostrar_titulo='NO' THEN 'none'
		END AS mostrar_titulo
	FROM
		smn_base.smn_tipo_variable
	WHERE 
		smn_tipo_variable_id = smn_tipo_variable_col_1_id
	) AS mostrar_variable_1,
	(SELECT
		CASE
			WHEN tva_mostrar_titulo='SI' THEN ''
			WHEN tva_mostrar_titulo='NO' THEN 'none'
		END AS mostrar_titulo
	FROM
		smn_base.smn_tipo_variable
	WHERE 
		smn_tipo_variable_id = smn_tipo_variable_col_2_id
	) AS mostrar_variable_2,
	(SELECT
		CASE
			WHEN tva_mostrar_titulo='SI' THEN ''
			WHEN tva_mostrar_titulo='NO' THEN 'none'
		END AS mostrar_titulo
	FROM
		smn_base.smn_tipo_variable
	WHERE 
		smn_tipo_variable_id = smn_tipo_variable_col_3_id
	) AS mostrar_variable_3,
	(SELECT
		CASE
			WHEN tva_mostrar_titulo='SI' THEN ''
			WHEN tva_mostrar_titulo='NO' THEN 'none'
		END AS mostrar_titulo
	FROM
		smn_base.smn_tipo_variable
	WHERE 
		smn_tipo_variable_id = smn_tipo_variable_col_4_id
	) AS mostrar_variable_4,
	(select (tva_limite_caracteres*tva_limite_lineas) from smn_base.smn_tipo_variable where smn_tipo_variable_id = smn_tipo_variable_col_1_id) as smn_limite_total_col_1,
	(select (tva_limite_caracteres*tva_limite_lineas) from smn_base.smn_tipo_variable where smn_tipo_variable_id = smn_tipo_variable_col_2_id) as smn_limite_total_col_2,
	(select (tva_limite_caracteres*tva_limite_lineas) from smn_base.smn_tipo_variable where smn_tipo_variable_id = smn_tipo_variable_col_3_id) as smn_limite_total_col_3,
	(select (tva_limite_caracteres*tva_limite_lineas) from smn_base.smn_tipo_variable where smn_tipo_variable_id = smn_tipo_variable_col_4_id) as smn_limite_total_col_4,
	(select tva_limite_lineas from smn_base.smn_tipo_variable where smn_tipo_variable_id = smn_tipo_variable_col_1_id) as smn_limite_lineas_col_1,
	(select tva_limite_lineas from smn_base.smn_tipo_variable where smn_tipo_variable_id = smn_tipo_variable_col_2_id) as smn_limite_lineas_col_2,
	(select tva_limite_lineas from smn_base.smn_tipo_variable where smn_tipo_variable_id = smn_tipo_variable_col_3_id) as smn_limite_lineas_col_3,
	(select tva_limite_lineas from smn_base.smn_tipo_variable where smn_tipo_variable_id = smn_tipo_variable_col_4_id) as smn_limite_lineas_col_4
from
	smn_base.smn_rel_cuestionario_seccion
	LEFT OUTER JOIN 
	smn_base.smn_rel_cues_secc_preg ON smn_base.smn_rel_cuestionario_seccion.smn_rel_cuestionario_seccion_id = smn_base.smn_rel_cues_secc_preg.smn_rel_cuestionario_seccion_id
	LEFT OUTER JOIN
	smn_base.smn_pregunta ON smn_base.smn_pregunta.smn_pregunta_id = smn_base.smn_rel_cues_secc_preg.smn_pregunta_id
where
	smn_base.smn_rel_cuestionario_seccion.smn_rel_cuestionario_seccion_id = ${fld:id}