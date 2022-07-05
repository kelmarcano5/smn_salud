select smn_base.smn_item.smn_item_id as id, smn_base.smn_item.itm_codigo ||' - '|| smn_base.smn_item.itm_nombre as item from smn_base.smn_item
inner join smn_inventario.smn_caracteristica_item on smn_inventario.smn_caracteristica_item.smn_item_rf = smn_base.smn_item.smn_item_id
inner join smn_inventario.smn_principio_activo on smn_inventario.smn_principio_activo.smn_principio_activo_id = smn_inventario.smn_caracteristica_item.smn_principio_activo_rf
where
smn_inventario.smn_caracteristica_item.smn_principio_activo_rf=${fld:id} and smn_inventario.smn_caracteristica_item.cit_es_medicamento='SI'