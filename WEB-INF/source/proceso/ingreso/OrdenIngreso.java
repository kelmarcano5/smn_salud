package proceso.ingreso;

import java.text.SimpleDateFormat;
import java.util.Date;

import dinamica.Db;
import dinamica.GenericTransaction;
import dinamica.Recordset;
import dinamica.RecordsetException;
import proceso.util.StringBuilderPlus;
import proceso.util.TRANSACTION;

public class OrdenIngreso extends GenericTransaction {

	private Db db;
	private String _logFile;
	private StringBuilderPlus message;
	private OrdenIngresoResultado ordenIngresoResultado;
	private int rcInserted;
	private int rcUpdated;
	@SuppressWarnings("unused")
	private int rcDeleted;

	public OrdenIngreso() {
		String fechaActual = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		this._logFile = "log_orden_ingreso".concat(fechaActual).concat(".txt");
		this.message = new StringBuilderPlus();
		this.ordenIngresoResultado = new OrdenIngresoResultado();
		this.rcInserted = 0;
		this.rcUpdated = 0;
		this.rcDeleted = 0;
	}

	public int service(Recordset inputParams) throws Throwable {

		/* Estatus inicial: EN_PROCESO */
		IntegracionResultado status = IntegracionResultado.EN_PROCESO;

		message.activateLogFile(_logFile);
		message.activateUploadMessageRequest(getRequest());

		String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		Boolean procesamientoCaja = Boolean.TRUE;

		Recordset rsIntegracionTercero = crearRecordsetIntegracionProveedor();

		/* Inicio proceso */
		message.appendLine("----- Orden de Ingreso -----");
		this.db = getDb();

		/* Verificar si el estatus financiero del ingreso es pendiente */
		Recordset rsIngreso = db.get(getSQL(getResource("consultar-estatus-financiero.sql"), inputParams));
		if (rsIngreso.getRecordCount() > 0) {

			message.append("El ID = ");
			message.append(String.valueOf(inputParams.getInt("id_ingreso")));
			message.appendLine(" del status financiero está Pendiente. Se pueden procesar servicios...");

			/* Verificar si se tiene registros en el movimiento del ingreso a procesar */
			Recordset rsIngresoMovimiento = db.get(getSQL(getResource("consultar-ingreso-movimiento.sql"), inputParams));
			if (rsIngresoMovimiento.getRecordCount() > 0) {
				
				/* Almacenar el registro de trazabilidad de la integración con InfoLab/Ris */
				rsIntegracionTercero.setValue("smn_ingresos_id", inputParams.getInt("id_ingreso"));
				rsIntegracionTercero.setValue("smn_servicios_id", rsIngresoMovimiento.getInt("smn_servicios_rf"));
				rsIntegracionTercero.setValue("smn_componentes_id", rsIngresoMovimiento.getInt("smn_servicios_rf"));
				rsIntegracionTercero.setValue("int_estatus_transaccion", 1); // 1: PROCESADO | 2: RECHAZADO

				/* Realizar una copia del recodset de ingreso movimiento */
				Recordset rsServicioAuxiliar = new Recordset();							
				rsServicioAuxiliar = rsIngresoMovimiento.copy();

				rsIngresoMovimiento.first();
				while (rsIngresoMovimiento.next()) {
					message.appendLine("----- Precio del servicio -----");
					message.appendLine("Servicio: ");
					message.append(String.valueOf(rsIngresoMovimiento.getInt("smn_servicios_rf")));
					message.append(" - ID Ingreso Movimiento: ");
					message.append(String.valueOf(rsIngresoMovimiento.getInt("smn_ingresos_mov_id")));

					Recordset rsServicio = getPriceService(rsIngresoMovimiento, message);

					message.append( " - Precio: ");
					message.append(String.valueOf(rsServicio.getDouble("smn_precio_neto_ml_servicio")));
					message.append(" - Tipo de Precio: ");
					message.appendLine(rsIngresoMovimiento.getString("tipo_precio"));

					rsServicio.setValue("id_detalle", rsIngresoMovimiento.getInt("smn_ingresos_mov_id"));
					rsServicio.setValue("id_ingreso", inputParams.getInt("id_ingreso"));						

					message.appendLine("----- Ruta paciente -----");

					/* Buscar información del auxiliar asociado a la ruta paciente */
					Recordset rsInfoAux = db.get(getSQL(getResource("consultar-ruta-paciente.sql"), inputParams));
					if (rsInfoAux.getRecordCount() > 0) {
						rsInfoAux.first();
						
						rsIntegracionTercero.setValue("int_status_ruta_paciente_ant", rsInfoAux.getString("rta_estatus"));

						rsInfoAux.setValue("smn_unidad_servicio_rf", rsIngresoMovimiento.getInteger("smn_unidades_servicios_rf"));
						rsInfoAux.setValue("rta_numero_documento_identidad", rsInfoAux.getString("rta_numero_documento_identidad").replace(" ",""));
						rsInfoAux.setValue("smn_serie_id", rsInfoAux.getString("smn_serie_id").replace(" ",""));

						/* Buscar secuencia en la relación unidad paso */
						Recordset rsSecuenciaUnidadPaso = db.get(getSQL(getResource("consultar-secuencia-relacion-unidad-paso.sql"), rsInfoAux));
						if (rsSecuenciaUnidadPaso.getRecordCount() > 0) {
							rsSecuenciaUnidadPaso.next();

							Recordset rsRutaPacienteSecuencia = crearRecordsetRutaPacienteConsulta(rsInfoAux, rsIngresoMovimiento, rsSecuenciaUnidadPaso);
							Recordset rsRutaPaciente = db.get(getSQL(getResource("consultar-ruta-paciente.sql"), rsRutaPacienteSecuencia));

							/* Almacenar N cantidad de servicios y no validar secuencia */
							if (rsRutaPaciente.getRecordCount() <= 0) {

								Recordset rsInsertarRutaPaciente = crearRecordsetRutaPacienteInsercion(rsInfoAux, rsIngresoMovimiento, rsSecuenciaUnidadPaso, fechaActual);
								String insertarRutaPaciente = getSQL(getResource("insertar-ruta-paciente.sql"), rsInsertarRutaPaciente);

								String[] params = {
										"smn_clase_auxiliar_rf",
										"smn_auxiliar_rf",
										"rta_numero_documento_identidad",
										"smn_entidad_rf",
										"smn_sucursal_rf",
										"smn_area_servicio_rf",
										"smn_unidad_servicio_rf",
										"smn_grupo_prestador_rf",
										"smn_prestador_servicio_rf",
										"rta_estatus",
										"rta_secuencia",
										"smn_serie_id",
										"rta_ticket",
										"rta_idioma",
										"rta_usuario",
										"rta_fecha_registro",
										"rta_hora",
										"rta_ejecutivo_asignado",
										"rta_observacion",
										"rta_hora_llegada_unidad",
										"rta_hora_salida_unidad",
										"smn_contratante_id",
										"smn_ingreso_id"
								};

								rcInserted += db.exec(insertarRutaPaciente, rsInsertarRutaPaciente, params);
								registrarMetricaTransaccion("# Registros insertados en ruta paciente: ", rcInserted, TRANSACTION.INSERT);

							} else {
								rsRutaPaciente.first();
								message.append("La secuencia ya se encuentra registrada. Ruta ID: ");
								message.appendLine(String.valueOf(rsRutaPaciente.getInt("smn_ruta_id")));
								procesamientoCaja = Boolean.FALSE;
							}

							/* Actualizar precio de la cabecera */
							rcUpdated += db.exec(getSQL(getResource("actualizar-precio-cabecera.sql"), rsServicio));
							registrarMetricaTransaccion("# Registros actualizados en precio cabecera: ", rcUpdated, TRANSACTION.UPDATE);

						} else {	
							message.appendLine("No se encontró secuencia en la configuración en relación unidad paso");
							procesamientoCaja = Boolean.FALSE;
						}														
					} else {
						message.appendLine("No se encontró información del auxiliar en ruta paciente en status EA o AT");	
						procesamientoCaja = Boolean.FALSE;
					}						            
				}

				if (procesamientoCaja) {

					message.appendLine("----- Movimiento de Caja -----");

					/* Consultar ingresos */
					Recordset rsIngresos = db.get(getSQL(getResource("consultar-ingreso.sql"), inputParams));
					if (rsIngresos.getRecordCount() > 0) {
						rsIngresos.first();

						/* Validar si la caja cabecera existe o requiere actualización */
						Recordset rsCabeceraCaja = db.get(getSQL(getResource("consultar-movimiento-caja-cabecera.sql"), rsIngresos));
						if (rsCabeceraCaja.getRecordCount() <= 0) {

							/* Buscar ID de la unidad caja y el ticket en la ruta paciente para luego buscar el ID de la caja */		
							Recordset rsInfoRutaUC = db.get(getSQL(getResource("consultar-ruta-paciente-unidad-caja.sql"), inputParams));
							if (rsInfoRutaUC.getRecordCount() > 0) {
								rsInfoRutaUC.first();

								/* Buscar el ID de la caja en el esquema caja */
								Recordset rsInfoCaja = db.get(getSQL(getResource("consultar-caja.sql"), rsInfoRutaUC));
								if (rsInfoCaja.getRecordCount() > 0) {
									rsInfoCaja.first();

									/* Buscar el ID del módulo en el esquema base	 */
									Recordset rsModuloOrigen = db.get(getSQL(getResource("consultar-modulo-origen.sql"), inputParams));
									if (rsModuloOrigen.getRecordCount() > 0) {
										rsModuloOrigen.first();

										/* Actualizar control recibo */
										Recordset rsControlReciboActualizar = crearRecordsetControlReciboActualizacion(rsInfoCaja, fechaActual);
										Recordset rsControlRecibo = db.get(getSQL(getResource("consultar-control-recibo.sql"), rsControlReciboActualizar));
										Integer numControlFinal = rsControlRecibo.getInteger("rcr_numero_control_final") + 1;

										rsInfoCaja.setValue("rcr_numero_control_final", numControlFinal);

										rsControlReciboActualizar = crearRecordsetControlReciboActualizacion(rsInfoCaja, fechaActual);
										String actualizarControlRecibo = getSQL(getResource("actualizar-control-recibo.sql"), rsControlReciboActualizar);

										String[] controlReciboParams = {
												"smn_caja_id",
												"rcr_numero_control_final"
										};

										rcUpdated += db.exec(actualizarControlRecibo, rsControlReciboActualizar, controlReciboParams);
										registrarMetricaTransaccion("# Registros actualizados en control recibo: ", rcUpdated, TRANSACTION.UPDATE);

										/* En la tabla control recibo de caja obtener la secuencia del próximo recibo */							
										Recordset rsInfoControlRecibo = db.get(getSQL(getResource("consultar-serie-control-recibo.sql"), rsInfoCaja));
										if (rsInfoControlRecibo.getRecordCount() > 0) {
											rsInfoControlRecibo.first();

											/* Si no existe contratante el pagador es el paciente */
											if (rsIngresos.getInt("smn_clase_auxiliar_rf") == 0 && rsIngresos.getInt("auxiliar") == 0) {
												rsIngresos.setValue( "smn_clase_auxiliar_rf", rsIngresos.getInt("smn_clase_rf") );
												rsIngresos.setValue( "auxiliar", rsIngresos.getInt("smn_auxiliar_rf") );
											}

											String consultarDocumentoCaja = "";
											/* Buscar el documento correspondiente en caja según el auxiliar pagador */
											if (rsIngresos.getInt("contratante_id") == 0) {
												consultarDocumentoCaja = getSQL(getResource("consultar-documento-cobranza-particular.sql"), rsIngresos); /* Cobranza particular */
											} else {
												consultarDocumentoCaja = getSQL(getResource("consultar-documento-cobranza-credito.sql"), rsIngresos);    /* Cobranza a crédito */
											}

											Recordset rsDocumentoCaja = db.get(consultarDocumentoCaja);
											if (rsDocumentoCaja.getRecordCount() > 0) {
												rsDocumentoCaja.first();

												/* Movimiento caja cabecera */
												Recordset rsInsertarMovCajaCabecera = crearRecordsetMovCajaCabeceraInsercion(rsInfoCaja, rsModuloOrigen, rsIngresos, rsDocumentoCaja, rsInfoControlRecibo, fechaActual);
												String insertarMovCajaCabecera = getSQL(getResource("insertar-movimiento-caja-cabecera.sql"), rsInsertarMovCajaCabecera);

												String[] params = {
														"smn_caja_id",
														"smn_modulo_rf",
														"mcc_documento_rf",
														"mcc_cod_descripcion_orig",
														"smn_num_doc_origen_rf",
														"mcc_doc_referencia",
														"smn_documento_id",
														"mcc_documento_numero",
														"smn_clase_auxiliar_rf",
														"smn_auxiliar_rf",
														"smn_clase_auxiliar_pagador_rf",
														"smn_auxiliar_pagador_rf",
														"mcc_numero_recibo",
														"mcc_monto_ml_documento",
														"mcc_saldo_ml_documento",
														"mcc_monto_ma_documento",
														"mcc_saldo_ma_documento",
														"smn_moneda_rf",
														"smn_tasa_rf",
														"smn_estatus_cobro",
														"mcc_estatus_registro",
														"mcc_idioma",
														"mcc_usuario",
														"mcc_fecha_registro",
														"mcc_hora",
														"mcc_fecha_ingreso",
														"mcc_monto_impuesto_ml",
														"mcc_monto_impuesto_ma"
												};

												rcInserted += db.exec(insertarMovCajaCabecera, rsInsertarMovCajaCabecera, params);
												registrarMetricaTransaccion("# Registros insertados en caja cabecera: ", rcInserted, TRANSACTION.INSERT);

												/* Movimiento caja detalle */
												Recordset rsInsertarMovCajaDetalle = crearRecordsetMovCajaDetalleInsercion(inputParams, fechaActual);
												String insertarMovCajaDetalle = getSQL(getResource("insertar-movimiento-caja-detalle.sql"), rsInsertarMovCajaDetalle);

												String[] newParams = {
														"mcd_tipo_producto",
														"smn_id_rf",
														"mcd_monto_por_pagar_ml",
														"mcd_saldo_pago_ml",
														"mcd_monto_por_pagar_ma",
														"mcd_saldo_pago_ma",
														"smn_moneda_rf",
														"smn_tasa_rf",
														"mcd_idioma",
														"mcd_usuario",
														"mcd_fecha_registro",
														"mcd_hora",
														"mcd_prestador_servicio",
														"smn_contratante_clase_rf",
														"smn_contratante_rf",
														"smn_ingreso_id"
												};

												rcInserted += db.exec(insertarMovCajaDetalle, rsInsertarMovCajaDetalle, newParams);
												registrarMetricaTransaccion("# Registros insertados en caja detalle: ", rcInserted, TRANSACTION.INSERT);

												/* Actualización - Marcar paciente como atendido */
												rcUpdated += db.exec(getSQL(getResource("actualizar-ruta-paciente.sql"), inputParams));
												registrarMetricaTransaccion("# Registros actualizados en ruta paciente: ", rcUpdated, TRANSACTION.UPDATE);

												message.appendLine("Paciente atendido");
											} else {
												message.appendLine("Revertiendo proceso. No se encontró ID de Documento en Caja. Revisar que para persona natural la condición financiera este en 0 o para juridica en 1");
												/* Revertir estado a ingreso movimiento y restar monto en la cabecera */
												if (rsServicioAuxiliar.getRecordCount() > 0) {
													message.append("Existen ");
													message.append(String.valueOf(rsServicioAuxiliar.getRecordCount()));
													message.appendLine(" registro(s) para revertir");
													while (rsServicioAuxiliar.next()) {	
														rcUpdated += db.exec( getSQL(getResource("actualizar-precio-cabecera-revertir.sql"), rsServicioAuxiliar));
													}
													registrarMetricaTransaccion("# Registros actualizados revertiendo precio cabecera: ", rcUpdated, TRANSACTION.UPDATE);
												}
												rsIntegracionTercero.setValue("int_estatus_transaccion", IntegracionResultado.REVERTIDO.toInt()); // 1: EN PROCESO | 2: PROCESADO | 3: RECHAZADO
												message.appendLine("Proceso revertido");
											}
										} else {
											message.appendLine("Revertiendo proceso. No existe control cecibo para la caja");
											/* Revertir estado a ingreso movimiento y restar monto en la cabecera */
											if (rsServicioAuxiliar.getRecordCount() > 0) {						
												message.append("Existen ");
												message.append(String.valueOf(rsServicioAuxiliar.getRecordCount()));
												message.appendLine(" registro(s) para revertir");
												while (rsServicioAuxiliar.next()) {												
													rcUpdated += db.exec(getSQL(getResource("actualizar-precio-cabecera-revertir.sql"), rsServicioAuxiliar));
												}
												registrarMetricaTransaccion("# Registros actualizados revertiendo precio cabecera: ", rcUpdated, TRANSACTION.UPDATE);
											}
											rsIntegracionTercero.setValue("int_estatus_transaccion", IntegracionResultado.REVERTIDO.toInt()); 
											message.appendLine("Proceso revertido");
										}

									} else {
										message.appendLine("Revertiendo proceso. No existe el módulo ingreso");
										/* Revertir estado a ingreso movimiento y restar monto en la cabecera */
										if (rsServicioAuxiliar.getRecordCount() > 0) {					
											message.append("Existen ");
											message.append(String.valueOf(rsServicioAuxiliar.getRecordCount()));
											message.appendLine(" registro(s) para revertir");
											while (rsServicioAuxiliar.next()) {												
												rcUpdated += db.exec(getSQL(getResource("actualizar-precio-cabecera-revertir.sql"), rsServicioAuxiliar));
											}
											registrarMetricaTransaccion("# Registros actualizados revertiendo precio cabecera: ", rcUpdated, TRANSACTION.UPDATE);
										}
										rsIntegracionTercero.setValue("int_estatus_transaccion", IntegracionResultado.REVERTIDO.toInt()); 
										message.appendLine("Proceso revertido");
									}

								} else {
									message.appendLine("Revertiendo proceso. La caja no existe");
									/* Revertir estado a ingreso movimiento y restar monto en la cabecera */
									if (rsServicioAuxiliar.getRecordCount() > 0) {
										message.append("Existen ");
										message.append(String.valueOf(rsServicioAuxiliar.getRecordCount()));
										message.appendLine(" registro(s) para revertir");
										while (rsServicioAuxiliar.next()) {												
											rcUpdated += db.exec(getSQL(getResource("update-PrecioCabecera_Revert.sql"), rsServicioAuxiliar));
										}
										registrarMetricaTransaccion("# Registros actualizados revertiendo precio cabecera: ", rcUpdated, TRANSACTION.UPDATE);
									}
									rsIntegracionTercero.setValue("int_estatus_transaccion", IntegracionResultado.REVERTIDO.toInt()); 
									message.appendLine("Proceso revertido");
								}	

							} else {	
								message.appendLine("Revertiendo proceso. No existe información para la unidad caja en ruta paciente");
								/* Revertir estado a ingreso movimiento y restar monto en la cabecera */
								if (rsServicioAuxiliar.getRecordCount() > 0) {						
									message.append("Existen ");
									message.append(String.valueOf(rsServicioAuxiliar.getRecordCount()));
									message.appendLine(" registro(s) para revertir");
									while (rsServicioAuxiliar.next()) {												
										rcUpdated += db.exec(getSQL(getResource("update-PrecioCabecera_Revert.sql"), rsServicioAuxiliar));
									}
									registrarMetricaTransaccion("# Registros actualizados revertiendo precio cabecera: ", rcUpdated, TRANSACTION.UPDATE);
								}
								rsIntegracionTercero.setValue("int_estatus_transaccion", IntegracionResultado.REVERTIDO.toInt()); 
								message.appendLine("Proceso revertido");
							}

						} else {

							/* Actualización de caja cabecera */
							rsCabeceraCaja.first();

							message.append("Actualizando caja cabecera con ID: ");
							message.appendLine(String.valueOf(rsCabeceraCaja.getInt("smn_mov_caja_cabecera_id")));

							Recordset rsActualizarMovCajaCabecera = crearRecordsetMovCajaCabeceraActualizacion(rsIngresos, rsCabeceraCaja, fechaActual);
							String insertarMovCajaCabecera = getSQL(getResource("actualizar-movimiento-caja-cabecera.sql"), rsActualizarMovCajaCabecera);

							String[] params = {
									"mcc_saldo_ml_documento",
									"mcc_monto_ma_documento",
									"mcc_saldo_ma_documento",
									"smn_moneda_rf",
									"smn_tasa_rf",
									"mcc_idioma",
									"mcc_usuario",
									"mcc_fecha_registro",
									"mcc_hora",
									"mcc_monto_original_doc_ml",
									"mcc_monto_original_doc_ma"
							};

							rcInserted += db.exec(insertarMovCajaCabecera, rsActualizarMovCajaCabecera, params);
							registrarMetricaTransaccion("# Registros insertados en caja cabecera: ", rcInserted, TRANSACTION.INSERT);

							Recordset rsInsertarMovCajaDetalle = crearRecordsetMovCajaDetalleInsercion(inputParams, fechaActual);
							String insertarMovCajaDetalle = getSQL(getResource("insertar-movimiento-caja-detalle.sql"), rsInsertarMovCajaDetalle);

							String[] newParams = {
									"mcd_tipo_producto",
									"smn_id_rf",
									"mcd_monto_por_pagar_ml",
									"mcd_saldo_pago_ml",
									"mcd_monto_por_pagar_ma",
									"mcd_saldo_pago_ma",
									"smn_moneda_rf",
									"smn_tasa_rf",
									"mcd_idioma",
									"mcd_usuario",
									"mcd_fecha_registro",
									"mcd_hora",
									"mcd_prestador_servicio",
									"smn_contratante_clase_rf",
									"smn_contratante_rf",
									"smn_ingreso_id"
							};

							rcInserted += db.exec(insertarMovCajaDetalle, rsInsertarMovCajaDetalle, newParams);
							registrarMetricaTransaccion("# Registros insertados en caja detalle: ", rcInserted, TRANSACTION.INSERT);

							/* Actualización - Marcar paciente como atendido */
							rcUpdated += db.exec(getSQL(getResource("update-RutaPaciente.sql"), inputParams));
							registrarMetricaTransaccion("# Registros actualizados en ruta paciente: ", rcUpdated, TRANSACTION.UPDATE);

							message.appendLine("Paciente atendido");
						}	
						rsIntegracionTercero.setValue("smn_mov_caja_cabecera_id", rsCabeceraCaja.getInt("smn_mov_caja_cabecera_id"));
												
					} else {
						message.appendLine("Revertiendo proceso. El ID ingreso no existe o hubo una falla a nivel de configuración. Ver log.");
						/* Revertir estado a ingreso movimiento y restar monto en la cabecera */
						if (rsServicioAuxiliar.getRecordCount() > 0) {	
							message.append("Existen ");
							message.append(String.valueOf(rsServicioAuxiliar.getRecordCount()));
							message.appendLine(" registro(s) para revertir");
							while (rsServicioAuxiliar.next()) {	
								rcUpdated += db.exec(getSQL(getResource("actualizar-precio-cabecera-revertir.sql"), rsServicioAuxiliar));
							}
							registrarMetricaTransaccion("# Registros actualizados revertiendo precio cabecera: ", rcUpdated, TRANSACTION.UPDATE);
						}
						message.appendLine("El proceso no ha sido completado satisfactoriamente");
						rsIntegracionTercero.setValue("int_estatus_transaccion", IntegracionResultado.RECHAZADO.toInt()); 
					}
				}

			} else {
				message.appendLine("No existen movimiento de ingresos");
				rsIntegracionTercero.setValue("int_estatus_transaccion", IntegracionResultado.RECHAZADO.toInt()); 
			}

		} else {
			message.append("El ID de estatus financiero del ingreso es ");
			message.append(String.valueOf(inputParams.getInt("id_ingreso")));
			message.appendLine(" no está Pendiente. No se pueden procesar servicios");
			rsIntegracionTercero.setValue("int_estatus_transaccion", IntegracionResultado.RECHAZADO.toInt()); 
		}

		if (status == IntegracionResultado.EN_PROCESO) {
			Boolean processedSuccesfully = procesarPrestationServicio(inputParams, rsIntegracionTercero, message);
			if (processedSuccesfully) {				
				rsIntegracionTercero.setValue("int_estatus_transaccion", IntegracionResultado.REGISTRADO.toInt()); 
			} else {
				rsIntegracionTercero.setValue("int_estatus_transaccion", IntegracionResultado.RECHAZADO.toInt());
			}
		} else {
			rsIntegracionTercero.setValue("int_estatus_transaccion", IntegracionResultado.RECHAZADO.toInt());
		}
		
		String insertarIntegracion = getSQL(getResource("insertar-integracion-infolab-ris.sql"), rsIntegracionTercero);

		String[] params = {
			"smn_ingresos_id",
			"smn_orden_servicio_id",
			"smn_servicios_id",
			"smn_componentes_id",
			"smn_mov_caja_cabecera_id",
			"smn_prestador_medico_id",
			"smn_prestador_tecnico_id",
			"int_status_ruta_paciente_ant",
			"int_status_ruta_paciente_act",
			"int_estatus_transaccion",
			"int_fecha_respuesta",
			"int_hora_respuesta",
			"int_link_resultado",
			"int_proveedor",
			"int_idioma",
			"int_usuario",
			"int_fecha_registro",
			"int_hora_registro"
		};

		rcInserted += db.exec(insertarIntegracion, rsIntegracionTercero, params);
		registrarMetricaTransaccion("# Registros insertados en tabla integración terceros: ", rcInserted, TRANSACTION.INSERT);

		message.appendLine("Orden de Ingreso procesada satisfactoriamente");

		return ordenIngresoResultado.getTransactionNumber();
	}

