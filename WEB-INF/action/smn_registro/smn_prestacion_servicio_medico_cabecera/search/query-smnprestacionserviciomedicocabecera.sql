select distinct
		smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id,
	case
	when smn_salud.smn_prestacion_servicio_medico_cabecera.psc_estatus='PE' then '${lbl:b_pending}'
	when smn_salud.smn_prestacion_servicio_medico_cabecera.psc_estatus='EA' then '${lbl:b_in_atention}'
	when smn_salud.smn_prestacion_servicio_medico_cabecera.psc_estatus='AT' then '${lbl:b_atending}'
	when smn_salud.smn_prestacion_servicio_medico_cabecera.psc_estatus='PA' then '${lbl:b_paid}'
	end as psc_estatus,
	smn_salud.smn_ingresos.smn_ingresos_id ||' - '|| smn_salud.smn_ingresos.smn_documento_id as smn_ingresos_id,
	smn_salud.smn_prestacion_servicio_medico_cabecera.smn_mov_caja_cabecera_id,
	smn_base.smn_unidades_servicios.uns_codigo ||' - '||smn_base.smn_unidades_servicios.uns_descripcion as smn_unidades_servicios_rf,
	smn_salud.smn_prestacion_servicio_medico_cabecera.psc_fecha_registro,
	smn_salud.smn_ingresos.igs_doc_origen as doc_origen,
	smn_salud.smn_documento.doc_codigo ||' - '|| smn_salud.smn_documento.doc_nombre as documento,
	smn_salud.smn_ingresos.igs_num_ingreso as document_num_ingreso,
	smn_salud.smn_ingresos.igs_ticket as ticket,
	smn_base.smn_auxiliar.aux_num_doc_oficial as documento_identidad,
	smn_base.smn_auxiliar.aux_nombres ||' '|| smn_base.smn_auxiliar.aux_apellidos as nombre_paciente,
	smn_base.smn_auxiliar.aux_num_doc_oficial as cedula,
	case
		when smn_base.smn_auxiliar.aux_sexo='MA' then 'Masculino'
		when smn_base.smn_auxiliar.aux_sexo='FE' then 'Femenino'
	end as sexo,
	date_part('year', Age(smn_base.smn_auxiliar.aux_fecha_nac)) as edad,
	smn_salud.smn_ingresos.igs_fecha_ingreso as fecha_ingreso,
	smn_base.smn_auxiliar.smn_auxiliar_id as codigopaciente,
	smn_salud.smn_prestacion_servicio_medico_cabecera.psc_estatus_financiero,
	smn_base.smn_grupos_prestadores.gpp_codigo ||' - '|| smn_base.smn_grupos_prestadores.gpp_descripcion as smn_grupos_prestadores,
	smn_salud.smn_ingresos.smn_auxiliar_rf
from
	smn_salud.smn_prestacion_servicio_medico_cabecera
	inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_prestacion_servicio_medico_cabecera.smn_ingresos_id
	inner join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_ingresos.smn_documento_id
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_ingresos.smn_auxiliar_rf
	inner join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_salud.smn_prestacion_servicio_medico_cabecera.smn_unidades_servicios_rf
	inner join smn_base.smn_rel_servicio_area_unidad on smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf = smn_salud.smn_prestacion_servicio_medico_cabecera.smn_unidades_servicios_rf
	inner join smn_base.smn_grupos_prestadores on smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id = smn_salud.smn_prestacion_servicio_medico_cabecera.smn_grupo_prestador_rf
where
	 smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf = ${fld:unidad_prestador} and 
	 smn_salud.smn_prestacion_servicio_medico_cabecera.smn_grupo_prestador_rf = (select smn_base.smn_rel_grupo_prestador_servicio.smn_grupos_prestadores_id from smn_base.smn_rel_grupo_prestador_servicio 
where smn_base.smn_rel_grupo_prestador_servicio.smn_prestadores_servicios_id=${fld:prestador} limit 1)
	 and smn_salud.smn_prestacion_servicio_medico_cabecera.psc_estatus IN('PE','EA','AT') order by smn_salud.smn_ingresos.igs_ticket DESC

