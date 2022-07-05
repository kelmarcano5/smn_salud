CREATE TABLE smn_salud.aad_estado_presupuesto(
  smn_estado_presupuesto_id INTEGER NOT NULL,
  epr_codigo VARCHAR(16) NOT NULL,
  epr_descripcion VARCHAR(56) NOT NULL,
  epr_idioma CHARACTER(2) NOT NULL,
  epr_usuario VARCHAR(10) NOT NULL,
  epr_fecha_registro DATE NOT NULL,
  epr_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_aad_estado_presupuesto;


CREATE TABLE smn_salud.smn_afiliado_titular(
  smn_afiliados_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  afi_numero_control INTEGER,
  smn_contratante_id INTEGER NOT NULL,
  smn_auxiliar_unidades_negocios_rf INTEGER,
  smn_auxiliar_sucursales_rf INTEGER,
  smn_auxiliar_areas_servicios_rf INTEGER,
  smn_auxiliar_unidades_servicios_rf INTEGER,
  afi_clase_auxiliar_rf INTEGER NOT NULL,
  afi_auxiliar_rf INTEGER NOT NULL,
  afi_fecha_de_registro DATE NOT NULL,
  afi_fecha_de_inicio DATE NOT NULL,
  afi_estatus CHARACTER(1) NOT NULL,
  afi_fecha_desafiliado DATE,
  afi_idioma CHARACTER(2) NOT NULL,
  afi_usuario_id VARCHAR(10) NOT NULL,
  afi_fecha_registro DATE NOT NULL,
  afi_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_afiliado_titular;


CREATE TABLE smn_salud.smn_planes(
  smn_planes_id INTEGER NOT NULL,
  pla_codigo VARCHAR(16) NOT NULL,
  pla_descripcion VARCHAR(56) NOT NULL,
  pla_vigencia_desde DATE NOT NULL,
  pla_vigencia_hasta DATE NOT NULL,
  pla_inactivo CHARACTER(1) NOT NULL,
  pla_empresa INTEGER,
  pla_idioma CHARACTER(2) NOT NULL,
  pla_usuario VARCHAR(10) NOT NULL,
  pla_fecha_registro DATE NOT NULL,
  pla_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_planes;


CREATE TABLE smn_salud.smn_afiliados_planes(
  smn_afiliados_planes_id INTEGER NOT NULL,
  smn_afiliados_id INTEGER,
  smn_planes_id INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_afiliados_planes;


CREATE TABLE smn_salud.smn_agenda_medica(
  smn_agenda_medica_id INTEGER NOT NULL,
  smn_agenda_id INTEGER NOT NULL,
  smn_entidades_rf INTEGER NOT NULL,
  smn_sucursales_rf INTEGER,
  smn_areas_servicios_rf INTEGER NOT NULL,
  smn_unidades_servicios_rf INTEGER NOT NULL,
  smn_grupo_prestador_servicio_rf INTEGER NOT NULL,
  smn_prestador_servicio_rf INTEGER,
  smn_especialidad_rf INTEGER,
  agm_frecuencia INTEGER NOT NULL,
  agm_cantidad_frecuencia INTEGER NOT NULL,
  agm_estatus CHARACTER(2) NOT NULL,
  agm_idioma CHARACTER(2) NOT NULL,
  agm_usuario VARCHAR(10) NOT NULL,
  agm_fecha_registro DATE NOT NULL,
  agm_hora CHARACTER(8) NOT NULL,
  smn_habitaciones_id INTEGER,
  agm_jornada_desde_rf CHARACTER(2)
);

CREATE SEQUENCE smn_salud.seq_smn_agenda_medica;


CREATE TABLE smn_salud.smn_balance_capacidad(
  smn_balance_capacidad_id INTEGER NOT NULL,
  bcp_fecha_evento DATE NOT NULL,
  smn_entidades_rf INTEGER NOT NULL,
  smn_sucursales_rf INTEGER NOT NULL,
  smn_areas_servicios_rf INTEGER NOT NULL,
  smn_unidades_servicios_rf INTEGER NOT NULL,
  smn_grupo_prestador_servicio_rf INTEGER,
  smn_prestador_servicio_rf INTEGER,
  smn_documento_id INTEGER NOT NULL,
  bcp_disponibilidad DOUBLE PRECISION NOT NULL,
  bcp_ingreso_paciente DOUBLE PRECISION,
  bcp_egreso_paciente DOUBLE PRECISION,
  bcp_saldo DOUBLE PRECISION NOT NULL,
  bcp_idioma CHARACTER(2) NOT NULL,
  bcp_usuario VARCHAR(10) NOT NULL,
  bcp_fecha_registro DATE NOT NULL,
  bcp_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_balance_capacidad;


CREATE TABLE smn_salud.smn_balance_citas_agenda(
  smn_balance_citas_agenda_id INTEGER NOT NULL,
  smn_prestador_servicio_id INTEGER,
  smn_grupo_prestador_servicio_id INTEGER,
  bca_fecha_evento DATE NOT NULL,
  smn_entidades_rf INTEGER NOT NULL,
  smn_sucursales_rf INTEGER NOT NULL,
  smn_areas_servicios_rf INTEGER NOT NULL,
  smn_unidades_servicio_rf INTEGER NOT NULL,
  bca_disponibilidad_citas_ps INTEGER NOT NULL,
  bca_cant_citas_anulbca_cant_citas_anul INTEGER,
  bca_cant_citas_otor INTEGER,
  bca_saldo INTEGER NOT NULL,
  bca_idioma CHARACTER(2) NOT NULL,
  bca_usuario VARCHAR(32) NOT NULL,
  bca_fecha_registro DATE NOT NULL,
  bca_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_balance_citas_agenda;


CREATE TABLE smn_salud.smn_balance_citas_contratante(
  smn_balance_citas_contratante_id INTEGER NOT NULL,
  smn_contratante_id INTEGER NOT NULL,
  bcc_fecha_evento DATE NOT NULL,
  smn_entidades_rf INTEGER NOT NULL,
  smn_sucursales_rf INTEGER NOT NULL,
  smn_areas_servicios_rf INTEGER NOT NULL,
  smn_unidades_servicio_rf INTEGER NOT NULL,
  bcc_capacidad_contratada INTEGER NOT NULL,
  bcc_cant_citas_anul INTEGER,
  bcc_cant_citas_otor INTEGER,
  bcc_disponibilidad INTEGER NOT NULL,
  bcc_idioma CHARACTER(2) NOT NULL,
  bcc_usuario VARCHAR(10) NOT NULL,
  bcc_fecha_registro DATE NOT NULL,
  bcc_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_balance_citas_contratante;


CREATE TABLE smn_salud.smn_series(
  smn_series_id INTEGER NOT NULL,
  sri_codigo VARCHAR(10) NOT NULL,
  sri_nombre VARCHAR(100) NOT NULL,
  sri_estatus CHARACTER(1) NOT NULL,
  sri_ultimo_numero INTEGER NOT NULL,
  sri_reinicio CHARACTER(1) NOT NULL,
  ctm_idioma CHARACTER(2) NOT NULL,
  ctm_usuario_id VARCHAR(10) NOT NULL,
  ctm_fecha_registro DATE NOT NULL,
  ctm_hora CHARACTER(8) NOT NULL,
  sri_paciente_nuevo CHARACTER(2),
  smn_contratante_id INTEGER,
  sri_particular CHARACTER(2)
);

CREATE SEQUENCE smn_salud.seq_smn_series;


CREATE TABLE smn_salud.smn_campos_visualizacion_monitores_dispositivos(
  smn_campos_vis_mon_dis_id INTEGER NOT NULL,
  smn_dispositivos_id INTEGER NOT NULL,
  smn_series_id INTEGER NOT NULL,
  cvm_datos_pac CHARACTER(10) NOT NULL,
  cvm_unidad_llamada CHARACTER(10) NOT NULL,
  cvm_pacientes_espera CHARACTER(10) NOT NULL,
  cvm_tiempo_aprox_espera CHARACTER(10) NOT NULL,
  cvm_idioma CHARACTER(2) NOT NULL,
  cvm_usuario_id VARCHAR(10) NOT NULL,
  cvm_fecha_registro DATE NOT NULL,
  cvm_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_campos_visualizacion_monitores_dispositivos;


CREATE TABLE smn_salud.smn_capacidades_unidad(
  smn_capacidades_id INTEGER NOT NULL,
  smn_areas_servicios_rf INTEGER NOT NULL,
  smn_unidad_servicio_rf INTEGER NOT NULL,
  cap_cant_max_pacientes INTEGER NOT NULL,
  cap_cant_min_pacientes INTEGER NOT NULL,
  cap_idioma CHARACTER(2) NOT NULL,
  cap_usuario_id VARCHAR(10) NOT NULL,
  cap_fecha_registro DATE NOT NULL,
  cap_hora CHARACTER(8) NOT NULL,
  smn_almacen_rf INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_capacidades_unidad;


CREATE TABLE smn_salud.smn_cargos_automaticos(
  smn_cargos_automaticos_id INTEGER NOT NULL,
  smn_unidad_servicios_rf INTEGER NOT NULL,
  smn_servicios_rf INTEGER NOT NULL,
  cau_idioma CHARACTER(2) NOT NULL,
  cau_usuario VARCHAR(10) NOT NULL,
  cau_fecha_registro DATE NOT NULL,
  cau_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_cargos_automaticos;


CREATE TABLE smn_salud.smn_citas(
  smn_citas_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  cts_num_control SERIAL NOT NULL,
  smn_entidades_rf INTEGER,
  smn_sucursales_rf INTEGER,
  cts_numero_ticket INTEGER,
  smn_origen_id INTEGER NOT NULL,
  cts_clase_auxiliar INTEGER NOT NULL,
  cts_auxiliar INTEGER NOT NULL,
  smn_condicion_financiera_rf INTEGER,
  smn_contratante_id INTEGER,
  smn_observaciones_id INTEGER,
  smn_estatus_citas_id INTEGER NOT NULL,
  cts_idioma CHARACTER(2) NOT NULL,
  cts_usuario VARCHAR(10) NOT NULL,
  cts_fecha_registro DATE NOT NULL,
  cts_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_citas;


CREATE TABLE smn_salud.smn_citas_mov(
  smn_citas_mov_id INTEGER NOT NULL,
  smn_citas_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  ctm_num_control_cita INTEGER,
  smn_servicios_rf INTEGER NOT NULL,
  smn_componente_rf INTEGER,
  ctm_accion VARCHAR(40),
  smn_tipo_consulta_id INTEGER,
  smn_grupo_prestador_servicio_rf INTEGER,
  smn_prestador_servicio_rf INTEGER,
  ctm_fecha_cita DATE NOT NULL,
  ctm_turno_cita INTEGER,
  ctm_hora_cita CHARACTER(5),
  ctm_estatus_id INTEGER NOT NULL,
  smn_motivos_id INTEGER,
  smn_clase_auxiliar_rf INTEGER,
  smn_auxiliar_rf INTEGER,
  cts_ordenante_descripcion VARCHAR(40),
  smn_sintoma_id INTEGER,
  cts_tipo_orden CHARACTER(3) NOT NULL,
  cts_num_orden_medica INTEGER,
  smn_entidades_rf INTEGER,
  smn_sucursales_rf INTEGER,
  smn_areas_servicios_rf INTEGER,
  smn_unidades_servicios_rf INTEGER,
  ctm_observaciones_id INTEGER,
  ctm_idioma CHARACTER(2) NOT NULL,
  ctm_usuario VARCHAR(10) NOT NULL,
  ctm_fecha_registro DATE NOT NULL,
  ctm_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_citas_mov;


CREATE TABLE smn_salud.smn_citas_servicios(
  smn_citas_servicios_id INTEGER NOT NULL,
  smn_citas_id INTEGER NOT NULL,
  smn_servicios_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_citas_servicios;


CREATE TABLE smn_salud.smn_cobertura_admision(
  smn_cobertura_admision_id INTEGER NOT NULL,
  smn_ingreso_id INTEGER NOT NULL,
  smn_presupuesto_id INTEGER,
  smn_auxiliar_rf INTEGER NOT NULL,
  coa_hora_solicitada CHARACTER(8),
  coa_ejecutivo_atencion_pagador CHARACTER(100),
  coa_observacion_inicial CHARACTER(100),
  coa_monto_solicitado_servicios_clinicos_ml DOUBLE PRECISION,
  coa_monto_solicitado_medicinas_y_mmq_ml DOUBLE PRECISION,
  coa_monto_solicitado_honorarios_ml DOUBLE PRECISION,
  coa_monto_total_solicitado_ml DOUBLE PRECISION,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  coa_monto_solicitado_servicios_clinicos_ma DOUBLE PRECISION,
  coa_monto_solicitado_medicinas_y_mmq_ma DOUBLE PRECISION,
  coa_monto_solicitado_honorarios_ma DOUBLE PRECISION,
  coa_monto_total_solicitado_ma DOUBLE PRECISION,
  coa_fecha_aprobacion DATE,
  coa_hora_aprobacion CHARACTER(8),
  coa_monto_aprobado_servicios_medicos_ml DOUBLE PRECISION,
  coa_monto_aprobado_medicinas_y_mmq_ml DOUBLE PRECISION,
  coa_monto_aprobado_honorarios_ml DOUBLE PRECISION,
  coa_monto_total_aprobado_ml DOUBLE PRECISION,
  coa_monto_aprobado_servicios_medicos_ma DOUBLE PRECISION,
  coa_monto_aprobado_medicinas_y_mmq_ma DOUBLE PRECISION,
  coa_monto_aprobado_honorarios_ma DOUBLE PRECISION,
  coa_monto_total_aprobado_ma DOUBLE PRECISION,
  coa_estatus_proceso CHARACTER(2) NOT NULL,
  coa_estatus_financiero CHARACTER(2) NOT NULL,
  coa_idioma CHARACTER(2) NOT NULL,
  coa_usuario VARCHAR(10) NOT NULL,
  coa_fecha_registro DATE NOT NULL,
  coa_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_cobertura_admision;


CREATE TABLE smn_salud.smn_coberturas(
  smn_coberturas_id INTEGER NOT NULL,
  cob_codigo VARCHAR(16) NOT NULL,
  cob_descripcion VARCHAR(56) NOT NULL,
  cob_tiempo_servicio INTEGER,
  cob_unidad_tiempo_rf INTEGER,
  cob_deducible DOUBLE PRECISION,
  cob_otros_centros CHARACTER(1) NOT NULL,
  cob_cantidad_servicio INTEGER,
  cob_cobertura_desde DOUBLE PRECISION,
  cob_cobertura_hasta DOUBLE PRECISION,
  cob_porc_deducible DOUBLE PRECISION,
  cob_idioma CHARACTER(2) NOT NULL,
  cob_usuario VARCHAR(10) NOT NULL,
  cob_fecha_registro DATE NOT NULL,
  cob_hora CHARACTER(8) NOT NULL,
  smn_tipo_coberturas_id INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_coberturas;


CREATE TABLE smn_salud.smn_unidades_servicios(
  smn_unidades_servicios_id INTEGER NOT NULL,
  uns_codigo VARCHAR(16) NOT NULL,
  uns_descripcion VARCHAR(56) NOT NULL,
  svc_codigo VARCHAR(16) NOT NULL,
  svc_descripcion VARCHAR(56) NOT NULL,
  svc_tiempo_servicio INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_unidades_servicios;


CREATE TABLE smn_salud.smn_coberturas_servicios(
  smn_coberturas_servicios_id INTEGER NOT NULL,
  smn_coberturas_id INTEGER NOT NULL,
  smn_unidades_servicios_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_coberturas_servicios;


CREATE TABLE smn_salud.smn_contratante(
  smn_contratante_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  cnt_numero_control INTEGER NOT NULL,
  smn_clase_auxiliar_rf INTEGER,
  smn_auxiliar_rf INTEGER,
  smn_plan_id INTEGER NOT NULL,
  cnt_fecha_de_inicio DATE NOT NULL,
  cnt_cantidad_citas INTEGER,
  cnt_idioma CHARACTER(2) NOT NULL,
  cnt_usuario_id VARCHAR(10) NOT NULL,
  cnt_fecha_registro DATE NOT NULL,
  cnt_hora CHARACTER(8) NOT NULL,
  smn_estructura_organizacional_rf INTEGER,
  smn_baremos_id INTEGER,
  smn_clase_baremos_rf INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_contratante;


CREATE TABLE smn_salud.smn_contrato_modulo(
  smn_contrato_modulo_id INTEGER NOT NULL,
  smn_contrato_base_rf INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  ctm_numero_contrato INTEGER NOT NULL,
  smn_contratante_id INTEGER NOT NULL,
  ctm_fecha_vigencia_desde DATE NOT NULL,
  ctm_fecha_vigencia_hasta DATE NOT NULL,
  smn_planes_id INTEGER NOT NULL,
  ctm_cantidad_afiliados INTEGER,
  ctm_monto_contrato DOUBLE PRECISION,
  ctm_monto_cobertura_afiliado DOUBLE PRECISION,
  ctm_cantidad_servicio_afiliado INTEGER,
  ctm_cantidad_dias_cobertura INTEGER,
  ctm_cantidad_citas INTEGER,
  smn_descuento_rf CHARACTER(2),
  ctm_dia_factura INTEGER,
  ctm_estatus_proceso CHARACTER(2) NOT NULL,
  ctm_estatus_financiero CHARACTER(2) NOT NULL,
  ctm_idioma CHARACTER(2) NOT NULL,
  ctm_usuario_id VARCHAR(10) NOT NULL,
  ctm_fecha_registro DATE NOT NULL,
  ctm_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_contrato_modulo;


CREATE TABLE smn_salud.smn_diagnostico(
  smn_diagnostico_id INTEGER NOT NULL,
  dgn_codigo VARCHAR(16) NOT NULL,
  dgn_descripcion VARCHAR(200) NOT NULL,
  dgn_tipo CHARACTER(1),
  dgn_idioma CHARACTER(2) NOT NULL,
  dgn_usuario VARCHAR(10) NOT NULL,
  dgn_fecha_registro DATE NOT NULL,
  dgn_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_diagnostico;


CREATE TABLE smn_salud.smn_dispositivos(
  smn_dispositivos_id INTEGER NOT NULL,
  dis_codigo VARCHAR(10) NOT NULL,
  dis_nombre VARCHAR(100) NOT NULL,
  dis_tipo CHARACTER(2) NOT NULL,
  dis_mac_address VARCHAR(20) NOT NULL,
  smn_usuario_id INTEGER NOT NULL,
  smn_entidades_rf INTEGER NOT NULL,
  smn_sucursales_rf INTEGER NOT NULL,
  smn_areas_servicios_rf INTEGER,
  smn_unidad_servicio_rf INTEGER,
  dis_idioma CHARACTER(2) NOT NULL,
  dis_usuario_id VARCHAR(10) NOT NULL,
  dis_fecha_registro DATE NOT NULL,
  dis_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_dispositivos;


CREATE TABLE smn_salud.smn_documento(
  smn_documento_id INTEGER NOT NULL,
  smn_tipo_documento_id INTEGER NOT NULL,
  smn_documento_general_rf INTEGER NOT NULL,
  doc_codigo VARCHAR(10) NOT NULL,
  doc_nombre VARCHAR(100) NOT NULL,
  doc_secuencia INTEGER,
  doc_idioma CHARACTER(2) NOT NULL,
  doc_usuario_id VARCHAR(10) NOT NULL,
  doc_fecha_registro DATE NOT NULL,
  doc_hora CHARACTER(8) NOT NULL,
  doc_maneja_moneda_alt CHARACTER(2),
  smn_categoria_justificacion_rf INTEGER,
  tca_tipo_tasa CHARACTER(2),
  doc_contratante CHARACTER(2),
  doc_afiliacion_persona_natural CHARACTER(2)
);

CREATE SEQUENCE smn_salud.seq_smn_documento;


CREATE TABLE smn_salud.smn_tipo_documento_afiliado(
  smn_tipo_documento_afiliado_id INTEGER NOT NULL,
  tdo_codigo VARCHAR(16) NOT NULL,
  tdo_descripcion VARCHAR(56) NOT NULL,
  tdo_idioma CHARACTER(2) NOT NULL,
  tdo_usuario VARCHAR(10) NOT NULL,
  tdo_fecha_registro DATE NOT NULL,
  tdo_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_tipo_documento_afiliado;


CREATE TABLE smn_salud.smn_documento_afiliados(
  smn_documento_afiliados_id INTEGER NOT NULL,
  smn_tipo_documento_afiliado_id INTEGER NOT NULL,
  doc_desc_documento VARCHAR(56) NOT NULL,
  smn_afiliados_id INTEGER NOT NULL,
  doc_archivo VARCHAR(400) NOT NULL,
  doc_contenido VARCHAR(150) NOT NULL,
  doc_descripcion VARCHAR(500) NOT NULL,
  doc_tamano INTEGER NOT NULL,
  doc_datos BYTEA NOT NULL,
  doc_idioma CHARACTER(2) NOT NULL,
  doc_usuario VARCHAR(10) NOT NULL,
  doc_fecha_registro DATE NOT NULL,
  doc_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_documento_afiliados;


CREATE TABLE smn_salud.smn_estado_presupuesto(
  smn_estado_presupuesto_id INTEGER NOT NULL,
  epr_codigo VARCHAR(16) NOT NULL,
  epr_descripcion VARCHAR(56) NOT NULL,
  epr_idioma CHARACTER(2) NOT NULL,
  epr_usuario VARCHAR(10) NOT NULL,
  epr_fecha_registro DATE NOT NULL,
  epr_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_estado_presupuesto;


CREATE TABLE smn_salud.smn_estatus(
  smn_estatus_id INTEGER NOT NULL,
  sta_codigo VARCHAR(16) NOT NULL,
  sta_descripcion VARCHAR(56) NOT NULL,
  sta_aplica CHARACTER(2) NOT NULL,
  sta_idioma CHARACTER(2) NOT NULL,
  sta_usuario VARCHAR(10) NOT NULL,
  sta_fecha_registro DATE NOT NULL,
  sta_hora CHARACTER(8) NOT NULL,
  sta_cod_siguiente CHARACTER(2)
);

CREATE SEQUENCE smn_salud.seq_smn_estatus;


CREATE TABLE smn_salud.smn_estatus_citas(
  smn_estatus_citas_id INTEGER NOT NULL,
  eci_num_secuencia VARCHAR(16) NOT NULL,
  eci_descripcion VARCHAR(56) NOT NULL,
  eci_aplica CHARACTER(2) NOT NULL,
  eci_idioma CHARACTER(2) NOT NULL,
  eci_usuario VARCHAR(10) NOT NULL,
  eci_fecha_registro DATE NOT NULL,
  eci_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_estatus_citas;


CREATE TABLE smn_salud.smn_habitaciones(
  smn_habitaciones_id INTEGER NOT NULL,
  smn_activo_fijo_rf INTEGER NOT NULL,
  hab_codigo VARCHAR(64) NOT NULL,
  hab_descripcion VARCHAR(100) NOT NULL,
  hab_estatus VARCHAR(2) NOT NULL,
  hab_clase CHARACTER(2) NOT NULL,
  hab_tipo_servicio INTEGER NOT NULL,
  hab_idioma CHARACTER(2) NOT NULL,
  hab_usuario VARCHAR(10) NOT NULL,
  hab_fecha_registro DATE NOT NULL,
  hab_hora CHARACTER(8) NOT NULL,
  hab_naturaleza CHARACTER(2),
  smn_areas_servicios_rf INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_habitaciones;


CREATE TABLE smn_salud.smn_habitaciones_disponibles(
  smn_habitaciones_disponibles_id INTEGER NOT NULL,
  smn_habitaciones_id INTEGER NOT NULL,
  smn_ingreso_id INTEGER NOT NULL,
  had_fecha_ingreso DATE NOT NULL,
  had_fecha_egreso DATE,
  had_estatus CHARACTER(2) NOT NULL,
  had_idioma CHARACTER(2) NOT NULL,
  had_usuario VARCHAR(10) NOT NULL,
  had_fecha_registro DATE NOT NULL,
  had_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_habitaciones_disponibles;


CREATE TABLE smn_salud.smn_historia_medica(
  smn_historia_medica_id INTEGER NOT NULL,
  smn_auxiliar_rf INTEGER NOT NULL,
  him_fecha DATE NOT NULL,
  him_hora CHARACTER(8) NOT NULL,
  him_entrevistador INTEGER NOT NULL,
  rango_edad INTEGER,
  grupo_etnico INTEGER,
  enfermedades VARCHAR(1000),
  alergias VARCHAR(1000),
  vicio_error VARCHAR(1000),
  medicamentos_sistemicos VARCHAR(1000),
  uso_de_esteroides VARCHAR(1000),
  enfermedad_ocular VARCHAR(1000),
  glaucoma_en_familiares VARCHAR(1000),
  ceguera_en_familiares VARCHAR(1000),
  paquimetria VARCHAR(1000),
  mmhg VARCHAR(1000),
  aguadeza_visual VARCHAR(1000),
  parpados VARCHAR(1000),
  otros_parpados VARCHAR(1000),
  conjuntiva VARCHAR(1000),
  cornea VARCHAR(1000),
  camara_anterior VARCHAR(1000),
  iris_pupila VARCHAR(1000),
  cristalino VARCHAR(1000),
  gonioscopia VARCHAR(1000),
  disco_nervio VARCHAR(1000),
  excavacion VARCHAR(1000),
  rebote_neutral VARCHAR(1000),
  vasos_sanguineos VARCHAR(1000),
  retina VARCHAR(1000),
  ojo_derecho VARCHAR(1000),
  ojo_izquierdo VARCHAR(1000),
  plan VARCHAR(1000),
  observacion VARCHAR(1000),
  estudios_complementarios VARCHAR(1000),
  tratamiento_hipotensor VARCHAR(1000),
  procedimiento_laser VARCHAR(1000),
  procedimiento_quirurgico VARCHAR(1000),
  smn_prestador_servicio_detalle_id VARCHAR(1000),
  presion_intraocular_oi VARCHAR(1000),
  presion_intraocular_od VARCHAR(1000),
  presion_intraocular_corregida_oi VARCHAR(1000),
  presion_intraocular_corregida_od VARCHAR(1000),
  vicio_error_refractivo_mayor VARCHAR(1000),
  astismagtismo_eje VARCHAR(1000),
  vicio_error_mayor VARCHAR(1000),
  vicio_error_txt VARCHAR(1000)
);

CREATE SEQUENCE smn_salud.seq_smn_historia_medica;


CREATE TABLE smn_salud.smn_horario(
  smn_horarios_id INTEGER NOT NULL,
  hor_codigo CHARACTER(10) NOT NULL,
  hor_descripcion VARCHAR(100) NOT NULL,
  hor_status CHARACTER(1) NOT NULL,
  hor_idioma CHARACTER(2) NOT NULL,
  hor_usuario_id VARCHAR(10) NOT NULL,
  hor_fecha_registro DATE NOT NULL,
  hor_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_horario;


CREATE TABLE smn_salud.smn_ingreso_cola_virtual(
  smn_ingreso_cola_virtual_id INTEGER NOT NULL,
  smn_entidad_rf INTEGER NOT NULL,
  smn_sucursal_rf INTEGER NOT NULL,
  smn_area_servicio_rf INTEGER,
  smn_unidad_servicio_rf INTEGER,
  smn_documento_id INTEGER,
  smn_contratante_id INTEGER,
  ivc_estatus_financiero CHARACTER(2),
  icv_numero_control INTEGER,
  smn_serie_id CHARACTER(8),
  icv_numero_ticket INTEGER,
  icv_fecha_registro_evento DATE NOT NULL,
  icv_fecha_evento DATE,
  smn_clase_auxiliar_rf INTEGER,
  smn_auxiliar_rf INTEGER,
  smn_unidad_servicio_rf_pres INTEGER,
  smn_grupo_prestador_rf INTEGER,
  icv_observacion CHARACTER(100),
  icv_numero_documento_identidad VARCHAR(20),
  icv_idioma CHARACTER(2) NOT NULL,
  icv_usuario CHARACTER(10) NOT NULL,
  icv_fecha_registro DATE NOT NULL,
  icv_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_ingreso_cola_virtual;


CREATE TABLE smn_salud.smn_ingreso_movimiento(
  smn_ingresos_mov_id INTEGER NOT NULL,
  smn_ingreso_id INTEGER NOT NULL,
  smn_servicios_rf INTEGER NOT NULL,
  smn_unidades_servicios_rf INTEGER NOT NULL,
  smn_componente_rf INTEGER,
  inm_accion VARCHAR(40),
  inm_cantidad INTEGER,
  inm_precio_ml DOUBLE PRECISION,
  inm_monto_ml DOUBLE PRECISION,
  inm_precio_ma DOUBLE PRECISION,
  inm_monto_ma DOUBLE PRECISION,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  inm_monto_cobertura_contratante DOUBLE PRECISION,
  inm_monto_cobertura_paciente DOUBLE PRECISION,
  smn_tipo_consulta_rf INTEGER,
  smn_grupo_prestador_servicio_rf INTEGER,
  smn_prestador_servicio_rf INTEGER,
  smn_motivos_id INTEGER,
  smn_clase_auxiliar_rf INTEGER,
  smn_auxiliar_rf INTEGER,
  inm_ordenante_descripcion VARCHAR(100),
  smn_sintoma_id INTEGER,
  inm_tipo_orden CHARACTER(3) NOT NULL,
  inm_num_orden_medica INTEGER,
  inm_estatus CHARACTER(2) NOT NULL,
  inm_idioma CHARACTER(2) NOT NULL,
  inm_usuario VARCHAR(10) NOT NULL,
  inm_fecha_registro DATE NOT NULL,
  inm_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_ingreso_movimiento;


CREATE TABLE smn_salud.smn_ingresos(
  smn_ingresos_id INTEGER NOT NULL,
  smn_doc_orig INTEGER,
  smn_documento_id INTEGER NOT NULL,
  igs_doc_origen INTEGER,
  igs_num_ingreso SERIAL NOT NULL,
  smn_entidades_rf INTEGER,
  smn_sucursales_rf INTEGER,
  smn_areas_servicios_rf INTEGER NOT NULL,
  smn_unidades_servicios_rf INTEGER NOT NULL,
  ctm_observaciones_id CHARACTER(100),
  igs_ticket INTEGER,
  smn_clase_rf INTEGER NOT NULL,
  smn_auxiliar_rf INTEGER NOT NULL,
  smn_contratante_id INTEGER,
  smn_auxiliar_sucursales_rf INTEGER,
  smn_auxiliar_areas_servicios_rf INTEGER,
  smn_auxilia_unidad_servicio_rf INTEGER,
  smn_motivos_id INTEGER,
  smn_observaciones_ingresos_id INTEGER,
  igs_monto_moneda_local DOUBLE PRECISION,
  smn_moneda_rf INTEGER,
  igs_monto_moneda_alterna DOUBLE PRECISION,
  smn_sintoma_id INTEGER NOT NULL,
  igs_estatus_financiero CHARACTER(2) NOT NULL,
  igs_idioma CHARACTER(2) NOT NULL,
  igs_usuario VARCHAR(10) NOT NULL,
  igs_fecha_registro DATE NOT NULL,
  igs_hora CHARACTER(8) NOT NULL,
  smn_patologia_id INTEGER,
  smn_prestador_servicio_rf INTEGER,
  igs_numero_autorizacion CHARACTER(64),
  igs_fecha_ingreso DATE,
  igs_dias_hospitalizacion INTEGER,
  igs_fecha_salida DATE,
  smn_activo_fijo INTEGER,
  igs_monto_cobertura DOUBLE PRECISION,
  igs_monto_cobertura_ma DOUBLE PRECISION,
  igs_hora_salida CHARACTER(11)
);

CREATE SEQUENCE smn_salud.seq_smn_ingresos;


CREATE TABLE smn_salud.smn_ingresos_old(
  smn_ingresos_id INTEGER NOT NULL,
  smn_doc_orig INTEGER,
  smn_documento_id INTEGER NOT NULL,
  igs_doc_origen INTEGER,
  igs_num_ingreso SERIAL NOT NULL,
  smn_entidades_rf INTEGER,
  smn_sucursales_rf INTEGER,
  smn_areas_servicios_rf INTEGER NOT NULL,
  smn_unidades_servicios_rf INTEGER NOT NULL,
  ctm_observaciones_id CHARACTER(100),
  igs_ticket INTEGER,
  smn_clase_rf INTEGER NOT NULL,
  smn_auxiliar_rf INTEGER NOT NULL,
  smn_contratante_id INTEGER,
  smn_auxiliar_sucursales_rf INTEGER,
  smn_auxiliar_areas_servicios_rf INTEGER,
  smn_auxilia_unidad_servicio_rf INTEGER,
  smn_motivos_id INTEGER,
  smn_observaciones_ingresos_id INTEGER,
  igs_monto_moneda_local DOUBLE PRECISION,
  smn_moneda_rf INTEGER,
  igs_monto_moneda_alterna DOUBLE PRECISION,
  smn_sintoma_id INTEGER NOT NULL,
  igs_estatus_financiero CHARACTER(2) NOT NULL,
  igs_idioma CHARACTER(2) NOT NULL,
  igs_usuario VARCHAR(10) NOT NULL,
  igs_fecha_registro DATE NOT NULL,
  igs_hora CHARACTER(8) NOT NULL,
  smn_patologia_id INTEGER,
  smn_prestador_servicio_rf INTEGER,
  igs_numero_autorizacion CHARACTER(64),
  igs_fecha_ingreso DATE,
  igs_dias_hospitalizacion INTEGER,
  igs_fecha_salida DATE,
  smn_activo_fijo INTEGER,
  igs_monto_cobertura DOUBLE PRECISION,
  igs_monto_cobertura_ma DOUBLE PRECISION
);

CREATE SEQUENCE smn_salud.seq_smn_ingresos_old;


CREATE TABLE smn_salud.smn_ingresos_servicios(
  smn_ingresos_servicios_id INTEGER NOT NULL,
  smn_ingresos_id INTEGER NOT NULL,
  smn_v_servicios_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_ingresos_servicios;


CREATE TABLE smn_salud.smn_localidad(
  smn_localidad_id INTEGER NOT NULL,
  loc_codigo VARCHAR(16) NOT NULL,
  loc_descripcion VARCHAR(48) NOT NULL,
  loc_status CHARACTER(1) NOT NULL,
  loc_idioma CHARACTER(2) NOT NULL,
  loc_usuario_id VARCHAR(10) NOT NULL,
  loc_fecha_registro DATE NOT NULL,
  loc_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_localidad;


CREATE TABLE smn_salud.smn_sector(
  smn_sector_id INTEGER NOT NULL,
  sec_codigo VARCHAR(16) NOT NULL,
  sec_descripcion VARCHAR(48) NOT NULL,
  smn_pais_rf INTEGER NOT NULL,
  smn_entidades_federales_rf INTEGER,
  smn_ciudades_rf INTEGER,
  smn_municipios_rf INTEGER,
  smn_parroquias_rf INTEGER,
  smn_zonas_postales_rf INTEGER,
  sec_idioma CHARACTER(2) NOT NULL,
  sec_usuario_id VARCHAR(10) NOT NULL,
  sec_fecha_registro DATE,
  sec_hora CHARACTER(8) NOT NULL,
  smn_rel_local_sector_id INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_sector;


CREATE TABLE smn_salud.smn_localidad_sector(
  smn_rel_local_sector_id INTEGER NOT NULL,
  smn_localidad_id INTEGER,
  smn_sector_id INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_localidad_sector;


CREATE TABLE smn_salud.smn_motivos(
  smn_motivos_id INTEGER NOT NULL,
  mtv_codigo VARCHAR(16) NOT NULL,
  mtv_descripcion VARCHAR(56) NOT NULL,
  mtv_idioma CHARACTER(2) NOT NULL,
  mtv_usuario VARCHAR(10) NOT NULL,
  mtv_fecha_registro DATE NOT NULL,
  mtv_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_motivos;


CREATE TABLE smn_salud.smn_naturaleza_servicio(
  smn_naturaleza_servicio_id INTEGER NOT NULL,
  smn_tipo_servicio_rf INTEGER NOT NULL,
  nts_naturaleza CHARACTER(2) NOT NULL,
  nts_idioma CHARACTER(2) NOT NULL,
  nts_usuario VARCHAR(10) NOT NULL,
  nts_fecha_registro DATE NOT NULL,
  nts_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_naturaleza_servicio;


CREATE TABLE smn_salud.smn_no_registrados(
  smn_no_registrados_id INTEGER NOT NULL,
  nfi_num_control VARCHAR(16) NOT NULL,
  nfi_apellidos VARCHAR(56) NOT NULL,
  nfi_nombres VARCHAR(56) NOT NULL,
  nfi_sexo CHARACTER(2) NOT NULL,
  nfi_telefono_fijo VARCHAR(24) NOT NULL,
  nfi_telefono_movil VARCHAR(24),
  nfi_email VARCHAR(96) NOT NULL,
  nfi_idioma CHARACTER(2) NOT NULL,
  nfi_usuario VARCHAR(10) NOT NULL,
  nfi_fecha_registro DATE NOT NULL,
  nfi_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_no_registrados;


CREATE TABLE smn_salud.smn_observaciones(
  smn_observaciones_id INTEGER NOT NULL,
  obs_codigo VARCHAR(16) NOT NULL,
  obs_descripcion VARCHAR(56) NOT NULL,
  obs_tipo CHARACTER(2),
  obs_idioma CHARACTER(2) NOT NULL,
  obs_usuario VARCHAR(10) NOT NULL,
  obs_fecha_registro DATE NOT NULL,
  obs_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_observaciones;


CREATE TABLE smn_salud.smn_ordenes_medicas(
  smn_ordenes_medicas_id INTEGER NOT NULL,
  smn_ingreso_id INTEGER NOT NULL,
  omd_numero_orden VARCHAR(16) NOT NULL,
  omd_descripcion VARCHAR(256) NOT NULL,
  smn_prestador_servicio_rf INTEGER,
  omd_clase_auxiliar INTEGER NOT NULL,
  omd_auxiliar INTEGER NOT NULL,
  omd_tipo_orden CHARACTER(2) NOT NULL,
  omd_indicaciones VARCHAR(500) NOT NULL,
  omd_idioma CHARACTER(2) NOT NULL,
  omd_usuario VARCHAR(10) NOT NULL,
  omd_fecha_registro DATE NOT NULL,
  omd_hora CHARACTER(8) NOT NULL,
  omd_estatus CHARACTER(2)
);

CREATE SEQUENCE smn_salud.seq_smn_ordenes_medicas;


CREATE TABLE smn_salud.smn_origen(
  smn_origen_id INTEGER NOT NULL,
  ori_codigo VARCHAR(16) NOT NULL,
  ori_descripcion VARCHAR(56) NOT NULL,
  ori_tipo CHARACTER(2) NOT NULL,
  ori_idioma CHARACTER(2) NOT NULL,
  ori_usuario VARCHAR(10) NOT NULL,
  ori_fecha_registro DATE NOT NULL,
  ori_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_origen;


CREATE TABLE smn_salud.smn_paciente(
  smn_paciente_id INTEGER NOT NULL,
  smn_clase_auxiliar_rf INTEGER,
  smn_auxiliar_rf INTEGER,
  pac_historia INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_paciente;


CREATE TABLE smn_salud.smn_patologia(
  smn_patologia_id INTEGER NOT NULL,
  pat_codigo VARCHAR(48) NOT NULL,
  pat_descripcion VARCHAR(100) NOT NULL,
  pat_estatus CHARACTER(2) NOT NULL,
  pat_idioma CHARACTER(2) NOT NULL,
  pat_usuario VARCHAR(10) NOT NULL,
  pat_fecha_registro DATE NOT NULL,
  pat_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_patologia;


CREATE TABLE smn_salud.smn_planes_coberturas(
  smn_planes_coberturas_id INTEGER NOT NULL,
  smn_planes_id INTEGER NOT NULL,
  smn_coberturas_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_planes_coberturas;


CREATE TABLE smn_salud.smn_planificacion_de_turno(
  smn_plan_turno_id INTEGER NOT NULL,
  smn_usuario_id INTEGER NOT NULL,
  smn_rol_id INTEGER NOT NULL,
  ptu_fecha DATE NOT NULL,
  smn_serie_id INTEGER NOT NULL,
  smn_entidades_rf INTEGER NOT NULL,
  smn_sucursales_rf INTEGER NOT NULL,
  smn_areas_servicios_rf INTEGER NOT NULL,
  smn_unidad_servicio_rf INTEGER,
  ptu_estatus CHARACTER(2) NOT NULL,
  ptu_idioma CHARACTER(2) NOT NULL,
  ptu_usuario VARCHAR(10) NOT NULL,
  ptu_fecha_registro DATE NOT NULL,
  ptu_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_planificacion_de_turno;


CREATE TABLE smn_salud.smn_prestacion_servicio_medico_detalle(
  smn_prestacion_servicio_medico_detalle_id INTEGER NOT NULL,
  smn_prestacion_servicio_medico_cabecera_id INTEGER NOT NULL,
  smn_mov_caja_detalle_id INTEGER,
  smn_ingresos_mov_id INTEGER NOT NULL,
  smn_unidades_servicios_rf INTEGER NOT NULL,
  smn_almacen_rf INTEGER,
  smn_servicios_rf INTEGER,
  psd_tipo_componentes CHARACTER(2),
  smn_componentes_rf INTEGER,
  smn_item_rf INTEGER,
  smn_prestador_servicio_rf INTEGER,
  psd_cantidad DOUBLE PRECISION NOT NULL,
  psd_precio_propuesto_ml DOUBLE PRECISION NOT NULL,
  psd_monto_propuesto_ml DOUBLE PRECISION NOT NULL,
  smn_descuento_ml_rf INTEGER,
  smn_moneda_rf INTEGER,
  psd_precio_propuesto_ma DOUBLE PRECISION,
  psd_monto_propuesto_ma DOUBLE PRECISION,
  psd_monto_descuento_propuesto_ml INTEGER,
  psd_monto_descuento_propuesto_ma INTEGER,
  psd_monto_neto_propuesto_ml INTEGER,
  psd_monto_neto_propuesto_ma INTEGER,
  psd_estatus CHARACTER(2),
  psd_agregado_usuario CHARACTER(2),
  psd_observaciones_rf INTEGER,
  smn_rol_id INTEGER,
  psd_idioma CHARACTER(2) NOT NULL,
  psd_usuario VARCHAR(10) NOT NULL,
  psd_fecha_registro DATE NOT NULL,
  psd_hora CHARACTER(8) NOT NULL,
  smn_ingresos_id INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_prestacion_servicio_medico_detalle;


CREATE TABLE smn_salud.smn_presupuesto(
  smn_presupuesto_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  pre_numero_control SERIAL NOT NULL,
  smn_entidades_rf INTEGER NOT NULL,
  smn_sucursales_rf INTEGER,
  smn_clase_auxiliar_rf INTEGER NOT NULL,
  smn_auxiliar_rf INTEGER,
  smn_clase_ord_rf INTEGER,
  smn_auxiliar_ord_rf INTEGER,
  smn_baremo_rf INTEGER,
  smn_auxiliar_unidades_negocios_rf INTEGER,
  smn_auxiliar_sucursales_rf INTEGER,
  smn_auxiliar_areas_servicios_rf INTEGER,
  smn_auxiliar_unidades_servicios_rf INTEGER,
  pre_vigencia_hasta DATE NOT NULL,
  smn_ordenes_medicas_id INTEGER,
  pre_fecha_entrega DATE,
  pre_monto_ml DOUBLE PRECISION,
  smn_moneda_rf INTEGER,
  pre_monto_ma DOUBLE PRECISION,
  smn_estado_presupuesto_id INTEGER NOT NULL,
  pre_idioma CHARACTER(2) NOT NULL,
  pre_usuario VARCHAR(10) NOT NULL,
  pre_fecha_registro DATE NOT NULL,
  pre_hora CHARACTER(8) NOT NULL,
  pre_monto_descuento DOUBLE PRECISION,
  pre_monto_neto_moneda_local DOUBLE PRECISION,
  pre_monto_neto_moneda_alterna DOUBLE PRECISION,
  smn_tabla_origen_rf VARCHAR(50),
  smn_documento_origen_rf INTEGER,
  smn_codigo_descuento_rf INTEGER,
  pre_monto_impuesto_ml DOUBLE PRECISION,
  pre_monto_impuesto_ma DOUBLE PRECISION,
  smn_ingresos_id INTEGER,
  pre_monto_descuento_moneda_alterna DOUBLE PRECISION,
  smn_contratante_id INTEGER,
  pre_tipo CHARACTER(2),
  smn_patologia_id INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_presupuesto;


CREATE TABLE smn_salud.smn_presupuesto_componente(
  smn_presupuesto_componente_id INTEGER NOT NULL,
  smn_presupuesto_detalle_id INTEGER NOT NULL,
  smn_presupuesto_id INTEGER NOT NULL,
  smn_servicios_rf INTEGER NOT NULL,
  smn_tipos_componentes_rf CHARACTER(2) NOT NULL,
  smn_componentes_rf INTEGER NOT NULL,
  smn_grupo_prestador_rf INTEGER,
  smn_prestadores_servicios_rf INTEGER,
  prc_porcentaje_prestador INTEGER NOT NULL,
  prc_forma_calculo_rf CHARACTER(2) NOT NULL,
  prc_visible_rf CHARACTER(1),
  prc_cantidad INTEGER NOT NULL,
  prc_precio_ml DOUBLE PRECISION NOT NULL,
  prc_precio_ma DOUBLE PRECISION,
  smn_moneda_rf INTEGER,
  prc_monto_ml DOUBLE PRECISION,
  prc_monto_ma DOUBLE PRECISION,
  prc_monto_impuesto_ml DOUBLE PRECISION,
  prc_monto_impuesto_ma DOUBLE PRECISION,
  prc_monto_descuento_ml DOUBLE PRECISION,
  prc_monto_descuento_ma DOUBLE PRECISION,
  smn_incrementos_porcentaje_rf INTEGER,
  prc_monto_incremento_ml DOUBLE PRECISION,
  prc_monto_incremento_ma DOUBLE PRECISION,
  prc_monto_neto_ml DOUBLE PRECISION,
  prc_monto_neto_ma DOUBLE PRECISION,
  prc_idioma CHARACTER(2) NOT NULL,
  prc_usuario VARCHAR(10) NOT NULL,
  prc_fecha_registro DATE NOT NULL,
  prc_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_presupuesto_componente;


CREATE TABLE smn_salud.smn_presupuesto_detalle(
  smn_presupuesto_detalle_id INTEGER NOT NULL,
  smn_presupuesto_id INTEGER NOT NULL,
  smn_servicios_rf INTEGER NOT NULL,
  prd_cantidad INTEGER NOT NULL,
  prd_precio DOUBLE PRECISION NOT NULL,
  smn_moneda_rf INTEGER,
  prd_precio_ma DOUBLE PRECISION,
  prd_monto_moneda_local DOUBLE PRECISION NOT NULL,
  prd_moneda_alterna DOUBLE PRECISION,
  prd_idioma CHARACTER(2) NOT NULL,
  prd_usuario VARCHAR(10) NOT NULL,
  prd_fecha_registro DATE NOT NULL,
  prd_hora CHARACTER(8) NOT NULL,
  smn_tipo_componentes_rf VARCHAR(2),
  smn_componentes_rf INTEGER,
  smn_codigo_descuento_rf INTEGER,
  smn_tasa_rf INTEGER,
  prd_observaciones VARCHAR(255),
  smn_item_rf INTEGER,
  prd_monto_descuento_ml DOUBLE PRECISION,
  prd_monto_neto_ml DOUBLE PRECISION,
  prd_monto_impuesto_ml DOUBLE PRECISION,
  prd_monto_descuento_ma DOUBLE PRECISION,
  prd_monto_neto_ma DOUBLE PRECISION,
  prd_monto_impuesto_ma DOUBLE PRECISION,
  smn_prestadores_servicios_rf INTEGER,
  smn_grupo_prestador_rf INTEGER,
  prd_porcentaje_prestador DOUBLE PRECISION,
  prd_forma_calculo_rf CHARACTER(2),
  prd_visible_rf CHARACTER(2),
  prd_monto_incremento_ml DOUBLE PRECISION,
  prd_monto_incremento_ma DOUBLE PRECISION,
  smn_incrementos_rf INTEGER,
  prd_estatus CHARACTER(2),
  prd_naturaleza CHARACTER(2)
);

CREATE SEQUENCE smn_salud.seq_smn_presupuesto_detalle;


CREATE TABLE smn_salud.smn_presupuesto_impuesto(
  smn_presupuesto_impuesto_id INTEGER NOT NULL,
  smn_presupuesto_detalle_id INTEGER NOT NULL,
  smn_servicios_rf INTEGER,
  smn_item_rf INTEGER,
  smn_codigo_impuesto_id INTEGER NOT NULL,
  pim_base_imponible_ml DOUBLE PRECISION NOT NULL,
  pim_base_excenta_ml DOUBLE PRECISION,
  pim_monto_impuesto_ml DOUBLE PRECISION,
  pim_monto_sustraendo_ml DOUBLE PRECISION,
  pim_monto_neto_impuesto_ml DOUBLE PRECISION,
  smn_tasa_rf INTEGER,
  smn_moneda_rf INTEGER,
  pim_base_imponible_ma DOUBLE PRECISION,
  pim_base_excenta_ma DOUBLE PRECISION,
  pim_monto_impuesto_ma DOUBLE PRECISION,
  pim_monto_sustraendo_ma DOUBLE PRECISION,
  pim_monto_neto_impuesto_ma DOUBLE PRECISION,
  pim_idioma CHARACTER(2) NOT NULL,
  pim_usuario VARCHAR(10) NOT NULL,
  pim_fecha_registro DATE NOT NULL,
  pim_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_presupuesto_impuesto;


CREATE TABLE smn_salud.smn_recipe_medico(
  smn_recipe_medico_id INTEGER NOT NULL,
  rec_fecha DATE NOT NULL,
  smn_auxiliar_rf INTEGER NOT NULL,
  smn_patologia_id INTEGER,
  smn_prestador_servicio_rf INTEGER NOT NULL,
  rec_ordenante_nombre INTEGER,
  smn_contratante_id INTEGER,
  smn_farmaceuta_prestador_servicio_rf INTEGER,
  rec_fecha_aprobacion DATE,
  rec_estatus CHARACTER(2) NOT NULL,
  rec_idioma CHARACTER(2) NOT NULL,
  rec_usuario VARCHAR(10) NOT NULL,
  rec_fecha_registro DATE NOT NULL,
  rec_hora CHARACTER(8) NOT NULL,
  smn_prestacion_servicio_medico_id INTEGER,
  rec_sintoma VARCHAR(255)
);

CREATE SEQUENCE smn_salud.seq_smn_recipe_medico;


CREATE TABLE smn_salud.smn_recipe_medico_detalle(
  smn_recipe_medico_detalle_id INTEGER NOT NULL,
  smn_recipe_medico_id INTEGER NOT NULL,
  smn_principio_activo_rf INTEGER NOT NULL,
  smn_item_rf INTEGER NOT NULL,
  smn_presentacion_rf INTEGER NOT NULL,
  smn_unidad_medida_rf INTEGER NOT NULL,
  rmd_dosis DOUBLE PRECISION NOT NULL,
  rmd_frecuencia INTEGER,
  rmd_tiempo_frecuencia CHARACTER(2),
  rmd_especificacion VARCHAR(200),
  rmd_dias_tratamiento INTEGER,
  rmd_dosis_total INTEGER,
  rmd_observacion VARCHAR(200),
  rmd_idioma CHARACTER(2) NOT NULL,
  rmd_usuario VARCHAR(10) NOT NULL,
  rmd_fecha_registro DATE NOT NULL,
  rmd_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_recipe_medico_detalle;


CREATE TABLE smn_salud.smn_rel_cobertura_horario(
  smn_rel_cobertura_horario_id INTEGER NOT NULL,
  smn_coberturas_id INTEGER NOT NULL,
  smn_horarios_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_rel_cobertura_horario;


CREATE TABLE smn_salud.smn_rel_cobertura_localidad(
  smn_rel_cobertura_local_id INTEGER NOT NULL,
  smn_coberturas_id INTEGER NOT NULL,
  smn_localidad_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_rel_cobertura_localidad;


CREATE TABLE smn_salud.smn_rel_coberturas_unidades_servicios(
  smn_rel_coberturas_unidades_servicios_id INTEGER NOT NULL,
  smn_coberturas_id INTEGER NOT NULL,
  smn_unidades_servicios_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_rel_coberturas_unidades_servicios;


CREATE TABLE smn_salud.smn_rel_ingreso_mov_examenes(
  smn_rel_ingreso_mov_examenes_id INTEGER NOT NULL,
  smn_ingresos_mov_id INTEGER NOT NULL,
  smn_servicios_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_rel_ingreso_mov_examenes;


CREATE TABLE smn_salud.smn_rel_patologia_item(
  smn_rel_patologia_item_id INTEGER NOT NULL,
  smn_patologia_id INTEGER NOT NULL,
  smn_item_rf INTEGER NOT NULL,
  rps_cantidad INTEGER NOT NULL,
  rps_idioma CHARACTER(2) NOT NULL,
  rps_usuario_id VARCHAR(10) NOT NULL,
  rps_fecha_registro DATE NOT NULL,
  rps_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_rel_patologia_item;


CREATE TABLE smn_salud.smn_rel_patologia_servicios(
  smn_rel_patologia_servicios_id INTEGER NOT NULL,
  smn_patologia_id INTEGER NOT NULL,
  smn_servicio_rf INTEGER NOT NULL,
  rps_cantidad INTEGER NOT NULL,
  rps_idioma CHARACTER(2) NOT NULL,
  rps_usuario_id VARCHAR(10) NOT NULL,
  rps_fecha_registro DATE NOT NULL,
  rps_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_rel_patologia_servicios;


CREATE TABLE smn_salud.smn_rel_plan_contrato(
  smn_rel_plan_contrato_modulo_id INTEGER NOT NULL,
  smn_planes_id INTEGER NOT NULL,
  smn_contrato_modulo_id INTEGER NOT NULL,
  rpc_vigencia CHARACTER(1) NOT NULL,
  rpc_fecha_vigencia DATE NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_rel_plan_contrato;


CREATE TABLE smn_salud.smn_rel_planes_coberturas(
  smn_rel_planes_coberturas_id INTEGER NOT NULL,
  smn_planes_id INTEGER NOT NULL,
  smn_coberturas_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_rel_planes_coberturas;


CREATE TABLE smn_salud.smn_rel_usuarios_entidad(
  smn_rel_usuario_entidad_id INTEGER NOT NULL,
  smn_usuario_rf INTEGER NOT NULL,
  smn_entidades_rf INTEGER NOT NULL,
  smn_sucursales_rf INTEGER NOT NULL,
  smn_area_servicio_rf INTEGER NOT NULL,
  smn_unidad_servicio_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_rel_usuarios_entidad;


CREATE TABLE smn_salud.smn_relacion_area_series(
  smn_rel_area_serie_id INTEGER NOT NULL,
  smn_series_id INTEGER NOT NULL,
  smn_areas_servicios_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_relacion_area_series;


CREATE TABLE smn_salud.smn_tramos(
  smn_tramos_id INTEGER NOT NULL,
  trm_codigo VARCHAR(16) NOT NULL,
  trm_descripcion VARCHAR(100) NOT NULL,
  trm_dia_semana CHARACTER(2) NOT NULL,
  trm_hora_inicio CHARACTER(5) NOT NULL,
  trm_hora_fin CHARACTER(5) NOT NULL,
  trm_idioma CHARACTER(2) NOT NULL,
  trm_usuario_id VARCHAR(10) NOT NULL,
  trm_fecha_registro DATE NOT NULL,
  trm_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_tramos;


CREATE TABLE smn_salud.smn_relacion_horario_tramos(
  smn_rel_horario_tramo_id INTEGER NOT NULL,
  smn_horarios_id INTEGER NOT NULL,
  smn_tramos_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_relacion_horario_tramos;


CREATE TABLE smn_salud.smn_relacion_paciente_secuencia(
  smn_rel_paciente_secuencia_id INTEGER NOT NULL,
  smn_ruta_id INTEGER NOT NULL,
  rps_secuencia INTEGER NOT NULL,
  smn_unidad_servicio_rf INTEGER NOT NULL,
  smn_grupo_prestador_servicio_rf INTEGER NOT NULL,
  smn_prestador_servicio_rf INTEGER NOT NULL,
  rps_hora_llegada_unidad CHARACTER(8) NOT NULL,
  rps_hora_salida_unidad CHARACTER(8) NOT NULL,
  rps_estatus_id CHARACTER(2) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_relacion_paciente_secuencia;


CREATE TABLE smn_salud.smn_relacion_unidad_paso(
  smn_rel_unidad_paso INTEGER NOT NULL,
  smn_area_servicio_rf INTEGER NOT NULL,
  smn_unidad_servicio_rf INTEGER NOT NULL,
  smn_paso_rf INTEGER NOT NULL,
  smn_serie_id INTEGER NOT NULL,
  rup_secuencia INTEGER NOT NULL,
  rup_unidad_administrativa CHARACTER(2),
  rup_estatus CHARACTER(2) NOT NULL,
  rup_vigencia DATE NOT NULL,
  rup_idioma CHARACTER(2) NOT NULL,
  rup_usuario_id VARCHAR(10) NOT NULL,
  rup_fecha_registro DATE NOT NULL,
  rup_hora CHARACTER(8) NOT NULL,
  smn_grupo_prestador_servicio INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_relacion_unidad_paso;


CREATE TABLE smn_salud.smn_relacion_unidades_series(
  smn_relacion_unidades_series_id INTEGER NOT NULL,
  smn_series_id INTEGER NOT NULL,
  smn_unidades_servicios_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_relacion_unidades_series;


CREATE TABLE smn_salud.smn_relacionados(
  smn_relacionado_id INTEGER NOT NULL,
  smn_afiliados_id INTEGER,
  smn_documento_id INTEGER NOT NULL,
  rel_numero_control INTEGER,
  smn_clase_rf INTEGER NOT NULL,
  smn_auxiliar_rf INTEGER NOT NULL,
  smn_parentesco_rf INTEGER,
  smn_numero_hijo INTEGER,
  rel_idioma CHARACTER(2) NOT NULL,
  rel_usuario_id VARCHAR(10) NOT NULL,
  rel_fecha_registro DATE NOT NULL,
  rel_hora CHARACTER(8) NOT NULL,
  rel_apellidos VARCHAR(100),
  rel_nombres VARCHAR(100),
  rel_num_doc_oficial CHARACTER(12),
  smn_contratante_id INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_relacionados;


CREATE TABLE smn_salud.smn_reposos_constancias(
  smn_reposos_constancias_id INTEGER NOT NULL,
  smn_ingreso_id INTEGER NOT NULL,
  smn_auxiliar_rf INTEGER NOT NULL,
  smn_diagnostico_rf INTEGER NOT NULL,
  rpc_fecha_desde DATE NOT NULL,
  rpc_fecha_hasta DATE NOT NULL,
  rpc_fecha_reintegro DATE,
  rpc_motivo INTEGER NOT NULL,
  rpc_observacion VARCHAR(200),
  rpc_idioma CHARACTER(10) NOT NULL,
  rpc_usuario VARCHAR(10) NOT NULL,
  rpc_fecha_registro DATE NOT NULL,
  rpc_hora CHARACTER(8) NOT NULL,
  rpc_estatus CHARACTER(2),
  rpc_emision_certificacion CHARACTER(2),
  rpc_numero_reposo_certificado INTEGER,
  smn_medico_auxiliar_rf INTEGER,
  rpc_numero_sanidad INTEGER,
  rpc_entidad_emisora INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_reposos_constancias;


CREATE TABLE smn_salud.smn_rol(
  smn_rol_id INTEGER NOT NULL,
  smn_usuario_id INTEGER NOT NULL,
  rol_tipo CHARACTER(2) NOT NULL,
  smn_corporacion_rf INTEGER,
  smn_entidad_rf INTEGER,
  smn_sucursal_rf INTEGER,
  smn_area_servicio_rf INTEGER,
  smn_unidad_servicio_rf INTEGER,
  smn_estructura_organizacional_rf INTEGER,
  rol_idioma CHARACTER(2) NOT NULL,
  rol_usuario_id VARCHAR(10) NOT NULL,
  rol_fecha_registro DATE NOT NULL,
  rol_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_rol;


CREATE TABLE smn_salud.smn_ruta_paciente(
  smn_ruta_id INTEGER NOT NULL,
  smn_clase_auxiliar_rf INTEGER NOT NULL,
  smn_auxiliar_rf INTEGER,
  rta_numero_documento_identidad VARCHAR(20) NOT NULL,
  smn_entidad_rf INTEGER NOT NULL,
  smn_sucursal_rf INTEGER NOT NULL,
  smn_area_servicio_rf INTEGER NOT NULL,
  smn_unidad_servicio_rf INTEGER,
  smn_grupo_prestador_rf INTEGER,
  smn_prestador_servicio_rf INTEGER,
  rta_estatus CHARACTER(2),
  rta_secuencia INTEGER,
  smn_serie_id CHARACTER(8) NOT NULL,
  rta_ticket INTEGER NOT NULL,
  rta_idioma CHARACTER(2) NOT NULL,
  rta_usuario VARCHAR(10) NOT NULL,
  rta_fecha_registro DATE NOT NULL,
  rta_hora CHARACTER(8) NOT NULL,
  rta_ejecutivo_asignado INTEGER,
  rta_observacion INTEGER,
  rta_hora_llegada_unidad TIME,
  rta_hora_salida_unidad TIME,
  smn_contratante_id INTEGER,
  smn_ingreso_id INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_ruta_paciente;


CREATE TABLE smn_salud.smn_ruta_paciente_old(
  smn_ruta_id INTEGER NOT NULL,
  smn_clase_auxiliar_rf INTEGER NOT NULL,
  smn_auxiliar_rf INTEGER,
  rta_numero_documento_identidad VARCHAR(20) NOT NULL,
  smn_entidad_rf INTEGER NOT NULL,
  smn_sucursal_rf INTEGER NOT NULL,
  smn_area_servicio_rf INTEGER NOT NULL,
  smn_unidad_servicio_rf INTEGER,
  smn_grupo_prestador_rf INTEGER,
  smn_prestador_servicio_rf INTEGER,
  rta_estatus CHARACTER(2),
  rta_secuencia INTEGER,
  smn_serie_id CHARACTER(8) NOT NULL,
  rta_ticket INTEGER NOT NULL,
  rta_idioma CHARACTER(2) NOT NULL,
  rta_usuario VARCHAR(10) NOT NULL,
  rta_fecha_registro DATE NOT NULL,
  rta_hora CHARACTER(8) NOT NULL,
  rta_ejecutivo_asignado INTEGER,
  rta_observacion INTEGER,
  rta_hora_llegada_unidad TIME,
  rta_hora_salida_unidad TIME,
  smn_contratante_id INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_ruta_paciente_old;


CREATE TABLE smn_salud.smn_salud_plantilla_cabecera(
  smn_salud_plantilla_cabecera_id INTEGER NOT NULL,
  smn_cuestionario_rf INTEGER NOT NULL,
  spc_numero_cuestionario INTEGER NOT NULL,
  smn_auxiliar_rf INTEGER NOT NULL,
  spc_fecha_evento DATE NOT NULL,
  spc_hora_evento CHARACTER(8) NOT NULL,
  smn_prestadores_servicio_rf INTEGER,
  smn_ingreso_id INTEGER,
  spc_nivel_seguridad INTEGER NOT NULL,
  spc_estatus_formulario CHARACTER(2) NOT NULL,
  spc_estatus_proceso CHARACTER(2) NOT NULL,
  spc_idioma CHARACTER(2) NOT NULL,
  spc_usuario VARCHAR(10) NOT NULL,
  spc_fecha_registro DATE NOT NULL,
  spc_hora CHARACTER(8) NOT NULL,
  smn_servicio_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_salud_plantilla_cabecera;


CREATE TABLE smn_salud.smn_salud_plantilla_detalle(
  smn_salud_plantilla_detalle_id INTEGER NOT NULL,
  smn_salud_plantilla_cabecera_id INTEGER NOT NULL,
  smn_rel_cues_secc_preg_id INTEGER NOT NULL,
  smn_variable_rf INTEGER NOT NULL,
  spd_valor_respuesta VARCHAR(500),
  spd_idioma CHARACTER(2) NOT NULL,
  spd_usuario VARCHAR(10) NOT NULL,
  spd_fecha_registro DATE NOT NULL,
  spd_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_salud_plantilla_detalle;


CREATE TABLE smn_salud.smn_seguimiento(
  smn_seguimiento_id INTEGER NOT NULL,
  smn_ingreso_id INTEGER NOT NULL,
  seg_fecha DATE NOT NULL,
  seg_hora_seg CHARACTER(8) NOT NULL,
  seg_accion CHARACTER(100) NOT NULL,
  seg_observacion CHARACTER(100) NOT NULL,
  seg_estatus CHARACTER(2) NOT NULL,
  seg_idioma CHARACTER(2) NOT NULL,
  seg_usuario VARCHAR(10) NOT NULL,
  seg_fecha_registro DATE NOT NULL,
  seg_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_seguimiento;


CREATE TABLE smn_salud.smn_sintoma(
  smn_sintoma_id INTEGER NOT NULL,
  stm_codigo VARCHAR(16) NOT NULL,
  stm_descripcion VARCHAR(56) NOT NULL,
  stm_idioma CHARACTER(2) NOT NULL,
  stm_usuario VARCHAR(10) NOT NULL,
  stm_fecha_registro DATE NOT NULL,
  stm_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_sintoma;


CREATE TABLE smn_salud.smn_solicitud_presupuesto(
  smn_solicitud_presupuesto_id INTEGER NOT NULL,
  spr_solicitud INTEGER NOT NULL,
  smn_auxiliar INTEGER NOT NULL,
  smn_contratante_id INTEGER,
  smn_patologia_id INTEGER NOT NULL,
  spr_dias_hospitalizacion INTEGER NOT NULL,
  spr_horas_quirofano INTEGER NOT NULL,
  spr_instrumentales VARCHAR(250),
  spr_honorarios DOUBLE PRECISION,
  spr_estatus CHARACTER(2) NOT NULL,
  spr_idioma CHARACTER(2) NOT NULL,
  spr_usuario VARCHAR(10) NOT NULL,
  spr_fecha_registro DATE NOT NULL,
  spr_hora CHARACTER(8) NOT NULL,
  spr_descripcion VARCHAR(200),
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  spr_monto_ml DOUBLE PRECISION,
  smn_presupuesto_id INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_solicitud_presupuesto;


CREATE TABLE smn_salud.smn_tipo_coberturas(
  smn_tipo_coberturas_id INTEGER NOT NULL,
  tco_codigo VARCHAR(16) NOT NULL,
  tco_descripcion VARCHAR(56) NOT NULL,
  tco_idioma CHARACTER(2) NOT NULL,
  tco_usuario VARCHAR(10) NOT NULL,
  tco_fecha_registro DATE NOT NULL,
  tco_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_tipo_coberturas;


CREATE TABLE smn_salud.smn_tipo_consulta(
  smn_tipo_consulta_id INTEGER NOT NULL,
  tcs_codigo VARCHAR(10) NOT NULL,
  tcs_nombre VARCHAR(100) NOT NULL,
  tcs_idioma CHARACTER(2) NOT NULL,
  tcs_usuario_id VARCHAR(10) NOT NULL,
  tcs_fecha_registro DATE NOT NULL,
  tcs_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_tipo_consulta;


CREATE TABLE smn_salud.smn_tipo_documento(
  smn_tipo_documento_id INTEGER NOT NULL,
  tdc_codigo VARCHAR(10) NOT NULL,
  tdc_nombre VARCHAR(100) NOT NULL,
  tdc_naturaleza CHARACTER(2) NOT NULL,
  tdc_idioma CHARACTER(2) NOT NULL,
  tdc_usuario_id VARCHAR(10) NOT NULL,
  tdc_fecha_registro DATE NOT NULL,
  tdc_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_tipo_documento;


CREATE TABLE smn_salud.smn_tramos_descanso(
  smn_tramo_descanso_id INTEGER NOT NULL,
  smn_tramos_id INTEGER NOT NULL,
  trd_hora_descanso_desde CHARACTER(5) NOT NULL,
  trd_hora_descanso_hasta CHARACTER(5) NOT NULL,
  trd_idioma CHARACTER(2) NOT NULL,
  trd_usuario_id VARCHAR(10) NOT NULL,
  trd_fecha_registro DATE NOT NULL,
  trd_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_tramos_descanso;


CREATE TABLE smn_salud.smn_acciones(
  smn_acciones_id INTEGER NOT NULL,
  acc_codigo CHARACTER(64) NOT NULL,
  acc_descripcion VARCHAR(100) NOT NULL,
  acc_idioma CHARACTER(2) NOT NULL,
  acc_usuario VARCHAR(10) NOT NULL,
  acc_fecha_registro DATE NOT NULL,
  acc_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_acciones;


CREATE TABLE smn_salud.smn_rel_documentos_servicios(
  smn_rel_documentos_servicios_id INTEGER NOT NULL,
  smn_documentos_id INTEGER NOT NULL,
  smn_servicios_id INTEGER NOT NULL,
  rdt_tipo_generacion INTEGER NOT NULL,
  rdt_hora_generacion CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_rel_documentos_servicios;


CREATE TABLE smn_salud.smn_rel_tipodoc_patologia(
  smn_rel_tipodoc_patologia_id INTEGER NOT NULL,
  smn_tipo_documento_id INTEGER NOT NULL,
  smn_patologia_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_rel_tipodoc_patologia;


CREATE TABLE smn_salud.smn_prestacion_servicio_medico_cabecera(
  smn_prestacion_servicio_medico_cabecera_id INTEGER NOT NULL,
  smn_ingresos_id INTEGER NOT NULL,
  smn_mov_caja_cabecera_id INTEGER,
  smn_unidades_servicios_rf INTEGER NOT NULL,
  psc_estatus CHARACTER(2) NOT NULL,
  psc_idioma CHARACTER(2) NOT NULL,
  psc_usuario VARCHAR(10) NOT NULL,
  psc_fecha_registro DATE NOT NULL,
  psc_hora CHARACTER(8) NOT NULL,
  psc_estatus_financiero CHARACTER(2) NOT NULL,
  smn_prestador_servicio_rf INTEGER,
  smn_grupo_prestador_rf INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_prestacion_servicio_medico_cabecera;


CREATE TABLE smn_salud.smn_puesto_atencion(
  smn_puesto_atencion_id INTEGER NOT NULL,
  put_codigo VARCHAR(48) NOT NULL,
  put_descripcion VARCHAR(100) NOT NULL,
  put_estatus CHARACTER(2) NOT NULL,
  put_idioma CHARACTER(2) NOT NULL,
  put_usuario VARCHAR(10) NOT NULL,
  put_fecha_registro DATE NOT NULL,
  put_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_puesto_atencion;


CREATE TABLE smn_salud.smn_marca_comercial(
  smn_marca_comercial_id INTEGER NOT NULL,
  mac_codigo VARCHAR(64) NOT NULL,
  mac_descripcion VARCHAR(200) NOT NULL,
  mac_idioma CHARACTER(2) NOT NULL,
  mac_usuario_id VARCHAR(10) NOT NULL,
  mac_fecha_registro DATE NOT NULL,
  mac_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_marca_comercial;


CREATE TABLE smn_salud.smn_rel_orden_medica_servicios(
  smn_rel_orden_medica_servicios_id INTEGER NOT NULL,
  smn_ordenes_medicas_id INTEGER NOT NULL,
  smn_servicios_rf INTEGER NOT NULL,
  ros_observacion VARCHAR(200),
  smn_grupo_prestador_rf INTEGER,
  smn_prestador_servicio_referido_rf INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_rel_orden_medica_servicios;


CREATE TABLE smn_salud.smn_control_quirofano(
  smn_control_quirofano_id INTEGER NOT NULL,
  smn_agenda_rf INTEGER NOT NULL,
  smn_presupuesto_id INTEGER,
  smn_ingreso_id INTEGER NOT NULL,
  smn_prestacion_servicio_cabecera_id INTEGER NOT NULL,
  smn_prestación_servicio_medico_detalle_id INTEGER NOT NULL,
  smn_servicios_rf CHARACTER(8) NOT NULL,
  ccq_hora_entrada CHARACTER(8),
  ccq_hora_salida INTEGER,
  ccq_fecha_quirofano DATE NOT NULL,
  smn_habitaciones_id INTEGER NOT NULL,
  ccq_cantidad_horas INTEGER NOT NULL,
  smn_unidad_medida_rf INTEGER,
  ccq_idioma CHARACTER(2) NOT NULL,
  ccq_usuario VARCHAR(10) NOT NULL,
  ccq_fecha_registro DATE NOT NULL,
  ccq_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_control_quirofano;


CREATE TABLE smn_salud.smn_rel_control_quirofano_prestador(
  smn_rel_control_quirofano_prestador_id INTEGER NOT NULL,
  smn_control_quirofano_id INTEGER NOT NULL,
  smn_servicios_rf INTEGER NOT NULL,
  smn_componente_rf INTEGER NOT NULL,
  smn_grupo_prestador_servicio_rf INTEGER NOT NULL,
  smn_prestador_servicio_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_rel_control_quirofano_prestador;


CREATE TABLE smn_salud.smn_plan_quirurgico(
  smn_plan_quirurgico_id INTEGER NOT NULL,
  smn_entidad_rf INTEGER NOT NULL,
  smn_sucursal_rf INTEGER NOT NULL,
  smn_habitaciones_id INTEGER NOT NULL,
  smn_presupuesto_id INTEGER,
  smn_contratante_id INTEGER,
  smn_clase_auxiliar_rf INTEGER,
  smn_auxiliar_rf INTEGER,
  smn_patologia_rf INTEGER,
  plq_fecha_cirugia DATE,
  plq_hora_inicial CHARACTER(8),
  plq_hora_final CHARACTER(8),
  plq_cantidad_horas INTEGER,
  plq_observaciones VARCHAR(200),
  plq_estatus CHARACTER(2) NOT NULL,
  plq_idioma CHARACTER(2) NOT NULL,
  plq_usuario VARCHAR(10) NOT NULL,
  plq_fecha_registro DATE NOT NULL,
  plq_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_plan_quirurgico;


CREATE TABLE smn_salud.smn_rel_plan_quirurgico_prestador(
  smn_rel_plan_quirurgico_prestador_id INTEGER NOT NULL,
  smn_plan_quirurgico_id INTEGER NOT NULL,
  smn_servicios_rf INTEGER NOT NULL,
  smn_componentes_rf INTEGER NOT NULL,
  smn_grupo_prestador_servicio_rf INTEGER NOT NULL,
  smn_prestador_servicio_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_rel_plan_quirurgico_prestador;



ALTER TABLE smn_salud.aad_estado_presupuesto ADD PRIMARY KEY (smn_estado_presupuesto_id);

ALTER TABLE smn_salud.smn_afiliado_titular ADD PRIMARY KEY (smn_afiliados_id);

ALTER TABLE smn_salud.smn_planes ADD PRIMARY KEY (smn_planes_id);

ALTER TABLE smn_salud.smn_afiliados_planes ADD PRIMARY KEY (smn_afiliados_planes_id);
ALTER TABLE smn_salud.smn_afiliados_planes ADD CONSTRAINT FK_smn_afiliados_planes_0 FOREIGN KEY (smn_planes_id) REFERENCES smn_salud.smn_planes (smn_planes_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_balance_capacidad ADD PRIMARY KEY (smn_balance_capacidad_id);

ALTER TABLE smn_salud.smn_balance_citas_agenda ADD PRIMARY KEY (smn_balance_citas_agenda_id);

ALTER TABLE smn_salud.smn_balance_citas_contratante ADD PRIMARY KEY (smn_balance_citas_contratante_id);

ALTER TABLE smn_salud.smn_series ADD PRIMARY KEY (smn_series_id);

ALTER TABLE smn_salud.smn_campos_visualizacion_monitores_dispositivos ADD PRIMARY KEY (smn_campos_vis_mon_dis_id);
ALTER TABLE smn_salud.smn_campos_visualizacion_monitores_dispositivos ADD CONSTRAINT FK_smn_campos_visualizacion_monitores_dispositivos_0 FOREIGN KEY (smn_series_id) REFERENCES smn_salud.smn_series (smn_series_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_capacidades_unidad ADD PRIMARY KEY (smn_capacidades_id);

ALTER TABLE smn_salud.smn_cargos_automaticos ADD PRIMARY KEY (smn_cargos_automaticos_id);

ALTER TABLE smn_salud.smn_citas ADD PRIMARY KEY (smn_citas_id);

ALTER TABLE smn_salud.smn_citas_mov ADD PRIMARY KEY (smn_citas_mov_id);

ALTER TABLE smn_salud.smn_citas_servicios ADD PRIMARY KEY (smn_citas_servicios_id);

ALTER TABLE smn_salud.smn_cobertura_admision ADD PRIMARY KEY (smn_cobertura_admision_id);

ALTER TABLE smn_salud.smn_coberturas ADD PRIMARY KEY (smn_coberturas_id);

ALTER TABLE smn_salud.smn_unidades_servicios ADD PRIMARY KEY (smn_unidades_servicios_id);

ALTER TABLE smn_salud.smn_coberturas_servicios ADD PRIMARY KEY (smn_coberturas_servicios_id);
ALTER TABLE smn_salud.smn_coberturas_servicios ADD CONSTRAINT FK_smn_coberturas_servicios_0 FOREIGN KEY (smn_unidades_servicios_id) REFERENCES smn_salud.smn_unidades_servicios (smn_unidades_servicios_id) ON DELETE NO ACTION;
ALTER TABLE smn_salud.smn_coberturas_servicios ADD CONSTRAINT FK_smn_coberturas_servicios_1 FOREIGN KEY (smn_coberturas_id) REFERENCES smn_salud.smn_coberturas (smn_coberturas_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_contratante ADD PRIMARY KEY (smn_contratante_id);

ALTER TABLE smn_salud.smn_diagnostico ADD PRIMARY KEY (smn_diagnostico_id);

ALTER TABLE smn_salud.smn_dispositivos ADD PRIMARY KEY (smn_dispositivos_id);

ALTER TABLE smn_salud.smn_documento ADD PRIMARY KEY (smn_documento_id);

ALTER TABLE smn_salud.smn_tipo_documento_afiliado ADD PRIMARY KEY (smn_tipo_documento_afiliado_id);

ALTER TABLE smn_salud.smn_documento_afiliados ADD PRIMARY KEY (smn_documento_afiliados_id);
ALTER TABLE smn_salud.smn_documento_afiliados ADD CONSTRAINT FK_smn_documento_afiliados_0 FOREIGN KEY (smn_tipo_documento_afiliado_id) REFERENCES smn_salud.smn_tipo_documento_afiliado (smn_tipo_documento_afiliado_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_estado_presupuesto ADD PRIMARY KEY (smn_estado_presupuesto_id);

ALTER TABLE smn_salud.smn_estatus ADD PRIMARY KEY (smn_estatus_id);

ALTER TABLE smn_salud.smn_estatus_citas ADD PRIMARY KEY (smn_estatus_citas_id);

ALTER TABLE smn_salud.smn_habitaciones ADD PRIMARY KEY (smn_habitaciones_id);

ALTER TABLE smn_salud.smn_habitaciones_disponibles ADD PRIMARY KEY (smn_habitaciones_disponibles_id);

ALTER TABLE smn_salud.smn_historia_medica ADD PRIMARY KEY (smn_historia_medica_id);

ALTER TABLE smn_salud.smn_horario ADD PRIMARY KEY (smn_horarios_id);

ALTER TABLE smn_salud.smn_ingreso_cola_virtual ADD PRIMARY KEY (smn_ingreso_cola_virtual_id);

ALTER TABLE smn_salud.smn_ingresos_old ADD PRIMARY KEY (smn_ingresos_id);

ALTER TABLE smn_salud.smn_ingresos_servicios ADD PRIMARY KEY (smn_ingresos_servicios_id);

ALTER TABLE smn_salud.smn_localidad ADD PRIMARY KEY (smn_localidad_id);

ALTER TABLE smn_salud.smn_sector ADD PRIMARY KEY (smn_sector_id);

ALTER TABLE smn_salud.smn_localidad_sector ADD PRIMARY KEY (smn_rel_local_sector_id);
ALTER TABLE smn_salud.smn_localidad_sector ADD CONSTRAINT FK_smn_localidad_sector_0 FOREIGN KEY (smn_sector_id) REFERENCES smn_salud.smn_sector (smn_sector_id) ON DELETE NO ACTION;
ALTER TABLE smn_salud.smn_localidad_sector ADD CONSTRAINT FK_smn_localidad_sector_1 FOREIGN KEY (smn_localidad_id) REFERENCES smn_salud.smn_localidad (smn_localidad_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_motivos ADD PRIMARY KEY (smn_motivos_id);

ALTER TABLE smn_salud.smn_naturaleza_servicio ADD PRIMARY KEY (smn_naturaleza_servicio_id);

ALTER TABLE smn_salud.smn_no_registrados ADD PRIMARY KEY (smn_no_registrados_id);

ALTER TABLE smn_salud.smn_observaciones ADD PRIMARY KEY (smn_observaciones_id);

ALTER TABLE smn_salud.smn_ordenes_medicas ADD PRIMARY KEY (smn_ordenes_medicas_id);

ALTER TABLE smn_salud.smn_origen ADD PRIMARY KEY (smn_origen_id);

ALTER TABLE smn_salud.smn_planes_coberturas ADD PRIMARY KEY (smn_planes_coberturas_id);
ALTER TABLE smn_salud.smn_planes_coberturas ADD CONSTRAINT FK_smn_planes_coberturas_0 FOREIGN KEY (smn_planes_id) REFERENCES smn_salud.smn_planes (smn_planes_id) ON DELETE NO ACTION;
ALTER TABLE smn_salud.smn_planes_coberturas ADD CONSTRAINT FK_smn_planes_coberturas_1 FOREIGN KEY (smn_coberturas_id) REFERENCES smn_salud.smn_coberturas (smn_coberturas_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_presupuesto ADD PRIMARY KEY (smn_presupuesto_id);

ALTER TABLE smn_salud.smn_presupuesto_componente ADD PRIMARY KEY (smn_presupuesto_componente_id);

ALTER TABLE smn_salud.smn_presupuesto_detalle ADD PRIMARY KEY (smn_presupuesto_detalle_id);

ALTER TABLE smn_salud.smn_rel_cobertura_horario ADD PRIMARY KEY (smn_rel_cobertura_horario_id);
ALTER TABLE smn_salud.smn_rel_cobertura_horario ADD CONSTRAINT FK_smn_rel_cobertura_horario_0 FOREIGN KEY (smn_coberturas_id) REFERENCES smn_salud.smn_coberturas (smn_coberturas_id) ON DELETE NO ACTION;
ALTER TABLE smn_salud.smn_rel_cobertura_horario ADD CONSTRAINT FK_smn_rel_cobertura_horario_1 FOREIGN KEY (smn_horarios_id) REFERENCES smn_salud.smn_horario (smn_horarios_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_rel_cobertura_localidad ADD PRIMARY KEY (smn_rel_cobertura_local_id);
ALTER TABLE smn_salud.smn_rel_cobertura_localidad ADD CONSTRAINT FK_smn_rel_cobertura_localidad_0 FOREIGN KEY (smn_localidad_id) REFERENCES smn_salud.smn_localidad (smn_localidad_id) ON DELETE NO ACTION;
ALTER TABLE smn_salud.smn_rel_cobertura_localidad ADD CONSTRAINT FK_smn_rel_cobertura_localidad_1 FOREIGN KEY (smn_coberturas_id) REFERENCES smn_salud.smn_coberturas (smn_coberturas_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_rel_coberturas_unidades_servicios ADD PRIMARY KEY (smn_rel_coberturas_unidades_servicios_id);

ALTER TABLE smn_salud.smn_rel_patologia_item ADD PRIMARY KEY (smn_rel_patologia_item_id);

ALTER TABLE smn_salud.smn_rel_patologia_servicios ADD PRIMARY KEY (smn_rel_patologia_servicios_id);

ALTER TABLE smn_salud.smn_rel_plan_contrato ADD PRIMARY KEY (smn_rel_plan_contrato_modulo_id);
ALTER TABLE smn_salud.smn_rel_plan_contrato ADD CONSTRAINT FK_smn_rel_plan_contrato_0 FOREIGN KEY (smn_planes_id) REFERENCES smn_salud.smn_planes (smn_planes_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_rel_planes_coberturas ADD PRIMARY KEY (smn_rel_planes_coberturas_id);

ALTER TABLE smn_salud.smn_rel_usuarios_entidad ADD PRIMARY KEY (smn_rel_usuario_entidad_id);

ALTER TABLE smn_salud.smn_relacion_area_series ADD PRIMARY KEY (smn_rel_area_serie_id);
ALTER TABLE smn_salud.smn_relacion_area_series ADD CONSTRAINT FK_smn_relacion_area_series_0 FOREIGN KEY (smn_series_id) REFERENCES smn_salud.smn_series (smn_series_id) ON DELETE CASCADE;

ALTER TABLE smn_salud.smn_tramos ADD PRIMARY KEY (smn_tramos_id);

ALTER TABLE smn_salud.smn_relacion_horario_tramos ADD PRIMARY KEY (smn_rel_horario_tramo_id);
ALTER TABLE smn_salud.smn_relacion_horario_tramos ADD CONSTRAINT FK_smn_relacion_horario_tramos_0 FOREIGN KEY (smn_tramos_id) REFERENCES smn_salud.smn_tramos (smn_tramos_id) ON DELETE NO ACTION;
ALTER TABLE smn_salud.smn_relacion_horario_tramos ADD CONSTRAINT FK_smn_relacion_horario_tramos_1 FOREIGN KEY (smn_horarios_id) REFERENCES smn_salud.smn_horario (smn_horarios_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_relacion_paciente_secuencia ADD PRIMARY KEY (smn_rel_paciente_secuencia_id);

ALTER TABLE smn_salud.smn_relacion_unidad_paso ADD PRIMARY KEY (smn_rel_unidad_paso);

ALTER TABLE smn_salud.smn_relacion_unidades_series ADD PRIMARY KEY (smn_relacion_unidades_series_id);

ALTER TABLE smn_salud.smn_relacionados ADD PRIMARY KEY (smn_relacionado_id);

ALTER TABLE smn_salud.smn_reposos_constancias ADD PRIMARY KEY (smn_reposos_constancias_id);

ALTER TABLE smn_salud.smn_rol ADD PRIMARY KEY (smn_rol_id);

ALTER TABLE smn_salud.smn_ruta_paciente_old ADD PRIMARY KEY (smn_ruta_id);

ALTER TABLE smn_salud.smn_salud_plantilla_cabecera ADD PRIMARY KEY (smn_salud_plantilla_cabecera_id);

ALTER TABLE smn_salud.smn_salud_plantilla_detalle ADD PRIMARY KEY (smn_salud_plantilla_detalle_id);
ALTER TABLE smn_salud.smn_salud_plantilla_detalle ADD CONSTRAINT FK_smn_salud_plantilla_detalle_0 FOREIGN KEY (smn_salud_plantilla_cabecera_id) REFERENCES smn_salud.smn_salud_plantilla_cabecera (smn_salud_plantilla_cabecera_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_seguimiento ADD PRIMARY KEY (smn_seguimiento_id);

ALTER TABLE smn_salud.smn_sintoma ADD PRIMARY KEY (smn_sintoma_id);

ALTER TABLE smn_salud.smn_solicitud_presupuesto ADD PRIMARY KEY (smn_solicitud_presupuesto_id);

ALTER TABLE smn_salud.smn_tipo_coberturas ADD PRIMARY KEY (smn_tipo_coberturas_id);

ALTER TABLE smn_salud.smn_tipo_consulta ADD PRIMARY KEY (smn_tipo_consulta_id);

ALTER TABLE smn_salud.smn_tipo_documento ADD PRIMARY KEY (smn_tipo_documento_id);

ALTER TABLE smn_salud.smn_tramos_descanso ADD PRIMARY KEY (smn_tramo_descanso_id);

ALTER TABLE smn_salud.smn_acciones ADD PRIMARY KEY (smn_acciones_id);

ALTER TABLE smn_salud.smn_rel_documentos_servicios ADD PRIMARY KEY (smn_rel_documentos_servicios_id);

ALTER TABLE smn_salud.smn_rel_tipodoc_patologia ADD PRIMARY KEY (smn_rel_tipodoc_patologia_id);

ALTER TABLE smn_salud.smn_puesto_atencion ADD PRIMARY KEY (smn_puesto_atencion_id);

ALTER TABLE smn_salud.smn_marca_comercial ADD PRIMARY KEY (smn_marca_comercial_id);

ALTER TABLE smn_salud.smn_rel_orden_medica_servicios ADD PRIMARY KEY (smn_rel_orden_medica_servicios_id);

ALTER TABLE smn_salud.smn_control_quirofano ADD PRIMARY KEY (smn_control_quirofano_id);

ALTER TABLE smn_salud.smn_rel_control_quirofano_prestador ADD PRIMARY KEY (smn_rel_control_quirofano_prestador_id);
ALTER TABLE smn_salud.smn_rel_control_quirofano_prestador ADD CONSTRAINT FK_smn_rel_control_quirofano_prestador_0 FOREIGN KEY (smn_control_quirofano_id) REFERENCES smn_salud.smn_control_quirofano (smn_control_quirofano_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_plan_quirurgico ADD PRIMARY KEY (smn_plan_quirurgico_id);

ALTER TABLE smn_salud.smn_rel_plan_quirurgico_prestador ADD PRIMARY KEY (smn_rel_plan_quirurgico_prestador_id);
ALTER TABLE smn_salud.smn_rel_plan_quirurgico_prestador ADD CONSTRAINT FK_smn_rel_plan_quirurgico_prestador_0 FOREIGN KEY (smn_plan_quirurgico_id) REFERENCES smn_salud.smn_plan_quirurgico (smn_plan_quirurgico_id) ON DELETE NO ACTION;