	public Recordset crearRecordsetRutaPacienteConsulta(Recordset rsInfoAux, Recordset rsIngresoMovimiento, Recordset rsSecuenciaUnidadPaso) throws Throwable {
		Recordset recordset = new Recordset();
		recordset.append("smn_clase_auxiliar_rf", java.sql.Types.INTEGER);
		recordset.append("smn_auxiliar_rf", java.sql.Types.INTEGER);
		recordset.append("rta_numero_documento_identidad", java.sql.Types.VARCHAR);
		recordset.append("smn_entidad_rf", java.sql.Types.INTEGER);
		recordset.append("smn_sucursal_rf", java.sql.Types.INTEGER);
		recordset.append("smn_area_servicio_rf", java.sql.Types.INTEGER);
		recordset.append("smn_unidad_servicio_rf", java.sql.Types.INTEGER);
		recordset.append("rta_secuencia", java.sql.Types.INTEGER);
		recordset.append("smn_serie_id", java.sql.Types.VARCHAR);
		recordset.append("rta_ticket", java.sql.Types.INTEGER);

		recordset.addNew();

		recordset.setValue("smn_clase_auxiliar_rf", rsInfoAux.getInteger("smn_clase_auxiliar_rf"));
		recordset.setValue("smn_auxiliar_rf", rsInfoAux.getInteger("smn_auxiliar_rf"));
		recordset.setValue("rta_numero_documento_identidad", rsInfoAux.getString("rta_numero_documento_identidad").replace(" ",""));
		recordset.setValue("smn_entidad_rf", rsInfoAux.getInteger("smn_entidad_rf"));
		recordset.setValue("smn_sucursal_rf", rsInfoAux.getInteger("smn_sucursal_rf"));
		recordset.setValue("smn_area_servicio_rf", rsInfoAux.getInteger("smn_area_servicio_rf"));
		recordset.setValue("smn_unidad_servicio_rf", rsIngresoMovimiento.getInteger("smn_unidades_servicios_rf"));
		recordset.setValue("rta_secuencia", rsSecuenciaUnidadPaso.getInt("rup_secuencia"));
		recordset.setValue("smn_serie_id", rsInfoAux.getString("smn_serie_id").replace(" ",""));
		recordset.setValue("rta_ticket", rsInfoAux.getInteger("rta_ticket"));

		return recordset;
	}

