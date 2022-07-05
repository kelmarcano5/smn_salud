SELECT
smn_base.smn_item.smn_item_id AS "id",
smn_base.smn_item.itm_codigo || ' - ' || smn_base.smn_item.itm_nombre AS item
FROM
smn_base.smn_servicios_componentes
INNER JOIN smn_base.smn_componentes ON smn_base.smn_servicios_componentes.smn_componentes_id = smn_base.smn_componentes.smn_componentes_id
INNER JOIN smn_base.smn_nivel_estructura ON smn_base.smn_componentes.smn_item_rf = smn_base.smn_nivel_estructura.smn_nivel_estructura_id
INNER JOIN smn_base.smn_item ON smn_base.smn_nivel_estructura.smn_nivel_estructura_id = smn_base.smn_item.smn_nivel_estructura_id
INNER JOIN smn_base.smn_baremos_detalle ON smn_base.smn_item.smn_item_id = smn_base.smn_baremos_detalle.smn_item_rf
WHERE
smn_base.smn_servicios_componentes.smn_servicios_id = (
	SELECT
		smn_salud.smn_documento.smn_servicio_mmq_rf
	FROM
		smn_salud.smn_documento
WHERE
	smn_salud.smn_documento.smn_documento_id =${fld:id}) AND
smn_base.smn_baremos_detalle.smn_baremos_id = (select  smn_salud.smn_contratante.smn_baremos_id from smn_salud.smn_contratante 
inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_contratante_id = smn_salud.smn_contratante.smn_contratante_id
where smn_salud.smn_ingresos.smn_ingresos_id= ${fld:ingresoid}) AND
smn_base.smn_baremos_detalle.bad_estatus = 'A'