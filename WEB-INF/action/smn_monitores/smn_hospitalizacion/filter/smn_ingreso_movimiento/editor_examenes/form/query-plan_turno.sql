

select
smn_salud.smn_ruta_paciente.smn_ruta_id,
smn_salud.smn_ruta_paciente.rta_ticket,
smn_salud.smn_ruta_paciente.smn_ingreso_cola_virtual_id
from
smn_salud.smn_ruta_paciente
where
smn_salud.smn_ruta_paciente.smn_serie_id = (select
smn_salud.smn_series.sri_codigo
from
smn_salud.smn_series
where
smn_salud.smn_series.smn_series_id =(select
smn_salud.smn_planificacion_de_turno.smn_serie_id
from smn_salud.smn_planificacion_de_turno
where (smn_salud.smn_planificacion_de_turno.smn_usuario_id = 1 )))