	public Recordset crearRecordsetRutaPacienteInsercion(Recordset rsInfoAux, Recordset rsIngresoMovimiento, Recordset rsSecuenciaUnidadPaso, String fechaActual) throws Throwable {
		java.util.Date utilDate = new java.util.Date(); //fecha actual
		java.sql.Time horaActual = new java.sql.Time(utilDate.getTime());

		dinamica.security.DinamicaUser user = (dinamica.security.DinamicaUser) getRequest().getUserPrincipal();
		String usuario = "N/D";
		if (user != null)
			usuario = user.getName();

		Recordset recordset = new Recordset();
		recordset.append("smn_clase_auxiliar_rf", java.sql.Types.INTEGER);
		recordset.append("smn_auxiliar_rf", java.sql.Types.INTEGER);
		recordset.append("rta_numero_documento_identidad", java.sql.Types.VARCHAR);
		recordset.append("smn_entidad_rf", java.sql.Types.INTEGER);
		recordset.append("smn_sucursal_rf", java.sql.Types.INTEGER);
		recordset.append("smn_area_servicio_rf", java.sql.Types.INTEGER);
		recordset.append("smn_unidad_servicio_rf", java.sql.Types.INTEGER);
		recordset.append("smn_grupo_prestador_rf", java.sql.Types.INTEGER);
		recordset.append("smn_prestador_servicio_rf", java.sql.Types.INTEGER);
		recordset.append("rta_estatus", java.sql.Types.VARCHAR);
		recordset.append("rta_secuencia", java.sql.Types.INTEGER);
		recordset.append("smn_serie_id", java.sql.Types.VARCHAR);
		recordset.append("rta_ticket", java.sql.Types.INTEGER);
		recordset.append("rta_hora_llegada_unidad", java.sql.Types.TIME);
		recordset.append("rta_hora_salida_unidad", java.sql.Types.TIME);
		recordset.append("rta_idioma", java.sql.Types.VARCHAR);
		recordset.append("rta_usuario", java.sql.Types.VARCHAR);
		recordset.append("rta_fecha_registro", java.sql.Types.DATE);
		recordset.append("rta_hora", java.sql.Types.VARCHAR);
		recordset.append("rta_ejecutivo_asignado", java.sql.Types.INTEGER);
		recordset.append("rta_observacion", java.sql.Types.INTEGER);
		recordset.append("smn_contratante_id", java.sql.Types.INTEGER);
		recordset.append("smn_ingreso_id", java.sql.Types.INTEGER);

		recordset.addNew();

		recordset.setValue("smn_clase_auxiliar_rf", rsInfoAux.getInteger("smn_clase_auxiliar_rf"));
		recordset.setValue("smn_auxiliar_rf", rsInfoAux.getInteger("smn_auxiliar_rf"));
		recordset.setValue("rta_numero_documento_identidad", rsInfoAux.getString("rta_numero_documento_identidad").replace(" ",""));
		recordset.setValue("smn_entidad_rf", rsInfoAux.getInteger("smn_entidad_rf"));
		recordset.setValue("smn_sucursal_rf", rsInfoAux.getInteger("smn_sucursal_rf"));
		recordset.setValue("smn_area_servicio_rf", rsInfoAux.getInteger("smn_area_servicio_rf"));
		recordset.setValue("smn_unidad_servicio_rf", rsIngresoMovimiento.getInteger("smn_unidades_servicios_rf"));
		recordset.setValue("smn_grupo_prestador_rf", rsIngresoMovimiento.getInteger("smn_grupo_prestador_servicio_rf"));
		recordset.setValue("smn_prestador_servicio_rf", rsIngresoMovimiento.getInteger("smn_prestador_servicio_rf"));
		recordset.setValue("rta_estatus", "PE");
		recordset.setValue("rta_secuencia", rsSecuenciaUnidadPaso.getInt("rup_secuencia"));
		recordset.setValue("smn_serie_id", rsInfoAux.getString("smn_serie_id").replace(" ",""));
		recordset.setValue("rta_ticket", rsInfoAux.getInteger("rta_ticket"));
		recordset.setValue("rta_hora_llegada_unidad", null);
		recordset.setValue("rta_hora_salida_unidad", null);
		recordset.setValue("rta_idioma", "es");
		recordset.setValue("rta_usuario", usuario);
		recordset.setValue("rta_fecha_registro", fechaActual);
		recordset.setValue("rta_hora", horaActual);
		recordset.setValue("rta_ejecutivo_asignado", null);
		recordset.setValue("rta_observacion", null);
		recordset.setValue("smn_contratante_id", null);
		recordset.setValue("smn_ingreso_id", rsIngresoMovimiento.getInteger("smn_ingreso_id"));

		return recordset;
	}

