SELECT DISTINCT
smn_base.smn_agenda.age_dia_semana,
smn_base.smn_grupo_prestador_servicio_frecuencia.smn_servicios_id as id, 
smn_base.smn_servicios.svc_descripcion as item
FROM
smn_base.smn_agenda
INNER JOIN smn_salud.smn_agenda_medica ON smn_base.smn_agenda.smn_agenda_id = smn_salud.smn_agenda_medica.smn_agenda_id
INNER JOIN smn_base.smn_grupo_prestador_servicio_frecuencia ON smn_salud.smn_agenda_medica.smn_grupo_prestador_servicio_rf = smn_base.smn_grupo_prestador_servicio_frecuencia.smn_grupos_prestadores_id
inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_base.smn_grupo_prestador_servicio_frecuencia.smn_servicios_id
left join smn_base.smn_baremos on smn_base.smn_baremos.smn_baremos_id = smn_base.smn_servicios.smn_baremos_id
inner join smn_base.smn_tipos_servicios on smn_base.smn_tipos_servicios.smn_tipos_servicios_id = smn_base.smn_servicios.smn_tipo_servicio_rf
WHERE
smn_base.smn_agenda.age_dia_semana = (select case 
WHEN to_char(current_date, 'DY') = 'SUN' THEN 'DO'
WHEN to_char(current_date, 'DY') = 'MON' THEN 'LU'
WHEN to_char(current_date, 'DY') = 'TUE' THEN 'MA'
WHEN to_char(current_date, 'DY') = 'WED' THEN 'MI'
WHEN to_char(current_date, 'DY') = 'THU' THEN 'JU'
WHEN to_char(current_date, 'DY') = 'FRI' THEN 'VI'
WHEN to_char(current_date, 'DY') = 'SAT' THEN 'SA'
end as dia from smn_base.smn_agenda limit 1) --and 
--smn_salud.smn_agenda_medica.smn_entidades_rf = ${fld:entidad_prestador} --OR
--smn_salud.smn_agenda_medica.smn_sucursales_rf = ${fld:sucursal_prestador} 