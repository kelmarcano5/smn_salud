select 
	rta.smn_ruta_id, 
	rta.smn_unidad_servicio_rf,
	rta.smn_auxiliar_rf,
	icv.smn_ingreso_cola_virtual_id,
	icv.smn_documento_id, 
	icv.icv_numero_ticket,
	icv.icv_numero_control,
	icv.icv_numero_documento_identidad
from 
	smn_salud.smn_ruta_paciente rta
inner join smn_salud.smn_ingreso_cola_virtual icv on
	rta.rta_numero_documento_identidad = icv.icv_numero_documento_identidad
inner join smn_salud.smn_series srie on
	rta.smn_serie_id = srie.sri_codigo
inner join smn_salud.smn_planificacion_de_turno pdt on
	srie.smn_series_id = pdt.smn_serie_id
where 
	rta.rta_estatus = 'PE' and 
	pdt.smn_usuario_id = ${fld:usuario} and
	rta.smn_unidad_servicio_rf = ${fld:unidad_prestador} and 
	pdt.smn_entidades_rf = ${fld:entidad_prestador} and
	pdt.smn_sucursales_rf = ${fld:sucursal_prestador} and
	pdt.smn_areas_servicios_rf = ${fld:area_prestador} and
	pdt.smn_unidad_servicio_rf = ${fld:unidad_prestador} and
	--rta.rta_fecha_registro = current_date and
	rta.rta_ejecutivo_asignado is null
order by rta.smn_ruta_id asc
limit 1