	public Recordset crearRecordsetControlReciboActualizacion(Recordset rsInfoCaja, String fechaActual) throws Throwable {
		Recordset recordset = new Recordset();
		recordset.append("smn_control_recibo_id", java.sql.Types.INTEGER);
		recordset.append("smn_caja_id", java.sql.Types.INTEGER);
		recordset.append("rcr_serie", java.sql.Types.VARCHAR);
		recordset.append("rcr_numero_control_inicial", java.sql.Types.INTEGER);
		recordset.append("rcr_numero_control_final", java.sql.Types.INTEGER);
		recordset.append("rcr_estatus", java.sql.Types.VARCHAR);
		recordset.append("rcr_vigencia", java.sql.Types.DATE);
		recordset.append("rcr_idioma", java.sql.Types.VARCHAR);
		recordset.append("rcr_usuario", java.sql.Types.VARCHAR);
		recordset.append("rcr_fecha_registro", java.sql.Types.DATE);
		recordset.append("rcr_hora", java.sql.Types.VARCHAR);

		recordset.addNew();

		recordset.setValue("smn_caja_id", rsInfoCaja.getInt("smn_caja_id"));
		recordset.setValue("rcr_numero_control_final", rsInfoCaja.getInt("rcr_numero_control_final"));

		return recordset;
	}

