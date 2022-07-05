select
		smn_salud.smn_habitaciones_disponibles.smn_habitaciones_disponibles_id,
select
		smn_salud.smn_habitaciones_disponibles.smn_habitaciones_disponibles_id,
	case
	when smn_salud.smn_habitaciones_disponibles.had_estatus='OC' then '${lbl:b_ocupada}'
	when smn_salud.smn_habitaciones_disponibles.had_estatus='DI' then '${lbl:b_disponible}'
	when smn_salud.smn_habitaciones_disponibles.had_estatus='EM' then '${lbl:b_en_mantenimiento}'
	when smn_salud.smn_habitaciones_disponibles.had_estatus='EP' then '${lbl:b_en_preparacion}'
	end as had_estatus,
	smn_salud.smn_habitaciones_disponibles.smn_habitaciones_id,
	smn_salud.smn_habitaciones_disponibles.smn_ingreso_id,
	smn_salud.smn_habitaciones_disponibles.had_fecha_ingreso,
	smn_salud.smn_habitaciones_disponibles.had_fecha_egreso,
	smn_salud.smn_habitaciones_disponibles.had_estatus,
	smn_salud.smn_habitaciones_disponibles.had_fecha_registro
	
from
	smn_salud.smn_habitaciones_disponibles
