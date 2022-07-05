select 
	rta.smn_ruta_id, 
	rta.smn_unidad_servicio_rf,
	rta.smn_auxiliar_rf,
	icv.smn_ingreso_cola_virtual_id,
	icv.smn_documento_id, 
	rta.rta_ticket as icv_numero_ticket,
	icv.icv_numero_control,
	rta.rta_numero_documento_identidad as icv_numero_documento_identidad
from 
	smn_salud.smn_ruta_paciente rta
	left join smn_salud.smn_ingreso_cola_virtual icv on rta.rta_ticket = icv.icv_numero_ticket
	inner join smn_salud.smn_series srie on rta.smn_serie_id = srie.sri_codigo
	inner join smn_salud.smn_planificacion_de_turno pdt on srie.smn_series_id = pdt.smn_serie_id
where 
	rta.rta_estatus = 'PE' and rta.rta_fecha_registro = ${fld:fecha_ingreso} and rta.rta_ticket = ${fld:ticket} and rta.rta_secuencia=1
	--  and
	-- rta.smn_entidad_rf = ${fld:entidad_prestador} and
	-- rta.smn_sucursal_rf = ${fld:sucursal_prestador} and
	-- rta.smn_area_servicio_rf = ${fld:area_prestador} and
	-- rta.smn_unidad_servicio_rf = ${fld:unidad_prestador} 
order by rta.smn_ruta_id asc
limit 1