	public Recordset crearRecordsetMovCajaCabeceraInsercion(Recordset rsInfoCaja, Recordset rsInfoMO, Recordset rsIngresos, Recordset rsDocumentoCaja, Recordset rsInfoControlRecibo, String fechaActual) throws Throwable {
		String horaActual = new SimpleDateFormat("HH:mm:ss").format(new Date());

		dinamica.security.DinamicaUser user = (dinamica.security.DinamicaUser) getRequest().getUserPrincipal();
		String usuario = "N/D";
		if (user != null)
			usuario = user.getName();

		Recordset recordset = new Recordset();
		recordset.append("smn_mov_caja_cabecera_id", java.sql.Types.INTEGER);
		recordset.append("smn_caja_id", java.sql.Types.INTEGER);
		recordset.append("smn_modulo_rf", java.sql.Types.INTEGER);
		recordset.append("mcc_documento_rf", java.sql.Types.INTEGER);
		recordset.append("mcc_cod_descripcion_orig", java.sql.Types.VARCHAR);
		recordset.append("smn_num_doc_origen_rf", java.sql.Types.INTEGER);
		recordset.append("mcc_doc_referencia", java.sql.Types.VARCHAR);
		recordset.append("smn_documento_id", java.sql.Types.INTEGER);
		recordset.append("smn_clase_auxiliar_rf", java.sql.Types.INTEGER);
		recordset.append("smn_auxiliar_rf", java.sql.Types.INTEGER);
		recordset.append("smn_clase_auxiliar_pagador_rf", java.sql.Types.INTEGER);
		recordset.append("smn_auxiliar_pagador_rf", java.sql.Types.INTEGER);
		recordset.append("mcc_numero_recibo", java.sql.Types.VARCHAR);
		recordset.append("mcc_monto_ml_documento", java.sql.Types.DOUBLE);
		recordset.append("mcc_saldo_ml_documento", java.sql.Types.DOUBLE);
		recordset.append("mcc_monto_ma_documento", java.sql.Types.DOUBLE);
		recordset.append("mcc_saldo_ma_documento", java.sql.Types.DOUBLE);
		recordset.append("smn_moneda_rf", java.sql.Types.INTEGER);
		recordset.append("smn_tasa_rf", java.sql.Types.INTEGER);
		recordset.append("smn_estatus_cobro", java.sql.Types.VARCHAR);
		recordset.append("mcc_estatus_registro", java.sql.Types.VARCHAR);
		recordset.append("mcc_idioma", java.sql.Types.VARCHAR);
		recordset.append("mcc_usuario", java.sql.Types.VARCHAR);
		recordset.append("mcc_fecha_registro", java.sql.Types.DATE);
		recordset.append("mcc_hora", java.sql.Types.VARCHAR);
		recordset.append("mcc_fecha_ingreso", java.sql.Types.DATE);
		recordset.append("mcc_monto_impuesto_ml", java.sql.Types.DOUBLE);
		recordset.append("mcc_monto_impuesto_ma", java.sql.Types.DOUBLE);

		// Estos campos no estan en la tabla original
		recordset.append("mcc_monto_diferencial_cambiario_ml", java.sql.Types.DOUBLE);
		recordset.append("mcc_monto_original_doc_ml", java.sql.Types.DOUBLE);
		recordset.append("mcc_monto_original_doc_ma", java.sql.Types.DOUBLE);

		recordset.addNew();

		recordset.setValue("smn_mov_caja_cabecera_id", null);
		recordset.setValue("smn_caja_id", rsInfoCaja.getInt("smn_caja_id"));
		recordset.setValue("smn_modulo_rf", rsInfoMO.getInt("smn_modulos_id"));
		recordset.setValue("mcc_documento_rf", rsIngresos.getInt("smn_documento_id"));
		recordset.setValue("mcc_cod_descripcion_orig", rsIngresos.getString("descripcion_origen"));
		recordset.setValue("smn_num_doc_origen_rf", rsIngresos.getInt("igs_num_ingreso"));
		recordset.setValue("mcc_doc_referencia", rsIngresos.getInt("igs_ticket"));
		recordset.setValue("smn_documento_id", rsDocumentoCaja.getInt("smn_documento_id_caja"));
		recordset.setValue("smn_clase_auxiliar_rf", rsIngresos.getInt("smn_clase_rf"));
		recordset.setValue("smn_auxiliar_rf", rsIngresos.getInt("smn_auxiliar_rf"));
		recordset.setValue("smn_clase_auxiliar_pagador_rf", rsIngresos.getInt("smn_clase_auxiliar_rf"));
		recordset.setValue("smn_auxiliar_pagador_rf", rsIngresos.getInt("auxiliar"));
		recordset.setValue("mcc_numero_recibo", rsInfoControlRecibo.getString("rcr_numero_control_final"));
		recordset.setValue("mcc_monto_ml_documento", rsIngresos.getDouble("igs_monto_moneda_local"));
		recordset.setValue("mcc_saldo_ml_documento", rsIngresos.getDouble("igs_monto_moneda_local"));
		recordset.setValue("mcc_monto_ma_documento", rsIngresos.getDouble("igs_monto_moneda_alterna"));
		recordset.setValue("mcc_saldo_ma_documento", rsIngresos.getDouble("igs_monto_moneda_alterna"));
		recordset.setValue("smn_moneda_rf", rsIngresos.getInt("smn_moneda_rf"));
		recordset.setValue("smn_tasa_rf", rsIngresos.getInt("smn_tasas_de_cambio_id"));
		recordset.setValue("smn_estatus_cobro", "PE");
		recordset.setValue("mcc_estatus_registro", "RE");
		recordset.setValue("mcc_idioma", "es");
		recordset.setValue("mcc_usuario", usuario);
		recordset.setValue("mcc_fecha_registro", fechaActual);
		recordset.setValue("mcc_hora", horaActual);
		recordset.setValue("mcc_fecha_ingreso", rsIngresos.getDate("igs_fecha_ingreso"));
		recordset.setValue("mcc_monto_impuesto_ml", 0);
		recordset.setValue("mcc_monto_impuesto_ma", 0);

		recordset.setValue("mcc_monto_diferencial_cambiario_ml", 0);
		recordset.setValue("mcc_monto_original_doc_ml", rsIngresos.getDouble("igs_monto_moneda_local"));
		recordset.setValue("mcc_monto_original_doc_ma", rsIngresos.getDouble("igs_monto_moneda_alterna"));

		return recordset;
	}

