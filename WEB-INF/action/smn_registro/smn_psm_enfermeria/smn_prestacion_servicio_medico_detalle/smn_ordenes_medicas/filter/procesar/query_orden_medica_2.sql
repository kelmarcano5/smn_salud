select smn_salud.smn_ordenes_medicas.*, 
${fld:smn_prestacion_servicio_medico_cabecera_id} as smn_prestacion_servicio_medico_cabecera_id, 
${fld:smn_ingreso_id} as smn_ingreso_id, 
${fld:smn_servicios_rf} as smn_servicios_rf
 from smn_salud.smn_ordenes_medicas
inner join smn_salud.smn_rel_orden_medica_servicios on smn_salud.smn_rel_orden_medica_servicios.smn_ordenes_medicas_id =  smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id
where smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id=${fld:smn_ordenes_medicas_id} and smn_salud.smn_ordenes_medicas.smn_ingreso_id=${fld:smn_ingreso_id}