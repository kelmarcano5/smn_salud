INSERT INTO smn_salud.smn_ingresos
(
	smn_ingresos_id,
	smn_doc_orig,
	smn_documento_id,
	igs_doc_origen,
	smn_entidades_rf,
	smn_sucursales_rf,
	smn_areas_servicios_rf,
	smn_unidades_servicios_rf,
	ctm_observaciones_id,
	igs_ticket,
	smn_clase_rf,
	smn_auxiliar_rf,
	smn_contratante_id,
	smn_auxiliar_sucursales_rf,
	smn_auxiliar_areas_servicios_rf,
	smn_auxilia_unidad_servicio_rf,
	smn_motivos_id,
	smn_observaciones_ingresos_id,
	igs_monto_moneda_local,
	smn_moneda_rf,
	igs_monto_moneda_alterna,
	smn_sintoma_id,
	igs_estatus_financiero,
	igs_idioma,
	igs_usuario,
	igs_fecha_registro,
	igs_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_ingresos},
	${fld:smn_doc_orig},
	(select 
	case
			when ${fld:smn_contratante_id} is null then (select smn_salud.smn_documento.smn_documento_id from smn_salud.smn_documento where smn_salud.smn_documento.doc_contratante='NO' limit 1)
			when ${fld:smn_contratante_id} is not null then (select smn_salud.smn_documento.smn_documento_id from smn_salud.smn_documento where smn_salud.smn_documento.doc_contratante='SI' limit 1)
	end as smn_documento_id from smn_salud.smn_documento limit 1),
	${fld:igs_doc_origen},
	${fld:smn_entidades_rf},
	${fld:smn_sucursales_rf},
	${fld:smn_areas_servicios_rf},
	${fld:smn_unidades_servicios_rf},
	${fld:ctm_observaciones_id},
	${fld:igs_ticket},
	${fld:cts_clase_auxiliar},
	${fld:cts_auxiliar},
	${fld:smn_contratante_id},
	${fld:smn_auxiliar_sucursales_rf},
	${fld:smn_auxiliar_areas_servicios_rf},
	${fld:smn_auxilia_unidad_servicio_rf},
	${fld:smn_motivos_id},
	${fld:smn_observaciones_ingresos_id},
	0,
	0,
	0,
	${fld:smn_sintoma_id},
	'PE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);

update smn_salud.smn_ruta_paciente 
set rta_estatus = 'EA', 
	rta_ejecutivo_asignado = (select smn_base.smn_usuarios.smn_usuarios_id from smn_base.smn_usuarios
inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
where smn_seguridad.s_user.userlogin='${def:user}' limit 1)
where 
	rta_numero_documento_identidad = ${fld:icv_numero_documento_identidad} and
	rta_ticket = ${fld:igs_ticket} and rta_secuencia=1;



update smn_salud.smn_ruta_paciente 
set smn_auxiliar_rf = ${fld:cts_auxiliar}
where 
	rta_numero_documento_identidad = ${fld:icv_numero_documento_identidad} and
	rta_ticket = ${fld:igs_ticket} and 
	smn_auxiliar_rf is null;
	
INSERT INTO smn_salud.smn_ingreso_movimiento (
	smn_ingresos_mov_id,
	smn_ingreso_id,
	smn_servicios_rf,
	smn_unidades_servicios_rf,
	smn_componente_rf,
	inm_accion,
	smn_tipo_consulta_rf,
	smn_grupo_prestador_servicio_rf,
	smn_prestador_servicio_rf,
	smn_motivos_id,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	inm_ordenante_descripcion,
	smn_sintoma_id,
	inm_tipo_orden,
	inm_num_orden_medica,
	inm_estatus,
	inm_idioma,
	inm_usuario,
	inm_fecha_registro,
	inm_hora) 	
	SELECT 
		${seq:nextval@smn_salud.seq_smn_ingreso_movimiento},
		${seq:currval@smn_salud.seq_smn_ingresos},
		smn_servicios_rf,
		smn_unidades_servicios_rf,
		smn_componente_rf,
		ctm_accion,
		smn_tipo_consulta_id,
		smn_grupo_prestador_servicio_rf,
		smn_prestador_servicio_rf,
		smn_motivos_id,
		smn_clase_auxiliar_rf,
		smn_auxiliar_rf,
		cts_ordenante_descripcion ,
  		smn_sintoma_id,
  		cts_tipo_orden,
  		cts_num_orden_medica,
  		'AC',
		'${def:locale}',
		'${def:user}',
		{d '${def:date}'},
		'${def:time}'		
	FROM smn_salud.smn_citas_mov 
	WHERE smn_documento_id = ${fld:smn_doc_orig} and ctm_num_control_cita = ${fld:igs_doc_origen};