	public Recordset crearRecordsetMovCajaDetalleInsercion(Recordset inputParams, String fechaActual) throws Throwable {
		String hora = new SimpleDateFormat("HH:mm:ss").format(new Date());		

		dinamica.security.DinamicaUser user = (dinamica.security.DinamicaUser) getRequest().getUserPrincipal();
		String usuario = "N/D";
		if (user != null)
			usuario = user.getName();

		Recordset recordset = new Recordset();
		recordset.append("smn_mov_caja_detalle_id", java.sql.Types.INTEGER);
		recordset.append("smn_mov_caja_cabecera_id", java.sql.Types.INTEGER);
		recordset.append("mcd_tipo_producto", java.sql.Types.VARCHAR);
		recordset.append("smn_id_rf", java.sql.Types.INTEGER);
		recordset.append("mcd_monto_por_pagar_ml", java.sql.Types.DOUBLE);
		recordset.append("mcd_saldo_pago_ml", java.sql.Types.DOUBLE);
		recordset.append("mcd_monto_por_pagar_ma", java.sql.Types.DOUBLE);
		recordset.append("mcd_saldo_pago_ma", java.sql.Types.DOUBLE);
		recordset.append("smn_moneda_rf", java.sql.Types.INTEGER);
		recordset.append("smn_tasa_rf", java.sql.Types.INTEGER);
		recordset.append("mcd_idioma", java.sql.Types.VARCHAR);
		recordset.append("mcd_usuario", java.sql.Types.VARCHAR);
		recordset.append("mcd_fecha_registro", java.sql.Types.DATE);
		recordset.append("mcd_hora", java.sql.Types.VARCHAR);
		recordset.append("mcd_prestador_servicio", java.sql.Types.INTEGER);
		recordset.append("smn_contratante_clase_rf", java.sql.Types.INTEGER);
		recordset.append("smn_contratante_rf", java.sql.Types.INTEGER);

		recordset.addNew();

		recordset.setValue("mcd_tipo_producto", "SS");
		recordset.setValue("mcd_idioma", "es");
		recordset.setValue("mcd_usuario", usuario);
		recordset.setValue("mcd_fecha_registro", fechaActual);
		recordset.setValue("mcd_hora", hora);
		recordset.setValue("mcd_prestador_servicio", 0);
		recordset.setValue("smn_contratante_clase_rf", 0);
		recordset.setValue("smn_contratante_rf", 0);
		recordset.setValue("smn_ingreso_id", inputParams.getInt("id_ingreso"));

		return recordset;
	}

