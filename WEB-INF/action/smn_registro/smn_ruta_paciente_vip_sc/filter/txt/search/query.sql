select
		smn_salud.smn_ruta_paciente.smn_ruta_id,
	(select smn_salud.smn_ingreso_cola_virtual.icv_numero_documento_identidad || ' - ' || smn_salud.smn_ingreso_cola_virtual.icv_numero_ticket from  smn_salud.smn_ingreso_cola_virtual  where smn_salud.smn_ingreso_cola_virtual.smn_ingreso_cola_virtual_id is not null  and smn_salud.smn_ingreso_cola_virtual.smn_ingreso_cola_virtual_id=smn_salud.smn_ruta_paciente.smn_ingreso_cola_virtual_id  order by smn_salud.smn_ingreso_cola_virtual.icv_numero_ticket ) as smn_ingreso_cola_virtual_id,
	(select smn_base.smn_clase_auxiliar.cla_codigo|| ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar  where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id is not null  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_salud.smn_ruta_paciente.smn_clase_auxiliar_rf  order by smn_base.smn_clase_auxiliar.cla_nombre ) as smn_clase_auxiliar_rf,
	(select smn_base.smn_auxiliar.aux_nombres || '  ' ||  smn_base.smn_auxiliar.aux_apellidos from  smn_base.smn_auxiliar where smn_base.smn_auxiliar.smn_auxiliar_id is not null  and smn_base.smn_auxiliar.smn_auxiliar_id= smn_salud.smn_ruta_paciente.smn_auxiliar_rf  order by smn_base.smn_auxiliar.aux_apellidos ) as smn_auxiliar_rf_combo,
	smn_salud.smn_ruta_paciente.rta_numero_documento_identidad,
	smn_salud.smn_ruta_paciente.smn_serie_id,
	smn_salud.smn_ruta_paciente.rta_ticket,
	smn_salud.smn_ruta_paciente.rta_fecha_registro
	
from
	smn_salud.smn_ruta_paciente

	