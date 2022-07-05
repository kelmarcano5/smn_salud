select  smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id as id, 
	smn_base.smn_prestadores_servicios.prs_codigo || ' - ' || smn_base.smn_prestadores_servicios.prs_descripcion as item 
from smn_base.smn_prestadores_servicios 
inner join smn_base.smn_grupo_prestador_servicio_frecuencia on
smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_base.smn_grupo_prestador_servicio_frecuencia.smn_prestadores_servicios_id
inner join smn_base.smn_prestadores_servicios_agenda on
smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_base.smn_prestadores_servicios_agenda.smn_prestadores_servicios_id
inner join smn_base.smn_agenda on
smn_base.smn_prestadores_servicios_agenda.smn_agenda_id = smn_base.smn_agenda.smn_agenda_id
where smn_base.smn_grupo_prestador_servicio_frecuencia.smn_servicios_id = ${fld:id} and 
to_char(current_date, 'DY') = smn_base.smn_agenda.age_dia_semana_en
group by smn_base.smn_prestadores_servicios_agenda.smn_prestadores_servicios_id, id, item
order by smn_base.smn_prestadores_servicios.prs_descripcion