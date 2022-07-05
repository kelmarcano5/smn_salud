UPDATE smn_salud.smn_balance_capacidad_unidad SET 
	bcu_cant_citas_otorgadas=(SELECT smn_salud.smn_balance_capacidad_unidad.bcu_cant_citas_otorgadas FROM smn_salud.smn_balance_capacidad_unidad
where smn_salud.smn_balance_capacidad_unidad.smn_unidad_servicio_rf=${fld:unidad} and smn_salud.smn_balance_capacidad_unidad.bcu_fecha_evento=${fld:fecha} limit 1)+1,
	bcu_disponibilidad_unidad=(SELECT smn_salud.smn_balance_capacidad_unidad.bcu_disponibilidad_unidad FROM smn_salud.smn_balance_capacidad_unidad
where smn_salud.smn_balance_capacidad_unidad.smn_unidad_servicio_rf=${fld:unidad} and smn_salud.smn_balance_capacidad_unidad.bcu_fecha_evento=${fld:fecha} limit 1)-1

WHERE
	 bcu_fecha_evento=${fld:fecha} and smn_unidad_servicio_rf=${fld:unidad} 

