select DISTINCT
	(select smn_salud.smn_documento.doc_codigo || ' - ' || smn_salud.smn_documento.doc_nombre from  smn_salud.smn_documento  where smn_salud.smn_documento.smn_documento_id is not null  and smn_salud.smn_documento.smn_documento_id=smn_salud.smn_ingresos.smn_documento_id  order by smn_salud.smn_documento.doc_nombre ) as smn_documento_id_combo,
	(select smn_base.smn_unidades_servicios.uns_codigo || ' - ' ||  smn_base.smn_unidades_servicios.uns_descripcion from  smn_base.smn_unidades_servicios  where smn_base.smn_unidades_servicios.smn_unidades_servicios_id is not null  and smn_base.smn_unidades_servicios.smn_unidades_servicios_id=smn_salud.smn_ingresos.smn_unidades_servicios_rf  order by smn_base.smn_unidades_servicios.uns_descripcion ) as smn_unidades_servicios_rf_combo,
	(select smn_salud.smn_documento.doc_codigo || ' - ' || smn_salud.smn_documento.doc_nombre from smn_salud.smn_documento where smn_salud.smn_documento.smn_documento_id is not null and smn_salud.smn_documento.smn_documento_id = smn_salud.smn_ingresos.smn_doc_orig order by smn_salud.smn_documento.doc_nombre) as smn_doc_orig,
	smn_salud.smn_ingresos.smn_documento_id,
	smn_salud.smn_ingresos.igs_num_ingreso,
	smn_salud.smn_ingresos.smn_unidades_servicios_rf,
	smn_salud.smn_ingresos.smn_areas_servicios_rf,
	smn_salud.smn_ingresos.igs_ticket,
	(select smn_base.smn_auxiliar_persona_natural.ant_num_doc_oficial || ' - ' || smn_base.smn_auxiliar_persona_natural.ant_nombres || ' - ' || smn_base.smn_auxiliar_persona_natural.ant_apellidos from smn_base.smn_auxiliar_persona_natural where smn_base.smn_auxiliar_persona_natural.smn_auxiliar_persona_natural_id = smn_salud.smn_ingresos.smn_auxiliar_rf) as smn_auxiliar_rf1,
	smn_salud.smn_ingresos.igs_monto_moneda_local,
	to_char(smn_salud.smn_ingresos.igs_fecha_registro, 'YYYY-MM-DD') as igs_fecha_registro,
	smn_salud.smn_ingresos.smn_ingresos_id as smn_ingreso_id,
	case
		when smn_salud.smn_ingresos.igs_estatus_financiero='PE' then '${lbl:b_pend}'
		when smn_salud.smn_ingresos.igs_estatus_financiero='PA' then 'Pagado'
	end as igs_estatus_financiero,
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
	smn_salud.smn_ruta_paciente.smn_serie_id as serie,
	smn_salud.smn_ingresos.smn_auxiliar_rf,
	smn_salud.smn_ruta_paciente.rta_secuencia,
	ejecutivo.aux_descripcion as ejecutivo,
	contratante.aux_descripcion as contratante,
	smn_salud.smn_ruta_paciente.rta_estatus as rta_estatus_cod,
	smn_salud.smn_ruta_paciente.smn_ruta_id
	
from 
	smn_salud.smn_ingresos
	inner join smn_salud.smn_ruta_paciente on smn_salud.smn_ruta_paciente.smn_auxiliar_rf = smn_salud.smn_ingresos.smn_auxiliar_rf and smn_salud.smn_ruta_paciente.rta_secuencia=1
	--and smn_salud.smn_ruta_paciente.rta_ticket = smn_salud.smn_ingresos.igs_ticket
	left join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_ruta_paciente.smn_auxiliar_rf
	inner join smn_salud.smn_series on smn_salud.smn_series.sri_codigo = smn_salud.smn_ruta_paciente.smn_serie_id
	left join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_salud.smn_ruta_paciente.rta_ejecutivo_asignado
	left join smn_base.smn_auxiliar ejecutivo on ejecutivo.smn_auxiliar_id = smn_base.smn_usuarios.smn_auxiliar_rf
	left join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_contratante_id = smn_salud.smn_ingresos.smn_contratante_id
	left join smn_base.smn_auxiliar contratante on contratante.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf
where 
	  smn_salud.smn_ingresos.smn_ingresos_id is not null and
	  smn_salud.smn_ingresos.smn_entidades_rf = ${fld:entidad_prestador} and 
	  smn_salud.smn_ingresos.smn_sucursales_rf = ${fld:sucursal_prestador} and
	  smn_salud.smn_ingresos.smn_areas_servicios_rf = ${fld:area_prestador} and
	  smn_salud.smn_ingresos.smn_unidades_servicios_rf = ${fld:unidad_prestador}&
order by 
	smn_salud.smn_ingresos.smn_ingresos_id desc