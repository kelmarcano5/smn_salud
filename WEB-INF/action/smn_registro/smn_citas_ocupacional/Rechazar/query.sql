with works as(
select smn_salud.smn_balance_capacidad_unidad.bcu_cant_citas_anuladas as anuladas from smn_salud.smn_balance_capacidad_unidad where smn_salud.smn_balance_capacidad_unidad.bcu_fecha_evento=${fld:fecha}
and smn_salud.smn_balance_capacidad_unidad.smn_entidades_rf=(select smn_base.smn_entidades.smn_entidades_id from smn_base.smn_entidades
		inner join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.ase_empresa = smn_base.smn_entidades.smn_entidades_id
		inner join smn_base.smn_rel_servicio_area_unidad on smn_base.smn_rel_servicio_area_unidad.smn_areas_servicios_rf = smn_base.smn_areas_servicios.smn_areas_servicios_id
			where smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf=${fld:unidad} limit 1)
	and smn_salud.smn_balance_capacidad_unidad.smn_sucursales_rf=(select smn_base.smn_sucursales.smn_sucursales_id from smn_base.smn_sucursales
		inner join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.ase_sucursal = smn_base.smn_sucursales.smn_sucursales_id
			inner join smn_base.smn_rel_servicio_area_unidad on smn_base.smn_rel_servicio_area_unidad.smn_areas_servicios_rf = smn_base.smn_areas_servicios.smn_areas_servicios_id
				where smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf=${fld:unidad} limit 1)
	and smn_salud.smn_balance_capacidad_unidad.smn_areas_servicios_rf=(select smn_base.smn_areas_servicios.smn_areas_servicios_id from smn_base.smn_areas_servicios
			inner join smn_base.smn_rel_servicio_area_unidad on smn_base.smn_rel_servicio_area_unidad.smn_areas_servicios_rf = smn_base.smn_areas_servicios.smn_areas_servicios_id
				where smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf=${fld:unidad} limit 1)
)
update smn_salud.smn_balance_capacidad_unidad set bcu_cant_citas_anuladas=bcu_cant_citas_anuladas+${fld:cant} where smn_salud.smn_balance_capacidad_unidad.bcu_fecha_evento=${fld:fecha}
and smn_salud.smn_balance_capacidad_unidad.smn_entidades_rf=(select smn_base.smn_entidades.smn_entidades_id from smn_base.smn_entidades
		inner join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.ase_empresa = smn_base.smn_entidades.smn_entidades_id
		inner join smn_base.smn_rel_servicio_area_unidad on smn_base.smn_rel_servicio_area_unidad.smn_areas_servicios_rf = smn_base.smn_areas_servicios.smn_areas_servicios_id
			where smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf=${fld:unidad} limit 1)
	and smn_salud.smn_balance_capacidad_unidad.smn_sucursales_rf=(select smn_base.smn_sucursales.smn_sucursales_id from smn_base.smn_sucursales
		inner join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.ase_sucursal = smn_base.smn_sucursales.smn_sucursales_id
			inner join smn_base.smn_rel_servicio_area_unidad on smn_base.smn_rel_servicio_area_unidad.smn_areas_servicios_rf = smn_base.smn_areas_servicios.smn_areas_servicios_id
				where smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf=${fld:unidad} limit 1)
	and smn_salud.smn_balance_capacidad_unidad.smn_areas_servicios_rf=(select smn_base.smn_areas_servicios.smn_areas_servicios_id from smn_base.smn_areas_servicios
			inner join smn_base.smn_rel_servicio_area_unidad on smn_base.smn_rel_servicio_area_unidad.smn_areas_servicios_rf = smn_base.smn_areas_servicios.smn_areas_servicios_id
				where smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf=${fld:unidad} limit 1)