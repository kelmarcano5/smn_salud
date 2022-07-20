SELECT
	smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id AS id,
	smn_base.smn_grupos_prestadores.gpp_codigo || ' - ' || smn_base.smn_grupos_prestadores.gpp_descripcion AS item 
FROM
	smn_base.smn_grupos_prestadores 
WHERE
	smn_base.smn_grupos_prestadores.gpp_unidad_servicio=${fld:id}
ORDER BY
	smn_base.smn_grupos_prestadores.gpp_codigo asc