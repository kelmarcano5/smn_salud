select
		smn_salud.smn_rel_patologia_item.smn_rel_patologia_item_id,
	smn_salud.smn_patologia.smn_patologia_id,
	smn_salud.smn_patologia.pat_codigo as pat_codigo_pl0,
select
		smn_salud.smn_rel_patologia_item.smn_rel_patologia_item_id,
select
		smn_salud.smn_rel_patologia_item.smn_rel_patologia_item_id,
	smn_salud.smn_rel_patologia_item.smn_patologia_id,
	smn_salud.smn_rel_patologia_item.smn_item_rf,
	smn_salud.smn_rel_patologia_item.rps_cantidad,
	smn_salud.smn_rel_patologia_item.rps_fecha_registro
	
from
	smn_salud.smn_patologia,
	smn_salud.smn_rel_patologia_item
where
	smn_salud.smn_patologia.smn_patologia_id=smn_salud.smn_rel_patologia_item.smn_patologia_id
