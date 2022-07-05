select
select
	smn_base.smn_tipos_servicios.tsr_descripcion,
	case
	when smn_salud.smn_habitaciones.hab_estatus='AC' then '${lbl:b_disponible}'
	when smn_salud.smn_habitaciones.hab_estatus='AC' then '${lbl:b_no_disponible}'
	when smn_salud.smn_habitaciones.hab_estatus='AC' then '${lbl:b_reservada}'
	end as hab_estatus,
	case
	when smn_salud.smn_habitaciones.hab_clase='A' then '${lbl:b_a}'
	when smn_salud.smn_habitaciones.hab_clase='B' then '${lbl:b_b}'
	when smn_salud.smn_habitaciones.hab_clase='C' then '${lbl:b_c}'
	end as hab_clase,
select
	smn_salud.smn_habitaciones.*
from
	smn_base.smn_tipos_servicios,
	smn_salud.smn_habitaciones
where
	smn_base.smn_tipos_servicios.smn_tipos_servicios_id = smn_salud.smn_habitaciones.hab_tipo_servicio and
	smn_habitaciones_id = ${fld:id}
