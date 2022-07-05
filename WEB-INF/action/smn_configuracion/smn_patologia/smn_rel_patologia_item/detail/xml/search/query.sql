select
	smn_salud.smn_patologia.smn_patologia_id,
	smn_salud.smn_patologia.pat_codigo as pat_codigo_pl0,
select
select
	smn_salud.smn_rel_patologia_item.*
from
	smn_salud.smn_patologia,
	smn_salud.smn_rel_patologia_item
where
	smn_salud.smn_patologia.smn_patologia_id=smn_salud.smn_rel_patologia_item.smn_patologia_id
	and
	smn_rel_patologia_item_id = ${fld:id}
