select smn_base.smn_item.smn_item_id as id, smn_base.smn_item.itm_codigo ||' - '|| smn_base.smn_item.itm_nombre as item from smn_base.smn_item
inner join smn_inventario.smn_caracteristica_item on smn_inventario.smn_caracteristica_item.smn_item_rf = smn_base.smn_item.smn_item_id
--inner join smn_base.smn_baremos_detalle on smn_base.smn_baremos_detalle.smn_baremos_id = (select smn_salud.smn_contratante.smn_baremos_id from smn_salud.smn_contratante 
	--where smn_salud.smn_contratante.smn_contratante_id=(select smn_salud.smn_ingresos.smn_contratante_id from smn_salud.smn_ingresos 
	--	where smn_salud.smn_ingresos.smn_ingresos_id=${fld:smn_ingreso_id}))
where smn_inventario.smn_caracteristica_item.cit_es_medicamento='SI'