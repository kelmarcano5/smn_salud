SELECT
	smn_base.smn_prestadores_servicios.prs_codigo ||' - '|| smn_base.smn_prestadores_servicios.prs_descripcion AS smn_prestador_servicio_rf,
	smn_base.smn_auxiliar.aux_nombres ||' '|| smn_base.smn_auxiliar.aux_apellidos AS aux_nombre_prestador_servicio,
	CASE
		WHEN smn_base.smn_auxiliar.aux_sexo='MA' THEN 'Dr.'
		ELSE 'Dra.'
	END AS prefijo,
	smn_base.smn_especialidad.esp_descripcion
FROM
	smn_salud.smn_recipe_medico
	LEFT OUTER JOIN
	smn_base.smn_prestadores_servicios ON smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id=smn_salud.smn_recipe_medico.smn_prestador_servicio_rf
	left JOIN
	smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id=smn_base.smn_prestadores_servicios.prs_auxiliar
	LEFT JOIN
	smn_base.smn_prestadores_servicios_especialidad ON smn_base.smn_prestadores_servicios_especialidad.smn_prestadores_servicios_id=smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id
	LEFT JOIN
	smn_base.smn_especialidad ON smn_base.smn_especialidad.smn_especialidad_id=smn_base.smn_prestadores_servicios_especialidad.smn_especialidad_id
WHERE
	smn_salud.smn_recipe_medico.smn_recipe_medico_id=${fld:id}