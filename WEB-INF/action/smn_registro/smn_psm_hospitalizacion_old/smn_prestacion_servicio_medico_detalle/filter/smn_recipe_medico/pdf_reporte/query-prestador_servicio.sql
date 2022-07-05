SELECT
	smn_base.smn_prestadores_servicios.prs_codigo ||' - '|| smn_base.smn_prestadores_servicios.prs_descripcion AS smn_prestador_servicio_rf,
	smn_base.smn_auxiliar.aux_descripcion AS aux_nombre_prestador_servicio
FROM
	smn_salud.smn_recipe_medico
	LEFT OUTER JOIN
	smn_base.smn_prestadores_servicios ON smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id=smn_salud.smn_recipe_medico.smn_prestador_servicio_rf
	INNER JOIN
	smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id=smn_base.smn_prestadores_servicios.prs_auxiliar
WHERE
	smn_salud.smn_recipe_medico.smn_recipe_medico_id=${fld:id}