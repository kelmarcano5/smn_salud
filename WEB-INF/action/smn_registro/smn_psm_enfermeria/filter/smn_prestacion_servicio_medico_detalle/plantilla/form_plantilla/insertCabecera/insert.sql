INSERT INTO smn_salud.smn_salud_plantilla_cabecera
(
	smn_salud_plantilla_cabecera_id,
  	smn_cuestionario_rf,
  	spc_numero_cuestionario,
  	smn_auxiliar_rf,
  	spc_fecha_evento,
  	spc_hora_evento,
  	smn_prestadores_servicio_rf,
  	smn_ingreso_id,
  	spc_nivel_seguridad, -- 0=Alto Nivel|1=Nivel Medio|3=Nivel Bajo
  	spc_estatus_formulario, -- RE=Regstrado|GE=Generado|AN=Anulado
  	spc_estatus_proceso, -- AC=Activo|CE=Cerrado
  	spc_idioma,
  	spc_usuario,
  	spc_fecha_registro,
  	spc_hora,
  	smn_servicio_rf
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_salud_plantilla_cabecera},
	${fld:smn_cuestionario_rf},
	(SELECT CASE WHEN MAX(spc_numero_cuestionario) IS NULL THEN 1 WHEN MAX(spc_numero_cuestionario) IS NOT NULL THEN MAX(spc_numero_cuestionario)+1 END AS spc_numero_cuestionario FROM smn_salud.smn_salud_plantilla_cabecera),
	${fld:smn_auxiliar_rf},
	{d '${def:date}'},
	'${def:time}',
	${fld:smn_prestador_servicio_rf},
	${fld:smn_ingresos_id},
	${fld:spc_nivel_seguridad},
	'RE',
	'AC',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:smn_servicios_rf}
);

UPDATE smn_salud.smn_ingreso_movimiento SET
	inm_estatus='IN'
WHERE
	smn_ingreso_id=${fld:smn_ingresos_id} AND smn_servicios_rf=${fld:smn_servicios_rf};