	public Recordset crearRecordsetMovCajaCabeceraActualizacion(Recordset rsIngresos, Recordset rsCabeceraCaja, String fechaActual) throws Throwable {
		String horaActual = new SimpleDateFormat("HH:mm:ss").format(new Date());		

		dinamica.security.DinamicaUser user = (dinamica.security.DinamicaUser) getRequest().getUserPrincipal();
		String usuario = "N/D";
		if (user != null)
			usuario = user.getName();

		Recordset recordset = new Recordset();
		recordset.append("smn_mov_caja_cabecera_id", java.sql.Types.INTEGER);
		recordset.append("smn_caja_id", java.sql.Types.INTEGER);
		recordset.append("smn_modulo_rf", java.sql.Types.INTEGER);
		recordset.append("mcc_documento_rf", java.sql.Types.INTEGER);
		recordset.append("mcc_cod_descripcion_orig", java.sql.Types.VARCHAR);
		recordset.append("smn_num_doc_origen_rf", java.sql.Types.INTEGER);
		recordset.append("mcc_doc_referencia", java.sql.Types.VARCHAR);
		recordset.append("smn_documento_id", java.sql.Types.INTEGER);
		recordset.append("smn_clase_auxiliar_rf", java.sql.Types.INTEGER);
		recordset.append("smn_auxiliar_rf", java.sql.Types.INTEGER);
		recordset.append("smn_clase_auxiliar_pagador_rf", java.sql.Types.INTEGER);
		recordset.append("smn_auxiliar_pagador_rf", java.sql.Types.INTEGER);
		recordset.append("mcc_numero_recibo", java.sql.Types.VARCHAR);
		recordset.append("mcc_monto_ml_documento", java.sql.Types.DOUBLE);
		recordset.append("mcc_saldo_ml_documento", java.sql.Types.DOUBLE);
		recordset.append("mcc_monto_ma_documento", java.sql.Types.DOUBLE);
		recordset.append("mcc_saldo_ma_documento", java.sql.Types.DOUBLE);
		recordset.append("smn_moneda_rf", java.sql.Types.INTEGER);
		recordset.append("smn_tasa_rf", java.sql.Types.INTEGER);
		recordset.append("smn_estatus_cobro", java.sql.Types.VARCHAR);
		recordset.append("mcc_estatus_registro", java.sql.Types.VARCHAR);
		recordset.append("mcc_idioma", java.sql.Types.VARCHAR);
		recordset.append("mcc_usuario", java.sql.Types.VARCHAR);
		recordset.append("mcc_fecha_registro", java.sql.Types.DATE);
		recordset.append("mcc_hora", java.sql.Types.VARCHAR);
		recordset.append("mcc_fecha_ingreso", java.sql.Types.DATE);
		recordset.append("mcc_monto_impuesto_ml", java.sql.Types.DOUBLE);
		recordset.append("mcc_monto_impuesto_ma", java.sql.Types.DOUBLE);

		// Estos campos no estan en la tabla original
		recordset.append("mcc_monto_diferencial_cambiario_ml", java.sql.Types.DOUBLE);
		recordset.append("mcc_monto_original_doc_ml", java.sql.Types.DOUBLE);
		recordset.append("mcc_monto_original_doc_ma", java.sql.Types.DOUBLE);

		recordset.addNew();

		recordset.setValue("mcc_saldo_ml_documento", recordset.getDouble("mcc_saldo_ml_documento") + rsIngresos.getDouble("igs_monto_moneda_local") - recordset.getDouble("mcc_saldo_ml_documento"));
		recordset.setValue("mcc_monto_ma_documento", rsIngresos.getDouble("igs_monto_moneda_alterna"));
		recordset.setValue("mcc_saldo_ma_documento", recordset.getDouble("mcc_saldo_ma_documento") + rsIngresos.getDouble("igs_monto_moneda_alterna") - recordset.getDouble("mcc_saldo_ma_documento"));
		recordset.setValue("smn_moneda_rf", rsIngresos.getInt("smn_moneda_rf"));
		recordset.setValue("smn_tasa_rf", rsIngresos.getInt("smn_tasas_de_cambio_id")-recordset.getDouble("mcc_saldo_ma_documento"));
		recordset.setValue("mcc_idioma", "es");
		recordset.setValue("mcc_usuario", usuario);
		recordset.setValue("mcc_fecha_registro", fechaActual);
		recordset.setValue("mcc_hora", horaActual);
		recordset.setValue("mcc_monto_original_doc_ml",rsIngresos.getDouble("igs_monto_moneda_local"));
		recordset.setValue("mcc_monto_original_doc_ma", rsIngresos.getDouble("igs_monto_moneda_alterna"));

		return recordset;
	}
	
	public Recordset crearRecordsetIntegracionProveedor() throws RecordsetException {
		String fechaActual = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		String horaActual = new SimpleDateFormat("HH:mm:ss").format(new Date());		

		dinamica.security.DinamicaUser user = (dinamica.security.DinamicaUser) getRequest().getUserPrincipal();
		String usuario = "N/D";
		if (user != null)
			usuario = user.getName();
		
		Recordset rsIntegracion = new Recordset();
		rsIntegracion.append("integracion_proveedor_id", java.sql.Types.INTEGER);
		rsIntegracion.append("smn_ingresos_id", java.sql.Types.INTEGER);
		rsIntegracion.append("smn_orden_servicio_id", java.sql.Types.INTEGER);
		rsIntegracion.append("smn_servicios_id", java.sql.Types.INTEGER);
		rsIntegracion.append("smn_componentes_id", java.sql.Types.INTEGER);
		rsIntegracion.append("smn_mov_caja_cabecera_id", java.sql.Types.INTEGER);
		rsIntegracion.append("smn_prestador_medico_id", java.sql.Types.INTEGER);
		rsIntegracion.append("smn_prestador_tecnico_id", java.sql.Types.INTEGER);
		rsIntegracion.append("int_estatus", java.sql.Types.INTEGER);
		rsIntegracion.append("int_estatus_transaccion", java.sql.Types.INTEGER);
		rsIntegracion.append("int_fecha_respuesta", java.sql.Types.DATE);
		rsIntegracion.append("int_hora_respuesta", java.sql.Types.VARCHAR);
		rsIntegracion.append("int_link_resultado", java.sql.Types.VARCHAR);
		rsIntegracion.append("int_proveedor", java.sql.Types.INTEGER);
		rsIntegracion.append("int_idioma", java.sql.Types.VARCHAR);
		rsIntegracion.append("int_usuario", java.sql.Types.VARCHAR);
		rsIntegracion.append("int_fecha_registro", java.sql.Types.DATE);
		rsIntegracion.append("int_hora_registro", java.sql.Types.VARCHAR);

		rsIntegracion.addNew();

		rsIntegracion.setValue("smn_ingresos_id", null);
		rsIntegracion.setValue("smn_orden_servicio_id", null);
		rsIntegracion.setValue("smn_servicios_id", null);
		rsIntegracion.setValue("smn_componentes_id", null);
		rsIntegracion.setValue("smn_mov_caja_cabecera_id", null);
		rsIntegracion.setValue("smn_prestador_medico_id", null);
		rsIntegracion.setValue("smn_prestador_tecnico_id", null);
		rsIntegracion.setValue("int_estatus", null);
		rsIntegracion.setValue("int_estatus_transaccion", null);
		rsIntegracion.setValue("int_fecha_respuesta", null);
		rsIntegracion.setValue("int_hora_respuesta", null);
		rsIntegracion.setValue("int_link_resultado", null);
		rsIntegracion.setValue("int_proveedor", null);
		rsIntegracion.setValue("int_idioma", "es");
		rsIntegracion.setValue("int_usuario", usuario);
		rsIntegracion.setValue("int_fecha_registro", fechaActual);
		rsIntegracion.setValue("int_hora_registro", horaActual);
		
		return rsIntegracion;
	}

