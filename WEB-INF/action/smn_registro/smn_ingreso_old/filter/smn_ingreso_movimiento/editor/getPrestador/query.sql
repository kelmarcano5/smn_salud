SELECT DISTINCT smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id as id, 
smn_base.smn_prestadores_servicios.prs_descripcion as item,
smn_salud.smn_agenda_medica.smn_unidades_servicios_rf as id_unidad
FROM smn_base.smn_prestadores_servicios 
INNER JOIN smn_salud.smn_agenda_medica ON smn_salud.smn_agenda_medica.smn_prestador_servicio_rf = smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id
inner join smn_base.smn_grupos_prestadores on  smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id = 4
inner join smn_base.smn_agenda on smn_base.smn_agenda.smn_agenda_id = smn_salud.smn_agenda_medica.smn_agenda_id
WHERE
smn_salud.smn_agenda_medica.smn_grupo_prestador_servicio_rf=${fld:id} and smn_base.smn_agenda.age_dia_semana_en = (select case 
WHEN to_char(current_date, 'DY') = 'SUN' THEN 'SUN'
WHEN to_char(current_date, 'DY') = 'MON' THEN 'MON'
WHEN to_char(current_date, 'DY') = 'TUE' THEN 'TUE'
WHEN to_char(current_date, 'DY') = 'WED' THEN 'WED'
WHEN to_char(current_date, 'DY') = 'THU' THEN 'THU'
WHEN to_char(current_date, 'DY') = 'FRI' THEN 'FRI'
WHEN to_char(current_date, 'DY') = 'SAT' THEN 'SAT'
end as dia from smn_base.smn_agenda limit 1)