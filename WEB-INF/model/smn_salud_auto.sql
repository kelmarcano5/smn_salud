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
  afi_numero_control INTEGER NOT NULL,
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
  pla_modelo_contrato INTEGER,
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


CREATE TABLE smn_salud.smn_agenda(
  smn_agenda_id INTEGER NOT NULL,
  smn_citas_id INTEGER NOT NULL,
  smn_ingreso_id INTEGER NOT NULL,
  smn_entidades_rf INTEGER NOT NULL,
  smn_sucursales_rf INTEGER NOT NULL,
  smn_areas_servicios_rf INTEGER NOT NULL,
  smn_unidades_servicios_rf INTEGER NOT NULL,
  smn_grupo_prestador_servicio_rf INTEGER NOT NULL,
  smn_prestador_servicio_rf INTEGER NOT NULL,
  smn_servicios_rf INTEGER NOT NULL,
  age_fecha DATE NOT NULL,
  age_turno CHARACTER(1) NOT NULL,
  age_hora_agendado CHARACTER(8) NOT NULL,
  smn_estatus_citas_id INTEGER NOT NULL,
  age_idioma CHARACTER(2) NOT NULL,
  age_usuario VARCHAR(10) NOT NULL,
  age_fecha_registro DATE NOT NULL,
  age_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_agenda;


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
  bca_usuario INTEGER NOT NULL,
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
  bcc_disponibilidad_citas_cont INTEGER NOT NULL,
  bcc_cant_citas_anul INTEGER,
  bcc_cant_citas_otor INTEGER,
  bcc_saldo INTEGER NOT NULL,
  bcc_idioma INTEGER NOT NULL,
  bcc_usuario INTEGER NOT NULL,
  bcc_fecha_registro INTEGER NOT NULL,
  bcc_hora INTEGER NOT NULL
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
  ctm_hora CHARACTER(8) NOT NULL
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
  cap_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_capacidades_unidad;


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
  smn_sintoma_id INTEGER NOT NULL,
  cts_tipo_orden CHARACTER(3) NOT NULL,
  cts_num_orden_medica INTEGER,
  smn_entidades_rf INTEGER NOT NULL,
  smn_sucursales_rf INTEGER NOT NULL,
  smn_areas_servicios_rf INTEGER NOT NULL,
  smn_unidades_servicios_rf INTEGER NOT NULL,
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


CREATE TABLE smn_salud.smn_coberturas(
  smn_coberturas_id INTEGER NOT NULL,
  cob_codigo VARCHAR(16) NOT NULL,
  cob_descripcion VARCHAR(56) NOT NULL,
  cob_descuento DOUBLE PRECISION NOT NULL,
  cob_tiempo_servicio INTEGER NOT NULL,
  cob_unidad_tiempo_rf INTEGER NOT NULL,
  cob_deducible DOUBLE PRECISION NOT NULL,
  cob_time_desp_afil INTEGER NOT NULL,
  cob_otros_centros CHARACTER(1) NOT NULL,
  cob_cantidad_servicio INTEGER NOT NULL,
  cob_vigencia_desde DATE NOT NULL,
  cob_vigencia_hasta DATE NOT NULL,
  cob_cobertura_desde DOUBLE PRECISION NOT NULL,
  cob_cobertura_hasta DOUBLE PRECISION NOT NULL,
  cob_deducible_centro DOUBLE PRECISION NOT NULL,
  cob_porc_deducible DOUBLE PRECISION NOT NULL,
  cob_idioma CHARACTER(2) NOT NULL,
  cob_usuario VARCHAR(10) NOT NULL,
  cob_fecha_registro DATE NOT NULL,
  cob_hora CHARACTER(8) NOT NULL
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
  smn_clase_auxiliar_rf INTEGER NOT NULL,
  smn_auxiliar_rf INTEGER NOT NULL,
  smn_plan_id INTEGER NOT NULL,
  cnt_fecha_de_inicio DATE NOT NULL,
  cnt_cantidad_citas INTEGER,
  cnt_idioma CHARACTER(2) NOT NULL,
  cnt_usuario_id VARCHAR(10) NOT NULL,
  cnt_fecha_registro DATE NOT NULL,
  cnt_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_contratante;


CREATE TABLE smn_salud.smn_contrato_modulo(
  smn_contrato_modulo_id INTEGER NOT NULL,
  smn_contrato_base_rf INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  ctm_dia_factura INTEGER NOT NULL,
  ctm_cantidad INTEGER NOT NULL,
  ctm_precio DOUBLE PRECISION,
  ctm_monto DOUBLE PRECISION,
  ctm_porcentaje_incremento DOUBLE PRECISION,
  ctm_direccion_rf INTEGER NOT NULL,
  ctm_fecha_renovacion DATE,
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
  doc_maneja_moneda_alt CHARACTER(2) NOT NULL
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
  smn_servicio_rf INTEGER,
  smn_componente_rf INTEGER,
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
  igs_monto_moneda_alterna INTEGER,
  smn_sintoma_id INTEGER NOT NULL,
  igs_estatus_financiero CHARACTER(2) NOT NULL,
  igs_idioma CHARACTER(2) NOT NULL,
  igs_usuario VARCHAR(10) NOT NULL,
  igs_fecha_registro DATE NOT NULL,
  igs_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_ingresos;


CREATE TABLE smn_salud.smn_ingresos_mov(
  smn_ingresos_mov_id INTEGER NOT NULL,
  inm_fecha DATE NOT NULL,
  inm_localidad VARCHAR(56) NOT NULL,
  inm_servicio INTEGER NOT NULL,
  inm_componente INTEGER NOT NULL,
  inm_prestador_servicio INTEGER NOT NULL,
  inm_tipo_componente INTEGER,
  inm_estatus INTEGER NOT NULL,
  inm_observ_ingreso INTEGER NOT NULL,
  smn_diagnostico_id INTEGER,
  inm_idioma CHARACTER(2) NOT NULL,
  inm_usuario VARCHAR(10) NOT NULL,
  inm_fecha_registro DATE NOT NULL,
  inm_hora CHARACTER(8) NOT NULL,
  smn_ingresos_id INTEGER
);

CREATE SEQUENCE smn_salud.seq_smn_ingresos_mov;


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
  omd_numero_orden VARCHAR(16) NOT NULL,
  omd_descripcion VARCHAR(256) NOT NULL,
  omd_clase_auxiliar INTEGER,
  omd_auxiliar INTEGER,
  omd_num_doc_oficial CHARACTER(12) NOT NULL,
  omd_tipo_orden CHARACTER(2) NOT NULL,
  omd_idioma CHARACTER(2) NOT NULL,
  omd_usuario VARCHAR(10) NOT NULL,
  omd_fecha_registro DATE NOT NULL,
  omd_hora CHARACTER(8) NOT NULL
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


CREATE TABLE smn_salud.smn_prestacion_servicio_medico_cabecera(
  smn_prestacion_servicio_medico_cabecera_id INTEGER NOT NULL,
  smn_ingresos_id INTEGER NOT NULL,
  smn_mov_caja_cabecera_id INTEGER NOT NULL,
  smn_unidades_servicios_rf INTEGER NOT NULL,
  psc_estatus CHARACTER(2) NOT NULL,
  psc_idioma CHARACTER(2) NOT NULL,
  psc_usuario VARCHAR(10) NOT NULL,
  psc_fecha_registro DATE NOT NULL,
  psc_hora CHARACTER(8) NOT NULL,
  psc_estatus_financiero CHARACTER(2) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_prestacion_servicio_medico_cabecera;


CREATE TABLE smn_salud.smn_prestacion_servicio_medico_detalle(
  smn_prestacion_servicio_medico_detalle_id INTEGER NOT NULL,
  smn_prestacion_servicio_medico_cabecera_id INTEGER NOT NULL,
  smn_mov_caja_detalle_id INTEGER NOT NULL,
  smn_ingresos_mov_id INTEGER NOT NULL,
  smn_unidades_servicios_rf INTEGER NOT NULL,
  smn_almacen_rf INTEGER,
  smn_servicios_rf INTEGER,
  psd_tipo_componentes CHARACTER(2) NOT NULL,
  smn_componentes_rf INTEGER NOT NULL,
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
  psd_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_prestacion_servicio_medico_detalle;


CREATE TABLE smn_salud.smn_presupuesto(
  smn_presupuesto_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  pre_numero_control SERIAL NOT NULL,
  smn_entidades_rf INTEGER NOT NULL,
  smn_sucursales_rf INTEGER NOT NULL,
  smn_clase_auxiliar_rf INTEGER NOT NULL,
  smn_auxiliar_rf INTEGER NOT NULL,
  smn_clase_ord_rf INTEGER NOT NULL,
  smn_auxiliar_ord_rf INTEGER NOT NULL,
  smn_baremo_rf INTEGER NOT NULL,
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
  pre_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_presupuesto;


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
  prd_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_presupuesto_detalle;


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


CREATE TABLE smn_salud.smn_rel_ingreso_mov_examenes(
  smn_rel_ingreso_mov_examenes_id INTEGER NOT NULL,
  smn_ingresos_mov_id INTEGER NOT NULL,
  smn_servicios_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_rel_ingreso_mov_examenes;


CREATE TABLE smn_salud.smn_rel_plan_contrato(
  smn_rel_plan_contrato_modulo_id INTEGER NOT NULL,
  smn_planes_id INTEGER NOT NULL,
  smn_contrato_modulo_id INTEGER NOT NULL,
  rpc_vigencia CHARACTER(1) NOT NULL,
  rpc_fecha_vigencia DATE NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_rel_plan_contrato;


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
  rup_hora CHARACTER(8) NOT NULL
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
  smn_afiliados_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  rel_numero_control INTEGER NOT NULL,
  smn_clase_rf INTEGER NOT NULL,
  smn_auxiliar_rf INTEGER NOT NULL,
  smn_parentesco_rf INTEGER NOT NULL,
  smn_numero_hijo INTEGER NOT NULL,
  rel_idioma CHARACTER(2) NOT NULL,
  rel_usuario_id VARCHAR(10) NOT NULL,
  rel_fecha_registro DATE NOT NULL,
  rel_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_salud.seq_smn_relacionados;


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
  rta_numero_documento_identidad CHARACTER(20) NOT NULL,
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
  rta_hora_salida_unidad TIME
);

CREATE SEQUENCE smn_salud.seq_smn_ruta_paciente;


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



ALTER TABLE smn_salud.aad_estado_presupuesto ADD PRIMARY KEY (smn_estado_presupuesto_id);

ALTER TABLE smn_salud.smn_afiliado_titular ADD PRIMARY KEY (smn_afiliados_id);

ALTER TABLE smn_salud.smn_planes ADD PRIMARY KEY (smn_planes_id);

ALTER TABLE smn_salud.smn_afiliados_planes ADD PRIMARY KEY (smn_afiliados_planes_id);
ALTER TABLE smn_salud.smn_afiliados_planes ADD CONSTRAINT FK_smn_afiliados_planes_0 FOREIGN KEY (smn_planes_id) REFERENCES smn_salud.smn_planes (smn_planes_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_agenda ADD PRIMARY KEY (smn_agenda_id);

ALTER TABLE smn_salud.smn_balance_capacidad ADD PRIMARY KEY (smn_balance_capacidad_id);

ALTER TABLE smn_salud.smn_balance_citas_agenda ADD PRIMARY KEY (smn_balance_citas_agenda_id);

ALTER TABLE smn_salud.smn_balance_citas_contratante ADD PRIMARY KEY (smn_balance_citas_contratante_id);

ALTER TABLE smn_salud.smn_series ADD PRIMARY KEY (smn_series_id);

ALTER TABLE smn_salud.smn_campos_visualizacion_monitores_dispositivos ADD PRIMARY KEY (smn_campos_vis_mon_dis_id);
ALTER TABLE smn_salud.smn_campos_visualizacion_monitores_dispositivos ADD CONSTRAINT FK_smn_campos_visualizacion_monitores_dispositivos_0 FOREIGN KEY (smn_series_id) REFERENCES smn_salud.smn_series (smn_series_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_capacidades_unidad ADD PRIMARY KEY (smn_capacidades_id);

ALTER TABLE smn_salud.smn_citas ADD PRIMARY KEY (smn_citas_id);

ALTER TABLE smn_salud.smn_citas_mov ADD PRIMARY KEY (smn_citas_mov_id);

ALTER TABLE smn_salud.smn_citas_servicios ADD PRIMARY KEY (smn_citas_servicios_id);

ALTER TABLE smn_salud.smn_coberturas ADD PRIMARY KEY (smn_coberturas_id);

ALTER TABLE smn_salud.smn_unidades_servicios ADD PRIMARY KEY (smn_unidades_servicios_id);

ALTER TABLE smn_salud.smn_coberturas_servicios ADD PRIMARY KEY (smn_coberturas_servicios_id);
ALTER TABLE smn_salud.smn_coberturas_servicios ADD CONSTRAINT FK_smn_coberturas_servicios_0 FOREIGN KEY (smn_unidades_servicios_id) REFERENCES smn_salud.smn_unidades_servicios (smn_unidades_servicios_id) ON DELETE NO ACTION;
ALTER TABLE smn_salud.smn_coberturas_servicios ADD CONSTRAINT FK_smn_coberturas_servicios_1 FOREIGN KEY (smn_coberturas_id) REFERENCES smn_salud.smn_coberturas (smn_coberturas_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_contratante ADD PRIMARY KEY (smn_contratante_id);

ALTER TABLE smn_salud.smn_contrato_modulo ADD PRIMARY KEY (smn_contrato_modulo_id);

ALTER TABLE smn_salud.smn_diagnostico ADD PRIMARY KEY (smn_diagnostico_id);

ALTER TABLE smn_salud.smn_dispositivos ADD PRIMARY KEY (smn_dispositivos_id);

ALTER TABLE smn_salud.smn_documento ADD PRIMARY KEY (smn_documento_id);

ALTER TABLE smn_salud.smn_tipo_documento_afiliado ADD PRIMARY KEY (smn_tipo_documento_afiliado_id);

ALTER TABLE smn_salud.smn_documento_afiliados ADD PRIMARY KEY (smn_documento_afiliados_id);
ALTER TABLE smn_salud.smn_documento_afiliados ADD CONSTRAINT FK_smn_documento_afiliados_0 FOREIGN KEY (smn_tipo_documento_afiliado_id) REFERENCES smn_salud.smn_tipo_documento_afiliado (smn_tipo_documento_afiliado_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_estatus_citas ADD PRIMARY KEY (smn_estatus_citas_id);

ALTER TABLE smn_salud.smn_horario ADD PRIMARY KEY (smn_horarios_id);

ALTER TABLE smn_salud.smn_ingreso_cola_virtual ADD PRIMARY KEY (smn_ingreso_cola_virtual_id);

ALTER TABLE smn_salud.smn_ingreso_movimiento ADD PRIMARY KEY (smn_ingresos_mov_id);

ALTER TABLE smn_salud.smn_ingresos ADD PRIMARY KEY (smn_ingresos_id);

ALTER TABLE smn_salud.smn_ingresos_servicios ADD PRIMARY KEY (smn_ingresos_servicios_id);

ALTER TABLE smn_salud.smn_localidad ADD PRIMARY KEY (smn_localidad_id);

ALTER TABLE smn_salud.smn_sector ADD PRIMARY KEY (smn_sector_id);

ALTER TABLE smn_salud.smn_localidad_sector ADD PRIMARY KEY (smn_rel_local_sector_id);
ALTER TABLE smn_salud.smn_localidad_sector ADD CONSTRAINT FK_smn_localidad_sector_0 FOREIGN KEY (smn_sector_id) REFERENCES smn_salud.smn_sector (smn_sector_id) ON DELETE NO ACTION;
ALTER TABLE smn_salud.smn_localidad_sector ADD CONSTRAINT FK_smn_localidad_sector_1 FOREIGN KEY (smn_localidad_id) REFERENCES smn_salud.smn_localidad (smn_localidad_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_motivos ADD PRIMARY KEY (smn_motivos_id);

ALTER TABLE smn_salud.smn_no_registrados ADD PRIMARY KEY (smn_no_registrados_id);

ALTER TABLE smn_salud.smn_observaciones ADD PRIMARY KEY (smn_observaciones_id);

ALTER TABLE smn_salud.smn_ordenes_medicas ADD PRIMARY KEY (smn_ordenes_medicas_id);

ALTER TABLE smn_salud.smn_origen ADD PRIMARY KEY (smn_origen_id);

ALTER TABLE smn_salud.smn_planes_coberturas ADD PRIMARY KEY (smn_planes_coberturas_id);
ALTER TABLE smn_salud.smn_planes_coberturas ADD CONSTRAINT FK_smn_planes_coberturas_0 FOREIGN KEY (smn_planes_id) REFERENCES smn_salud.smn_planes (smn_planes_id) ON DELETE NO ACTION;
ALTER TABLE smn_salud.smn_planes_coberturas ADD CONSTRAINT FK_smn_planes_coberturas_1 FOREIGN KEY (smn_coberturas_id) REFERENCES smn_salud.smn_coberturas (smn_coberturas_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_planificacion_de_turno ADD PRIMARY KEY (smn_plan_turno_id);

ALTER TABLE smn_salud.smn_prestacion_servicio_medico_cabecera ADD PRIMARY KEY (smn_prestacion_servicio_medico_cabecera_id);

ALTER TABLE smn_salud.smn_prestacion_servicio_medico_detalle ADD PRIMARY KEY (smn_prestacion_servicio_medico_detalle_id);

ALTER TABLE smn_salud.smn_presupuesto ADD PRIMARY KEY (smn_presupuesto_id);

ALTER TABLE smn_salud.smn_presupuesto_detalle ADD PRIMARY KEY (smn_presupuesto_detalle_id);

ALTER TABLE smn_salud.smn_rel_cobertura_horario ADD PRIMARY KEY (smn_rel_cobertura_horario_id);
ALTER TABLE smn_salud.smn_rel_cobertura_horario ADD CONSTRAINT FK_smn_rel_cobertura_horario_0 FOREIGN KEY (smn_coberturas_id) REFERENCES smn_salud.smn_coberturas (smn_coberturas_id) ON DELETE NO ACTION;
ALTER TABLE smn_salud.smn_rel_cobertura_horario ADD CONSTRAINT FK_smn_rel_cobertura_horario_1 FOREIGN KEY (smn_horarios_id) REFERENCES smn_salud.smn_horario (smn_horarios_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_rel_cobertura_localidad ADD PRIMARY KEY (smn_rel_cobertura_local_id);
ALTER TABLE smn_salud.smn_rel_cobertura_localidad ADD CONSTRAINT FK_smn_rel_cobertura_localidad_0 FOREIGN KEY (smn_localidad_id) REFERENCES smn_salud.smn_localidad (smn_localidad_id) ON DELETE NO ACTION;
ALTER TABLE smn_salud.smn_rel_cobertura_localidad ADD CONSTRAINT FK_smn_rel_cobertura_localidad_1 FOREIGN KEY (smn_coberturas_id) REFERENCES smn_salud.smn_coberturas (smn_coberturas_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_rel_plan_contrato ADD PRIMARY KEY (smn_rel_plan_contrato_modulo_id);
ALTER TABLE smn_salud.smn_rel_plan_contrato ADD CONSTRAINT FK_smn_rel_plan_contrato_0 FOREIGN KEY (smn_contrato_modulo_id) REFERENCES smn_salud.smn_contrato_modulo (smn_contrato_modulo_id) ON DELETE NO ACTION;
ALTER TABLE smn_salud.smn_rel_plan_contrato ADD CONSTRAINT FK_smn_rel_plan_contrato_1 FOREIGN KEY (smn_planes_id) REFERENCES smn_salud.smn_planes (smn_planes_id) ON DELETE NO ACTION;

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

ALTER TABLE smn_salud.smn_rol ADD PRIMARY KEY (smn_rol_id);

ALTER TABLE smn_salud.smn_ruta_paciente ADD PRIMARY KEY (smn_ruta_id);

ALTER TABLE smn_salud.smn_sintoma ADD PRIMARY KEY (smn_sintoma_id);

ALTER TABLE smn_salud.smn_tipo_coberturas ADD PRIMARY KEY (smn_tipo_coberturas_id);

ALTER TABLE smn_salud.smn_tipo_consulta ADD PRIMARY KEY (smn_tipo_consulta_id);

ALTER TABLE smn_salud.smn_tipo_documento ADD PRIMARY KEY (smn_tipo_documento_id);

ALTER TABLE smn_salud.smn_tramos_descanso ADD PRIMARY KEY (smn_tramo_descanso_id);

