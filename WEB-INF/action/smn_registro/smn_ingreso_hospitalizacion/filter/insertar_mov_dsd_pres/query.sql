with mov_ing as (
	select smn_salud.smn_presupuesto_detalle.prd_cantidad,
		smn_salud.smn_presupuesto_detalle.smn_servicios_rf,
		smn_salud.smn_presupuesto_detalle.smn_componentes_rf,
		smn_salud.smn_presupuesto_detalle.prd_precio,
		smn_salud.smn_presupuesto_detalle.prd_monto_moneda_local,
		smn_salud.smn_presupuesto_detalle.prd_precio_ma,
		smn_salud.smn_presupuesto_detalle.prd_moneda_alterna,
		smn_salud.smn_presupuesto_detalle.smn_moneda_rf,
		smn_salud.smn_presupuesto_detalle.smn_tasa_rf
	  from 
	  	   smn_salud.smn_presupuesto_detalle 
		   inner join smn_salud.smn_presupuesto on smn_salud.smn_presupuesto.smn_presupuesto_id = smn_salud.smn_presupuesto_detalle.smn_presupuesto_id
	  where 
			smn_salud.smn_presupuesto.smn_auxiliar_rf=${fld:paciente} and smn_salud.smn_presupuesto.smn_estado_presupuesto_id=1
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
	${fld:id_ingreso},
	mov_ing.smn_servicios_rf,
	${fld:unidad_prestador},
	mov_ing.smn_componentes_rf,
	mov_ing.prd_cantidad,
	mov_ing.prd_precio,
	mov_ing.prd_monto_moneda_local,
	mov_ing.prd_precio_ma,
	mov_ing.prd_moneda_alterna,
	mov_ing.smn_moneda_rf,
	mov_ing.smn_tasa_rf,
	${fld:clase},
	${fld:paciente},
	'UR',
	'AC',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
	from mov_ing;

UPDATE smn_salud.smn_ingresos
   SET 
   	   smn_doc_orig=(select smn_salud.smn_presupuesto.smn_presupuesto_id from smn_salud.smn_presupuesto where smn_salud.smn_presupuesto.smn_auxiliar_rf=${fld:paciente} and smn_salud.smn_presupuesto.smn_estado_presupuesto_id=1),
   	   igs_monto_moneda_local = (select SUM(smn_salud.smn_ingreso_movimiento.inm_monto_ml) from smn_salud.smn_ingreso_movimiento where smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:id_ingreso}),
   	   igs_monto_moneda_alterna = (select SUM(smn_salud.smn_ingreso_movimiento.inm_monto_ma) from smn_salud.smn_ingreso_movimiento where smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:id_ingreso}),
   	   smn_moneda_rf = (select smn_salud.smn_ingreso_movimiento.smn_moneda_rf from smn_salud.smn_ingreso_movimiento where smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:id_ingreso} limit 1)
 WHERE
 	smn_ingresos_id = ${fld:id_ingreso};

 UPDATE smn_salud.smn_presupuesto SET
	smn_estado_presupuesto_id=2
WHERE
	smn_salud.smn_presupuesto.smn_presupuesto_id=(select smn_salud.smn_presupuesto.smn_presupuesto_id from smn_salud.smn_presupuesto where smn_salud.smn_presupuesto.smn_auxiliar_rf=${fld:paciente} and smn_salud.smn_presupuesto.smn_estado_presupuesto_id=1);
