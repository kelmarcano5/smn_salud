select
	(select smn_base.smn_clase_auxiliar.cla_codigo|| ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar where smn_base.smn_clase_auxiliar.cla_codigo='PA'  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_salud.smn_ruta_paciente.smn_clase_auxiliar_rf  order by smn_base.smn_clase_auxiliar.cla_nombre ) as smn_clase_auxiliar_rf_combo,
	(select smn_salud.smn_series.sri_codigo from  smn_salud.smn_series  where smn_salud.smn_series.sri_codigo is not null  and smn_salud.smn_series.sri_codigo=smn_salud.smn_ruta_paciente.smn_serie_id  order by smn_salud.smn_series.smn_series_id  ) as smn_serie_id_combo,
	(select smn_base.smn_areas_servicios.ase_codigo || ' - ' || smn_base.smn_areas_servicios.ase_descripcion from  smn_base.smn_areas_servicios  where smn_base.smn_areas_servicios.smn_areas_servicios_id is not null  and smn_base.smn_areas_servicios.smn_areas_servicios_id=smn_salud.smn_ruta_paciente.smn_area_servicio_rf  order by smn_base.smn_areas_servicios.ase_descripcion ) as smn_area_servicio_rf_combo,
	(select smn_base.smn_sucursales.suc_codigo || ' - ' || smn_base.smn_sucursales.suc_nombre from  smn_base.smn_sucursales  where smn_base.smn_sucursales.smn_sucursales_id is not null  and smn_base.smn_sucursales.smn_sucursales_id=smn_salud.smn_ruta_paciente.smn_sucursal_rf  order by smn_base.smn_sucursales.suc_nombre ) as smn_sucursal_rf_combo,
	(select smn_base.smn_entidades.ent_codigo || ' - ' || smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades  where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_salud.smn_ruta_paciente.smn_entidad_rf  order by smn_base.smn_entidades.ent_descripcion_corta ) as smn_entidad_rf_combo,
	(select smn_base.smn_unidades_servicios.uns_codigo|| ' - ' || smn_base.smn_unidades_servicios.uns_descripcion from  smn_base.smn_unidades_servicios where smn_base.smn_unidades_servicios.smn_unidades_servicios_id is not null  and smn_base.smn_unidades_servicios.smn_unidades_servicios_id=smn_salud.smn_ruta_paciente.smn_unidad_servicio_rf) as smn_unidad_servicio_rf_combo,
	(select smn_base.smn_areas_servicios.ase_codigo || ' - ' || smn_base.smn_areas_servicios.ase_descripcion from  smn_base.smn_areas_servicios  where smn_base.smn_areas_servicios.smn_areas_servicios_id is not null  and smn_base.smn_areas_servicios.smn_areas_servicios_id=smn_salud.smn_ruta_paciente.smn_area_servicio_rf  order by smn_base.smn_areas_servicios.ase_descripcion ) as smn_area_servicio_rf_combo,
	(select smn_base.smn_unidades_servicios.uns_codigo|| ' - ' || smn_base.smn_unidades_servicios.uns_descripcion from  smn_base.smn_unidades_servicios where smn_base.smn_unidades_servicios.smn_unidades_servicios_id is not null  and smn_base.smn_unidades_servicios.smn_unidades_servicios_id=smn_salud.smn_ruta_paciente.smn_unidad_servicio_rf) as smn_unidad_servicio_rf_combo,
	case
		when smn_salud.smn_ruta_paciente.rta_estatus='PE' then '${lbl:b_pend}'
		when smn_salud.smn_ruta_paciente.rta_estatus='EA' then '${lbl:b_enaten}'
		when smn_salud.smn_ruta_paciente.rta_estatus='AT' then '${lbl:b_atend}'
		when smn_salud.smn_ruta_paciente.rta_estatus='IN' then '${lbl:b_informado}'
		when smn_salud.smn_ruta_paciente.rta_estatus='ER' then '${lbl:b_enrevision}'
	end as rta_estatus_combo,
	(select  smn_base.smn_auxiliar.aux_codigo || ' - ' || smn_base.smn_auxiliar.aux_nombres || ' ' ||  smn_base.smn_auxiliar.aux_apellidos from  smn_base.smn_auxiliar  where smn_base.smn_auxiliar.smn_auxiliar_id is not null  and smn_base.smn_auxiliar.smn_auxiliar_id=smn_salud.smn_ruta_paciente.smn_auxiliar_rf  order by smn_base.smn_auxiliar.aux_nombres, smn_base.smn_auxiliar.aux_apellidos ) as smn_auxiliar_rf_combo,
	(select usr_nombres || '-' || usr_apellidos from  smn_base.smn_v_usuarios_2 where smn_usuarios_id is not null  and smn_usuarios_id=smn_salud.smn_ruta_paciente.rta_ejecutivo_asignado) as rta_ejecutivo_asignado_combo,
	smn_salud.smn_ruta_paciente.smn_serie_id,
	smn_salud.smn_ruta_paciente.smn_area_servicio_rf,
	smn_salud.smn_ruta_paciente.rta_hora_llegada_unidad,
	smn_salud.smn_ruta_paciente.smn_sucursal_rf,
	smn_salud.smn_ruta_paciente.smn_entidad_rf,
	smn_salud.smn_ruta_paciente.rta_numero_documento_identidad,
	smn_salud.smn_ruta_paciente.smn_unidad_servicio_rf,
	smn_salud.smn_ruta_paciente.rta_secuencia,
	smn_salud.smn_ruta_paciente.rta_ticket,
	smn_salud.smn_ruta_paciente.rta_estatus,
	smn_salud.smn_ruta_paciente.smn_auxiliar_rf,
	smn_salud.smn_ruta_paciente.rta_fecha_registro,
	smn_salud.smn_ruta_paciente.rta_hora_salida_unidad,
	smn_salud.smn_ruta_paciente.rta_ejecutivo_asignado,
	smn_salud.smn_ruta_paciente.smn_ruta_id,
	smn_salud.smn_ingresos.igs_num_ingreso,
	smn_salud.smn_ruta_paciente.smn_grupo_prestador_rf,
	smn_salud.smn_ruta_paciente.smn_prestador_servicio_rf,
	case
		when smn_base.smn_auxiliar.aux_descripcion is null then 'Particular'
		else smn_base.smn_auxiliar.aux_descripcion
	end as aux_descripcion

from 
	smn_salud.smn_ruta_paciente
	inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.igs_ticket=smn_salud.smn_ruta_paciente.rta_ticket
	and smn_salud.smn_ruta_paciente.rta_fecha_registro=smn_salud.smn_ingresos.igs_fecha_registro 
	left join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_contratante_id=smn_salud.smn_ingresos.smn_contratante_id
	left join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id=smn_salud.smn_contratante.smn_auxiliar_rf
	
	
	--and smn_salud.smn_ruta_paciente.rta_secuencia=1
where
	smn_ruta_id = ${fld:id}
