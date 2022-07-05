select DISTINCT smn_salud.smn_ruta_paciente.rta_numero_documento_identidad as icv_numero_documento_identidad, 
smn_salud.smn_ruta_paciente.rta_ticket as icv_numero_ticket, 
contratante.aux_descripcion as smn_contratante_id,
smn_base.smn_grupos_prestadores.gpp_descripcion as smn_grupo_prestador_rf, 
smn_base.smn_unidades_servicios.uns_descripcion as smn_unidad_servicio_rf_pres, 
smn_salud.smn_ingreso_cola_virtual.icv_fecha_registro,
ejecutivo.aux_descripcion as ejecutivo_asignado,
smn_salud.smn_ruta_paciente.rta_hora_llegada_unidad as hora_llegada,
case
		when smn_salud.smn_ruta_paciente.rta_estatus='AT' THEN 'En Servicio'
		when smn_salud.smn_ruta_paciente.rta_estatus='EA' THEN '${lbl:b_enaten}'
		when smn_salud.smn_ruta_paciente.rta_estatus='PE' THEN 'Pendiente'
		when smn_salud.smn_ruta_paciente.rta_estatus='AP' THEN 'Aprobado'
		when smn_salud.smn_ruta_paciente.rta_estatus='ED' THEN 'En Diagnostico'
		when smn_salud.smn_ruta_paciente.rta_estatus='IN' THEN 'Ingresado'
		when smn_salud.smn_ruta_paciente.rta_estatus='RV' THEN 'Revision'
		when smn_salud.smn_ruta_paciente.rta_estatus='EG' THEN 'Egresado'
end as rta_estatus,
smn_salud.smn_ruta_paciente.smn_ruta_id
from smn_salud.smn_ruta_paciente
left join smn_salud.smn_ingreso_cola_virtual on smn_salud.smn_ingreso_cola_virtual.icv_numero_ticket = smn_salud.smn_ruta_paciente.rta_ticket
inner join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_contratante_id = smn_salud.smn_ingreso_cola_virtual.smn_contratante_id
inner join smn_base.smn_auxiliar contratante on contratante.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf
inner join smn_base.smn_grupos_prestadores on smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id = smn_salud.smn_ingreso_cola_virtual.smn_grupo_prestador_rf
left join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_salud.smn_ingreso_cola_virtual.smn_unidad_servicio_rf_pres
left join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_salud.smn_ruta_paciente.rta_ejecutivo_asignado
left join smn_base.smn_auxiliar ejecutivo on ejecutivo.smn_auxiliar_id = smn_base.smn_usuarios.smn_auxiliar_rf
where smn_salud.smn_ingreso_cola_virtual.icv_fecha_registro=CURRENT_DATE 
and smn_salud.smn_ingreso_cola_virtual.smn_entidad_rf = ${fld:entidad_prestador} and 
	 smn_salud.smn_ingreso_cola_virtual.smn_sucursal_rf = ${fld:sucursal_prestador} and
	  smn_salud.smn_ingreso_cola_virtual.smn_area_servicio_rf = ${fld:area_prestador} and
	  smn_salud.smn_ingreso_cola_virtual.smn_unidad_servicio_rf = ${fld:unidad_prestador} 
	 and smn_salud.smn_ruta_paciente.rta_secuencia=1 and smn_salud.smn_ruta_paciente.smn_unidad_servicio_rf=${fld:unidad_prestador} and smn_salud.smn_ruta_paciente.rta_estatus IN ('AT','EG')
order by smn_salud.smn_ruta_paciente.rta_hora_llegada_unidad desc

