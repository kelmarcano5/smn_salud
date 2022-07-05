select
select
	case
	when smn_salud.smn_habitaciones_disponibles.had_estatus='OC' then '${lbl:b_ocupada}'
	when smn_salud.smn_habitaciones_disponibles.had_estatus='DI' then '${lbl:b_disponible}'
	when smn_salud.smn_habitaciones_disponibles.had_estatus='EM' then '${lbl:b_en_mantenimiento}'
	when smn_salud.smn_habitaciones_disponibles.had_estatus='EP' then '${lbl:b_en_preparacion}'
	end as had_estatus,
	smn_salud.smn_habitaciones_disponibles.*
from
	smn_salud.smn_habitaciones_disponibles
where
	smn_habitaciones_disponibles_id = ${fld:id}
