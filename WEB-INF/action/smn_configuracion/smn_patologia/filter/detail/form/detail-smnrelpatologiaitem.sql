select
select
	smn_salud.smn_rel_patologia_item.*
from
	smn_salud.smn_rel_patologia_item,
	smn_salud.smn_patologia
where
		smn_salud.smn_rel_patologia_item.smn_patologia_id=smn_salud.smn_patologia.smn_patologia_id and
		smn_salud.smn_patologia.smn_patologia_id=${fld:id}