	public void registrarMetricaTransaccion(String comment, Integer numRegistros, TRANSACTION transaction) {
		message.appendLine(comment);
		message.appendLine(String.valueOf(numRegistros));
		if (transaction == TRANSACTION.UPDATE) {
			ordenIngresoResultado.setRcUpdated(numRegistros);
			rcUpdated = 0;
		} else if (transaction == TRANSACTION.INSERT) {
			ordenIngresoResultado.setRcInserted(numRegistros);
			rcInserted = 0;
		} else {
			ordenIngresoResultado.setRcDeleted(numRegistros);
			rcDeleted = 0;
		}
	}

	protected Recordset getPriceService(Recordset rsIngresoMovimiento, StringBuilderPlus message) throws Throwable {
		String tipo_precio = rsIngresoMovimiento.getString("tipo_precio");
		String consultarPrecioServicio="";
		try {
			if (tipo_precio.equals("G")) {
				consultarPrecioServicio = getSQL(getResource("sql-ConsultarPrecioG.sql"), rsIngresoMovimiento);
			} else if (tipo_precio.equals("C")) {
				consultarPrecioServicio = getSQL(getResource("sql-ConsultarPrecioC.sql"), rsIngresoMovimiento);	
			} else if (tipo_precio.equals("E")) {
				consultarPrecioServicio = getSQL(getResource("sql-ConsultarPrecioE.sql"), rsIngresoMovimiento);	
			}
			message.appendLine(tipo_precio);

			Recordset rsServicio = db.get(consultarPrecioServicio);
			if (rsServicio.getRecordCount() > 0) {
				rsServicio.first();
			}

			return rsServicio;

		} catch (Throwable e) {

			throw e;
		}

	}

	public Boolean procesarPrestationServicio(Recordset inputParams, Recordset rsIntegracionTercero, StringBuilderPlus message) throws Throwable {
		Boolean processed = Boolean.FALSE;
		try {
			message.appendLine("Inicio proceso prestación servicio automático");

			Recordset rsPrestacion = db.get(getSQL(getResource("consultar-cabecera-grupo.sql"), inputParams));
			if (rsPrestacion.getRecordCount() > 0) {

				while (rsPrestacion.next()) {
					Recordset rsPrestacionServicioCabecera = db.get(getSQL(getResource("insertar-prestacion-servicio-cabecera.sql"), rsPrestacion));
					rsPrestacionServicioCabecera.first();
					inputParams.setValue("smn_prestacion_servicio_medico_cabecera_id", rsPrestacionServicioCabecera.getInt("smn_prestacion_servicio_medico_cabecera_id"));
					inputParams.setValue("smn_grupo_prestador_rf", rsPrestacionServicioCabecera.getInt("smn_grupo_prestador_rf"));
					inputParams.setValue("smn_unidades_servicios_rf", rsPrestacionServicioCabecera.getInt("smn_unidades_servicios_rf"));
					inputParams.setValue("smn_prestador_servicio_rf", rsPrestacionServicioCabecera.getInt("smn_prestador_servicio_rf"));

					message.append("Obteniendo ID de la cabecera de prestación: ");
					message.appendLine(String.valueOf(rsPrestacionServicioCabecera.getInt("smn_prestacion_servicio_medico_cabecera_id")));

					if (rsPrestacionServicioCabecera.getInt("smn_prestador_servicio_rf") != 0) {
						Recordset rsDPrestacion = db.get(getSQL(getResource("consultar-detalle-grupo.sql"), inputParams));
						if (rsDPrestacion.getRecordCount() > 0) {
							while (rsDPrestacion.next()) {
								rcInserted += db.exec(getSQL(getResource("insertar-prestacion-servicio-detalle.sql"), rsDPrestacion));
							}
							registrarMetricaTransaccion("# Registros insertados en restación detalle: ", rcInserted, TRANSACTION.INSERT);

						} else {
							message.appendLine("# Registros de prestación detalle < 0");
							rsIntegracionTercero.setValue("int_estatus_transaccion", 3); // 1: EN PROCESO | 2: PROCESADO | 3: RECHAZADO
						}
					} else {
						String sqlCheckDPS = getSQL(getResource("consultar-detalle-grupo-verificar-nulos.sql"), inputParams);
						Recordset rsDPrestacion = db.get(sqlCheckDPS);
						if (rsDPrestacion.getRecordCount() > 0) {
							while (rsDPrestacion.next()) {
								rcInserted += db.exec(getSQL(getResource("insertar-prestacion-servicio-detalle.sql"), rsDPrestacion));
							}
							registrarMetricaTransaccion("# Registros insertados en prestación detalle: ", rcInserted, TRANSACTION.INSERT);
							
						} else {
							message.appendLine("# Registros de prestación detalle < 0");
							rsIntegracionTercero.setValue("int_estatus_transaccion", 3); // 1: EN PROCESO | 2: PROCESADO | 3: RECHAZADO
						}
					}
				}
				
				message.appendLine("Fin proceso prestación de servicios");
				processed = Boolean.TRUE;
				
			} else {
				message.appendLine("# Registros de prestación cabecera < 0");
				rsIntegracionTercero.setValue("int_estatus_transaccion", 3); // 1: EN PROCESO | 2: PROCESADO | 3: RECHAZADO
			}

		} catch (Throwable e) {
			message.appendLine("# Registros de prestación detalle < 0");
			rsIntegracionTercero.setValue("int_estatus_transaccion", 3); // 1: EN PROCESO | 2: PROCESADO | 3: RECHAZADO
			throw e;
		}

		return processed;

	}

}


