SELECT
	smn_base.smn_unidades_servicios.smn_unidades_servicios_id AS ID,
	smn_base.smn_unidades_servicios.uns_codigo || ' - ' || smn_base.smn_unidades_servicios.uns_descripcion AS item 
FROM
	smn_base.smn_unidades_servicios 
WHERE
	smn_base.smn_unidades_servicios.smn_areas_servicios_id='${fld:smn_area_servicio}' and smn_base.smn_unidades_servicios.smn_unidades_servicios_id='${fld:smn_unidades_servicios_id2}' --and smn_base.smn_unidades_servicios.smn_tipo_unidad_administrativa='DS'
ORDER BY
	smn_base.smn_unidades_servicios.uns_descripcion