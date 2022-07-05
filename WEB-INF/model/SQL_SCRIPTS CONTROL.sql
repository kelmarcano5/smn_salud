CREATE TABLE smn_salud.smn_control_quirofano(
  smn_control_quirofano_id INTEGER NOT NULL,
  smn_agenda_rf INTEGER NOT NULL,
  smn_presupuesto_id INTEGER,
  smn_ingreso_id INTEGER NOT NULL,
  smn_prestacion_servicio_cabecera_id INTEGER NOT NULL,
  smn_prestacion_servicio_medico_detalle_id INTEGER NOT NULL,
  smn_servicios_rf INTEGER NOT NULL,
  ccq_hora_entrada CHARACTER(8),
  ccq_hora_salida CHARACTER(8),
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
ALTER TABLE smn_salud.smn_control_quirofano ADD PRIMARY KEY (smn_control_quirofano_id);

ALTER TABLE smn_salud.smn_rel_control_quirofano_prestador ADD PRIMARY KEY (smn_rel_control_quirofano_prestador_id);
ALTER TABLE smn_salud.smn_rel_control_quirofano_prestador ADD CONSTRAINT FK_smn_rel_control_quirofano_prestador_0 FOREIGN KEY (smn_control_quirofano_id) REFERENCES smn_salud.smn_control_quirofano (smn_control_quirofano_id) ON DELETE NO ACTION;

ALTER TABLE smn_salud.smn_plan_quirurgico ADD PRIMARY KEY (smn_plan_quirurgico_id);

ALTER TABLE smn_salud.smn_rel_plan_quirurgico_prestador ADD PRIMARY KEY (smn_rel_plan_quirurgico_prestador_id);
ALTER TABLE smn_salud.smn_rel_plan_quirurgico_prestador ADD CONSTRAINT FK_smn_rel_plan_quirurgico_prestador_0 FOREIGN KEY (smn_plan_quirurgico_id) REFERENCES smn_salud.smn_plan_quirurgico (smn_plan_quirurgico_id) ON DELETE NO ACTION;
