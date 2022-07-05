INSERT INTO smn_salud.smn_ingresos
(
	smn_ingresos_id,
	smn_doc_orig,
	smn_documento_id,
	igs_doc_origen,
	igs_num_ingreso,
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
	igs_hora,
	smn_patologia_id,
	smn_prestador_servicio_rf,
	igs_numero_autorizacion,
	igs_fecha_ingreso,
	igs_dias_hospitalizacion,
	igs_fecha_salida,
	smn_activo_fijo,
	igs_monto_cobertura,
	igs_monto_cobertura_ma
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_ingresos},
	${fld:smn_doc_orig},
	${fld:smn_documento_id},
	${fld:igs_doc_origen},
	${seq:nextval@smn_salud.seq_smn_ingresos_numero},
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
	'${def:time}',	
	${fld:smn_patologia_id},
	${fld:smn_prestador_servicio_rf},
	${fld:igs_numero_autorizacion},
	${fld:igs_fecha_ingreso},
	${fld:igs_dias_hospitalizacion},
	${fld:igs_fecha_salida},
	${fld:smn_activo_fijo_rf},
	0,
	0
);
	
with mov_ing as (
SELECT * FROM smn_salud.smn_presupuesto_detalle where smn_salud.smn_presupuesto_detalle.smn_presupuesto_id=${fld:smn_doc_orig}
)
INSERT INTO smn_salud.smn_ingreso_movimiento
(
	smn_ingresos_mov_id,
	smn_ingreso_id,
	smn_servicios_rf,
	smn_unidades_servicios_rf,
	smn_componente_rf,
	inm_cantidad,
	inm_precio_ml,
	inm_monto_ml,
	inm_precio_ma,
	inm_monto_ma,
	smn_moneda_rf,
	smn_tasa_rf,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	inm_tipo_orden,
	inm_estatus,
	inm_idioma,
	inm_usuario,
	inm_fecha_registro,
	inm_hora
)
select 
	nextval('smn_salud.seq_smn_ingreso_movimiento'),
	${seq:currval@smn_salud.seq_smn_ingresos},
	mov_ing.smn_servicios_rf,
	${fld:smn_unidades_servicios_rf},
	mov_ing.smn_componentes_rf,
	mov_ing.prd_cantidad,
	mov_ing.prd_precio,
	mov_ing.prd_monto_moneda_local,
	mov_ing.prd_precio_ma,
	mov_ing.prd_moneda_alterna,
	mov_ing.smn_moneda_rf,
	mov_ing.smn_tasa_rf,
	${fld:cts_clase_auxiliar},
	${fld:cts_auxiliar},
	'UR',
	'AC',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
	from mov_ing;

UPDATE smn_salud.smn_presupuesto SET
	smn_estado_presupuesto_id=2

WHERE
	smn_presupuesto_id=${fld:smn_doc_orig};



UPDATE smn_salud.smn_habitaciones SET hab_estatus='OC'
WHERE smn_salud.smn_habitaciones.smn_habitaciones_id=${fld:smn_activo_fijo_rf};


INSERT INTO smn_salud.smn_habitaciones_disponibles
(
	smn_habitaciones_disponibles_id,
	smn_habitaciones_id,
	smn_ingreso_id,
	had_fecha_ingreso,
	had_estatus,
	had_idioma,
	had_usuario,
	had_fecha_registro,
	had_hora
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_habitaciones_disponibles},
	${fld:smn_activo_fijo_rf},
	${seq:currval@smn_salud.seq_smn_ingresos},
	{d '${def:date}'},
	'OC',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);


UPDATE smn_salud.smn_ingresos
   SET igs_monto_moneda_local = (select SUM(smn_salud.smn_ingreso_movimiento.inm_monto_ml) from smn_salud.smn_ingreso_movimiento where smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${seq:currval@smn_salud.seq_smn_ingresos}),
   	   igs_monto_moneda_alterna = (select SUM(smn_salud.smn_ingreso_movimiento.inm_monto_ma) from smn_salud.smn_ingreso_movimiento where smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${seq:currval@smn_salud.seq_smn_ingresos}),
   	   smn_moneda_rf = (select smn_salud.smn_ingreso_movimiento.smn_moneda_rf from smn_salud.smn_ingreso_movimiento where smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${seq:currval@smn_salud.seq_smn_ingresos} limit 1)
 WHERE igs_estatus_financiero = 'PE' and 
 	smn_ingresos_id = ${seq:currval@smn_salud.seq_smn_ingresos};

