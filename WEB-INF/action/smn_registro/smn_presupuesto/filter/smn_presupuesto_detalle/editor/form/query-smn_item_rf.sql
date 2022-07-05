select DISTINCT smn_base.smn_item.smn_item_id as id, smn_base.smn_item.itm_nombre as item from smn_base.smn_item
inner join smn_base.smn_baremos_detalle on smn_base.smn_baremos_detalle.smn_item_rf = smn_base.smn_item.smn_item_id
where 
	smn_base.smn_baremos_detalle.bad_precio_moneda_local is not null
order by id, item asc