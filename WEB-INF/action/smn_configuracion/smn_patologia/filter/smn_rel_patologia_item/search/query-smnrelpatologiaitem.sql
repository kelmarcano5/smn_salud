select
		smn_salud.smn_rel_patologia_item.smn_rel_patologia_item_id,
	smn_salud.smn_patologia.smn_patologia_id,
	smn_salud.smn_patologia.pat_descripcion as smn_patologia_id,
	smn_base.smn_item.itm_nombre as smn_item_rf,
	smn_salud.smn_rel_patologia_item.rps_cantidad,
	smn_salud.smn_rel_patologia_item.rps_fecha_registro
	
from
	smn_salud.smn_rel_patologia_item
	inner join smn_salud.smn_patologia on smn_salud.smn_patologia.smn_patologia_id = smn_salud.smn_rel_patologia_item.smn_patologia_id
	inner join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_salud.smn_rel_patologia_item.smn_item_rf
where
	smn_salud.smn_rel_patologia_item.smn_patologia_id='${fld:patologia_id}'
