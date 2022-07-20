SELECT DISTINCT
smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id as id, smn_base.smn_grupos_prestadores.gpp_descripcion as item,
smn_base.smn_grupos_prestadores.gpp_is_pull as pull,
smn_salud.smn_agenda_medica.smn_prestador_servicio_rf as prestador
FROM
smn_base.smn_agenda
INNER JOIN smn_salud.smn_agenda_medica ON smn_base.smn_agenda.smn_agenda_id = smn_salud.smn_agenda_medica.smn_agenda_id
INNER JOIN smn_base.smn_grupo_prestador_servicio_frecuencia ON smn_salud.smn_agenda_medica.smn_grupo_prestador_servicio_rf = smn_base.smn_grupo_prestador_servicio_frecuencia.smn_grupos_prestadores_id
inner join smn_base.smn_grupos_prestadores on  smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id = smn_base.smn_grupo_prestador_servicio_frecuencia.smn_grupos_prestadores_id
WHERE
smn_base.smn_grupo_prestador_servicio_frecuencia.smn_servicios_id=${fld:id} and smn_salud.smn_agenda_medica.smn_areas_servicios_rf=${fld:area_prestador} and smn_base.smn_agenda.age_dia_semana = (select case 
WHEN to_char(current_date, 'DY') = 'SUN' THEN 'DO'
WHEN to_char(current_date, 'DY') = 'MON' THEN 'LU'
WHEN to_char(current_date, 'DY') = 'TUE' THEN 'MA'
WHEN to_char(current_date, 'DY') = 'WED' THEN 'MI'
WHEN to_char(current_date, 'DY') = 'THU' THEN 'JU'
WHEN to_char(current_date, 'DY') = 'FRI' THEN 'VI'
WHEN to_char(current_date, 'DY') = 'SAT' THEN 'SA'
end as dia from smn_base.smn_agenda limit 1) order by smn_salud.smn_agenda_medica.smn_prestador_servicio_rf asc