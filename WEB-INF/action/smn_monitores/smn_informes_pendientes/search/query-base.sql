SELECT DISTINCT	smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_detalle_id,		
	smn_salud.smn_ingresos.smn_ingresos_id,
	smn_base.smn_entidades.ent_descripcion_corta as smn_entidades_rf,			
	smn_base.smn_sucursales.suc_nombre as smn_sucursales_rf,			
	smn_base.smn_grupos_prestadores.gpp_descripcion as smn_grupo_prestador_rf,			
	prestador.aux_codigo ||' '|| prestador.aux_descripcion as smn_prestador_servicio_rf,			
	smn_salud.smn_ingresos.smn_clase_rf,			
	paciente.aux_codigo ||' '|| paciente.aux_descripcion as smn_auxiliar_rf,			
	smn_salud.smn_ingresos.igs_fecha_ingreso,			
	smn_salud.smn_ingresos.igs_num_ingreso,			
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_servicios_rf,			
	smn_base.smn_cuestionario.cue_descripcion as smn_cuestionario_rf,			
	case
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='RE' then 'Registrada'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='AP' then '${lbl:b_aprobated}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='RZ' then '${lbl:b_not_aprobated}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='AC' then '${lbl:b_active}'
	end as psd_estatus		
FROM			
	smn_salud.smn_ingresos			
	INNER JOIN smn_salud.smn_prestacion_servicio_medico_cabecera ON smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_prestacion_servicio_medico_cabecera.smn_ingresos_id			
	INNER JOIN smn_salud.smn_prestacion_servicio_medico_detalle ON smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id			
	LEFT JOIN smn_salud.smn_salud_plantilla_cabecera ON smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_salud_plantilla_cabecera.smn_ingreso_id AND smn_salud.smn_prestacion_servicio_medico_detalle.smn_servicios_rf = smn_salud.smn_salud_plantilla_cabecera.smn_servicio_rf			
	inner join smn_base.smn_auxiliar paciente on paciente.smn_auxiliar_id = smn_salud.smn_ingresos.smn_auxiliar_rf
	inner join smn_base.smn_auxiliar prestador on prestador.smn_auxiliar_id = smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestador_servicio_rf
	inner join smn_base.smn_grupos_prestadores on smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id = smn_salud.smn_prestacion_servicio_medico_cabecera.smn_grupo_prestador_rf
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_salud.smn_ingresos.smn_entidades_rf
	left join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_salud.smn_ingresos.smn_sucursales_rf
	left join smn_base.smn_cuestionario on smn_base.smn_cuestionario.smn_cuestionario_id = smn_salud.smn_salud_plantilla_cabecera.smn_cuestionario_rf
where
	smn_salud.smn_ingresos.smn_ingresos_id is not null	
 	 	${filter}
ORDER BY			
smn_salud.smn_ingresos.igs_num_ingreso ASC		