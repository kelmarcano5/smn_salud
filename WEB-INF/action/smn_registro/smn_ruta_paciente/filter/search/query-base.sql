select
	smn_salud.smn_ruta_paciente.smn_ruta_id,
	(select smn_base.smn_clase_auxiliar.cla_codigo|| ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar  where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id is not null  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_salud.smn_ruta_paciente.smn_clase_auxiliar_rf  order by smn_base.smn_clase_auxiliar.cla_nombre ) as smn_clase_auxiliar_rf_combo,
	(select smn_base.smn_auxiliar.aux_nombres || '  ' ||  smn_base.smn_auxiliar.aux_apellidos from  smn_base.smn_auxiliar where smn_base.smn_auxiliar.smn_auxiliar_id is not null  and smn_base.smn_auxiliar.smn_auxiliar_id= smn_salud.smn_ruta_paciente.smn_auxiliar_rf  order by smn_base.smn_auxiliar.aux_apellidos ) as smn_auxiliar_rf_combo,
	smn_salud.smn_ruta_paciente.rta_numero_documento_identidad,
	smn_salud.smn_series.sri_codigo as smn_serie_id,
	smn_salud.smn_ruta_paciente.rta_ticket,
	case
		when smn_salud.smn_ruta_paciente.rta_estatus='AT' THEN 'En Servicio'
		when smn_salud.smn_ruta_paciente.rta_estatus='EA' THEN '${lbl:b_enaten}'
		when smn_salud.smn_ruta_paciente.rta_estatus='PE' THEN 'Pendiente'
		when smn_salud.smn_ruta_paciente.rta_estatus='AP' THEN 'Aprobado'
		when smn_salud.smn_ruta_paciente.rta_estatus='ED' THEN 'En Diagnostico'
		when smn_salud.smn_ruta_paciente.rta_estatus='IN' THEN 'Ingresado'
		when smn_salud.smn_ruta_paciente.rta_estatus='RV' then 'En Revision'
		when smn_salud.smn_ruta_paciente.rta_estatus='EG' then 'Egresado'
	end as rta_estatus,
	smn_salud.smn_ruta_paciente.rta_estatus as estatus,
	smn_salud.smn_ruta_paciente.rta_secuencia,
	smn_base.smn_unidades_servicios.uns_codigo||' '||smn_base.smn_unidades_servicios.uns_descripcion as smn_unidad_servicio_rf,
	smn_base.smn_grupos_prestadores.gpp_descripcion as smn_grupo_prestador_rf,
	smn_base.smn_prestadores_servicios.prs_descripcion as smn_prestador_servicio_rf,
	smn_salud.smn_ruta_paciente.rta_fecha_registro,
	smn_salud.smn_ruta_paciente.smn_auxiliar_rf as auxiliar
	
from
	smn_salud.smn_ruta_paciente
	left join smn_salud.smn_series on smn_salud.smn_series.sri_codigo = smn_salud.smn_ruta_paciente.smn_serie_id
	left join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_ruta_paciente.smn_auxiliar_rf
	left join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_salud.smn_ruta_paciente.smn_entidad_rf
	left join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_salud.smn_ruta_paciente.smn_unidad_servicio_rf
	left join smn_base.smn_grupos_prestadores on smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id = smn_salud.smn_ruta_paciente.smn_grupo_prestador_rf
	left join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_salud.smn_ruta_paciente.smn_prestador_servicio_rf
where
	smn_salud.smn_ruta_paciente.smn_ruta_id is not null and smn_salud.smn_ruta_paciente.smn_serie_id<>'F'
	${filter}

order by smn_salud.smn_ruta_paciente.rta_fecha_registro  desc limit 7
