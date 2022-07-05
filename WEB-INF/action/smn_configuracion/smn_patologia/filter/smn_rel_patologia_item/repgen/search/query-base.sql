select
		smn_salud.smn_rel_patologia_item.smn_rel_patologia_item_id,
	${field}
from
	smn_salud.smn_rel_patologia_item
where
		smn_salud.smn_rel_patologia_item.smn_rel_patologia_item_id is not null
	${filter}
	
	
