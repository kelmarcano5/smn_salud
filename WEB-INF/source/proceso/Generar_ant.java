package proceso;

import dinamica.*;

import javax.sql.DataSource;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Generar_ant extends GenericTransaction
{

	/* (non-Javadoc)
	 * @see dinamica.GenericTransaction#service(dinamica.Recordset)
	 */
	
	public int service(Recordset inputParams) throws Throwable
	{
		
		int rc = 0;
		//String response = "";
		String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String sistemaOperativo = System.getProperty("os.name");
		String file;
		
		
		if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
			file =  "C:/log/log_ProcesarSaludMovimientoIngreso"+fechaActual+".txt";
		else
			file = "./log_ProcesarSaludMovimientoIngreso"+fechaActual+".txt";
		
		File newLogFile = new File(file);
		FileWriter fw;
		String str="";
		
		if(!newLogFile.exists())
			fw = new FileWriter(newLogFile);
		else
			fw = new FileWriter(newLogFile,true);
		
		BufferedWriter bw=new BufferedWriter(fw);
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		
		//reuse superclass code
		super.service(inputParams);
		
		
		//get security datasource
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		//get datasource and DB connection
		DataSource ds = Jndi.getDataSource(jndiName); 
		Connection conn = ds.getConnection();
		this.setConnection(conn);
		conn.setAutoCommit(false);
		try {
			
			//get db channel
			Db db = getDb();
			
			//String str="";
			boolean procesamiento_caja = true;
			
			//System.out.println("Inicio proceso");
			str = "Inicio proceso"+ " \n";
	
			str = "Validando igs_estatus_financiero del Ingreso"+ " \n";
			
			//verificar si el igs_estatus_financiero del Ingreso es Pendiente
			String sqlCheckIngreso = getSQL(getResource("sql-ConsultarStatus.sql"), inputParams);
			//crea un recordset con la data obtenida
			Recordset rsIngreso = db.get(sqlCheckIngreso);
			if(rsIngreso.getRecordCount() > 0) {
				rsIngreso.first();
				
				str = str+ "El status financiero del Ingreso ID: " + inputParams.getInt("id_ingreso") + " es Pendiente, se pueden procesar servicios \n";
				
				//System.out.println("Obteniendo registros del detalle del Ingreso ID: " + inputParams.getInt("id_ingreso"));
				str = str+ "Obteniendo registros del detalle del Ingreso ID: " + inputParams.getInt("id_ingreso") + " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				//rc = 1;
				
				//verificar si se tiene registros en el movimiento del Ingreso a procesar
				String sqlCheckIngresosMov = getSQL(getResource("sql-RegistrosMovimiento.sql"), inputParams);
				
				//crea un recordset con la data obtenida
				Recordset rsIngresosMov = db.get(sqlCheckIngresosMov);
				
				Recordset rsServicio_aux = new Recordset();							
				rsServicio_aux = rsIngresosMov.copy();
				
				//existen registros en mov?
				if(rsIngresosMov.getRecordCount() > 0) {
					int i=0;
					str = str + "Existen registros"+ " \n";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					//rc = 1;
					//System.out.println("Existen registros");
					while (rsIngresosMov.next())
					{
						//System.out.println("1.- Validando Precio del Servicio");
						str = str + "1.- Validando Precio del Servicio"+ " \n";
						
						str = str + "Servicio: "+ rsIngresosMov.getInt("smn_servicios_rf") + " del ID Mov: " + rsIngresosMov.getInt("smn_ingresos_mov_id");
						
						Recordset rsServicio = getPriceService(db, rsIngresosMov, str, bw);
																									
						str = str + ", precio: " + rsServicio.getDouble("smn_precio_neto_ml_servicio") + ", tipo de precio : " + rsIngresosMov.getString("tipo_precio") + " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
						
						rsServicio.setValue( "id_detalle", rsIngresosMov.getInt("smn_ingresos_mov_id"));
						
						rsServicio.setValue( "id_ingreso", inputParams.getInt("id_ingreso"));						
											
						//System.out.println("2.- Validando Ruta");
						str = str + "2.- Validando Ruta"+ " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
						//rc = 1;
						//Generar ruta					
						//1.Buscar información del auxiliar
						String sqlCheckInfoAux = getSQL(getResource("select-InfoRutaPaciente.sql"), inputParams);
						
						//crea un recordset con la data obtenida
						Recordset rsInfoAux = db.get(sqlCheckInfoAux);
						
						if(rsInfoAux.getRecordCount() > 0) {
							rsInfoAux.first();
							//salvar unidad encontrada
							rsInfoAux.setValue( "smn_unidad_servicio_rf", rsIngresosMov.getInteger("smn_unidades_servicios_rf"));
							
							//2. Buscar la secuencia
							//System.out.println(rsInfoAux.getString("rta_numero_documento_identidad"));
							rsInfoAux.setValue( "rta_numero_documento_identidad", rsInfoAux.getString("rta_numero_documento_identidad").replace(" ",""));
						
							rsInfoAux.setValue( "smn_serie_id", rsInfoAux.getString("smn_serie_id").replace(" ",""));
							
							String sqlFindSeq = getSQL(getResource("select-BuscarSecuencia.sql"), rsInfoAux);
							//crea un recordset con la data obtenida
							Recordset rsInfoSeq = db.get(sqlFindSeq);
							
							if(rsInfoSeq.getRecordCount() > 0) {
							
								rsInfoSeq.next();
								//obtener valor de la secuencia
								int seq = rsInfoSeq.getInt("rup_secuencia");
								str = str + "Secuencia encontrada: "+ seq + " \n";
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								//rc = 1;
								//System.out.println("Secuencia encontrada: "+ seq);
														
								//String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
								  //hora = new SimpleDateFormat("HH:mm:ss").format(new Date());
								 
								 java.util.Date utilDate = new java.util.Date(); //fecha actual
								 long lnMilisegundos = utilDate.getTime();
								 java.sql.Time sqlTime = new java.sql.Time(lnMilisegundos);
								
								//validar si la secuencia no existe							
								String sqlRuta = "SELECT smn_ruta_id FROM smn_salud.smn_ruta_paciente WHERE smn_clase_auxiliar_rf = " +rsInfoAux.getInteger("smn_clase_auxiliar_rf") +
												 " AND smn_auxiliar_rf = " +rsInfoAux.getInteger("smn_auxiliar_rf") + 
												 " AND rta_numero_documento_identidad = '"+rsInfoAux.getString("rta_numero_documento_identidad").replace(" ","") +"'"+
												 " AND smn_entidad_rf ="+rsInfoAux.getInteger("smn_entidad_rf") +
												 " AND smn_sucursal_rf =" + rsInfoAux.getInteger("smn_sucursal_rf")+
												 " AND smn_area_servicio_rf =" + rsInfoAux.getInteger("smn_area_servicio_rf") +
												 " AND smn_unidad_servicio_rf = " + rsIngresosMov.getInteger("smn_unidades_servicios_rf") +
												 " AND rta_secuencia =" + seq +
												 " AND smn_serie_id ='" +rsInfoAux.getString("smn_serie_id").replace(" ","") +"'"+
												 " AND rta_ticket = " + rsInfoAux.getInteger("rta_ticket") +
												 " AND smn_ingreso_id = " + rsInfoAux.getInteger("smn_ingreso_id") +
												 " AND rta_fecha_registro <> current_date limit 1";
								
								str = str + "QUERY EN JAVA: "+sqlRuta.toString();
								String sqlCheckInfoSec = getSQL(sqlRuta, null);
								Recordset rsInfoSec = db.get(sqlCheckInfoSec);
								
								//str = str + "PROBANDO QUE LLEGUE : "+ rsInfoSec.getInt("smn_ruta_id") + " \n";
																
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								//SE AJUSTO PARA QUE GRAVE N CANTIDAD DE SERVICIOS Y NO VALIDE LA SECUENCIA
								if(rsInfoSec.getRecordCount() <= 0) {
									//str = str + "ENTRO DENTRO DEL <=0: "+rsInfoSeq.toString();
									//while (rsInfoSeq.next()){
										String sqlInsertRuta = "INSERT INTO smn_salud.smn_ruta_paciente( smn_ruta_id, smn_clase_auxiliar_rf, smn_auxiliar_rf, rta_numero_documento_identidad, smn_entidad_rf, smn_sucursal_rf, smn_area_servicio_rf, smn_unidad_servicio_rf, " + 
												"smn_grupo_prestador_rf, smn_prestador_servicio_rf, rta_estatus, rta_secuencia, smn_serie_id, rta_ticket, rta_hora_llegada_unidad, rta_hora_salida_unidad, rta_idioma, rta_usuario, rta_fecha_registro,  rta_hora, rta_ejecutivo_asignado, smn_ingreso_id)  " +
												"VALUES (nextval('smn_salud.seq_smn_ruta_paciente'),"+ 
												rsInfoAux.getInteger("smn_clase_auxiliar_rf") +", "+ 
												rsInfoAux.getInteger("smn_auxiliar_rf") +", '"+
												rsInfoAux.getString("rta_numero_documento_identidad")+"',"+
												rsInfoAux.getInteger("smn_entidad_rf")+","+
												rsInfoAux.getInteger("smn_sucursal_rf")+","+
												rsInfoAux.getInteger("smn_area_servicio_rf")+"," +
												rsIngresosMov.getInteger("smn_unidades_servicios_rf")+","+ 
												rsIngresosMov.getInteger("smn_grupo_prestador_servicio_rf")+"," +
												rsIngresosMov.getInteger("smn_prestador_servicio_rf")+"," 
												+ "'PE',"+
												seq +",'"+
												rsInfoAux.getString("smn_serie_id")+"',"+
												rsInfoAux.getInteger("rta_ticket")+",null,null,'es','"+inputParams.getString("usuario")+"','"+fechaActual+"','"+sqlTime+"',null,"+rsIngresosMov.getInteger("smn_ingreso_id")+")";
										//str = str + "INSERT RUTA PACIENTE: "+sqlInsertRuta.toString();
										db.exec(sqlInsertRuta);
										
										bw.write(str);
										bw.flush();
										bw.newLine();
										getRequest().setAttribute("mensaje", str);
									//}
								}else{
									rsInfoSec.first();
									str = str + "La secuencia ya se encuentra registrada. Con el Ruta ID: "+ rsInfoSec.getInt("smn_ruta_id") + " \n";
									
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									rc = 1;
								}
								
								str = str + "Actualizando precio de la cabecera y datos del detalle"+ " \n";					
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								//rc = 1;
								
								//Actualizar precio de la cabecera
								String sqlUpdCabecera = getResource("update-PrecioCabecera.sql");
								sqlUpdCabecera = getSQL(sqlUpdCabecera, rsServicio);
								db.exec(sqlUpdCabecera);
								
								procesamiento_caja = true;
																									
							}else{
								str = str + "No se encontró secuencia en la configuración en Relación Unidad Paso"+ " \n";	
								procesamiento_caja = false;
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								rc = 1;
								//return 1;
							}
																					
						} else {
							str = str + "No se encontró información del auxiliar en Ruta Paciente en status EA o AT"+ " \n";
							procesamiento_caja = false;
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							rc = 1;
							//return 1;
												
						}						            
						i++;
					}
					
					str = str + "3.- Insert en Movimiento Caja"+ " \n";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					//rc = 1;
					//return 1;
					//Traer información de la cabecera del ingreso para usar en Caja
					
					String sqlInfoIngreso = getSQL(getResource("sql-InfoIngreso.sql"), inputParams);				
					//crea un recordset con la data obtenida
					Recordset rsIngresos = db.get(sqlInfoIngreso);
					
					if(rsIngresos.getRecordCount() > 0 && procesamiento_caja) {
						str = str + "3.- IF DENTRO DE PROCESAMIENTO DE CAJA = TRUE"+ " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
						//rc = 1;
						rsIngresos.first();
						
						
						//Validar si la cabecera caja existe o requiere actualización
						String sqlCheckCabeceraCaja = getSQL(getResource("select-MovCaja.sql"), rsIngresos);
						Recordset rsCabeceraCaja = db.get(sqlCheckCabeceraCaja);
						
						if(rsCabeceraCaja.getRecordCount() <= 0){
							
							//Buscar ID de la unidad Caja y el ticket en la Ruta para luego buscar el ID de la caja en el esquema Caja					
							String sqlCheckInfoRutaUC = getSQL(getResource("select-InfoRutaUnidadCaja.sql"), inputParams);
																							
							Recordset rsInfoRutaUC = db.get(sqlCheckInfoRutaUC);
							
							if(rsInfoRutaUC.getRecordCount() > 0) {
								rsInfoRutaUC.first();
								
								//buscar el ID de la caja en el esquema Caja
								
								String sqlCheckInfoCaja = getSQL(getResource("select-InfoCaja.sql"), rsInfoRutaUC);
								
								Recordset rsInfoCaja = db.get(sqlCheckInfoCaja);
								
								if(rsInfoCaja.getRecordCount() > 0) {
									rsInfoCaja.first();
								
									//Buscar el ID del módulo en Base						
									String sqlCheckInfoModuloOrigen = getSQL(getResource("select-InfoModuloOrigen.sql"), inputParams);
									
									Recordset rsInfoMO = db.get(sqlCheckInfoModuloOrigen);
									
									if(rsInfoMO.getRecordCount() > 0) {
										rsInfoMO.first();
										
										
										String sqlUpdateCR = "UPDATE smn_caja.smn_control_recibo SET rcr_numero_control_final = rcr_numero_control_final + 1 WHERE smn_caja_id = "+rsInfoCaja.getInt("smn_caja_id");
										db.exec(sqlUpdateCR);
										
										//En la tabla control recibo de Caja traer sec próximo numero de recibo								
										String sqlControlRecibo = getSQL(getResource("select-InfoControlRecibo.sql"), rsInfoCaja);
										Recordset rsInfoControlRecibo = db.get(sqlControlRecibo);
										
										if(rsInfoControlRecibo.getRecordCount() > 0) {
											rsInfoControlRecibo.first();
							
											//String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
											String hora = new SimpleDateFormat("HH:mm:ss").format(new Date());
											
											//Si no existe contratante el pagador es el paciente
											
											if(rsIngresos.getInt("smn_clase_auxiliar_rf") == 0 && rsIngresos.getInt("auxiliar") == 0){
												rsIngresos.setValue( "smn_clase_auxiliar_rf", rsIngresos.getInt("smn_clase_rf") );
												rsIngresos.setValue( "auxiliar", rsIngresos.getInt("smn_auxiliar_rf") );
											}
											
											String sqlCheckDocumentoCaja="";
											
											//Buscar el Doc correspondiente en Caja según el auxiliar pagador
											if(rsIngresos.getInt("contratante_id") == 0){
												sqlCheckDocumentoCaja = getSQL(getResource("sql-InfoDocumentoIC.sql"), rsIngresos);
												
											}else{
												sqlCheckDocumentoCaja = getSQL(getResource("sql-InfoDocumentoIR.sql"), rsIngresos);
											}
											
											Recordset rsDocumentoCaja = db.get(sqlCheckDocumentoCaja);
											if(rsDocumentoCaja.getRecordCount() > 0){
												rsDocumentoCaja.first();
							
												//Insertar Cabecera nueva en Caja
											
												//Insert cabecera
												String sqlInsertCabeceraCaja = "INSERT INTO smn_caja.smn_mov_caja_cabecera( " +
											            "smn_mov_caja_cabecera_id, smn_caja_id, smn_modulo_rf, mcc_documento_rf, " +
											            "mcc_cod_descripcion_orig, smn_num_doc_origen_rf, mcc_doc_referencia, " +
											            "smn_documento_id, mcc_documento_numero, smn_clase_auxiliar_rf, " +
											            "smn_auxiliar_rf, smn_clase_auxiliar_pagador_rf, smn_auxiliar_pagador_rf, " +
											            "mcc_numero_recibo, mcc_monto_ml_documento, mcc_saldo_ml_documento, mcc_monto_ma_documento, mcc_saldo_ma_documento, " +
											            "smn_moneda_rf, smn_tasa_rf, smn_estatus_cobro, mcc_estatus_registro, " +
											            "mcc_idioma, mcc_usuario, mcc_fecha_registro, mcc_hora, mcc_fecha_ingreso, mcc_monto_impuesto_ml, mcc_monto_impuesto_ma, mcc_monto_diferencial_cambiario_ml, mcc_monto_original_doc_ml, mcc_monto_original_doc_ma) " +
											        "VALUES (nextval('smn_caja.seq_smn_mov_caja_cabecera'), "+
											            rsInfoCaja.getInt("smn_caja_id")+", "+
											            rsInfoMO.getInt("smn_modulos_id")+", "+
											            rsIngresos.getInt("smn_documento_id")+", '"+
											            rsIngresos.getString("descripcion_origen")+"', "+
											            rsIngresos.getInt("igs_num_ingreso")+", '"+
											            rsIngresos.getInt("igs_ticket")+"', "+
											            rsDocumentoCaja.getInt("smn_documento_id_caja") +", "+
											            "nextval('smn_caja.seq_documento_numero'), "+
											            rsIngresos.getInt("smn_clase_rf")+", "+
											            rsIngresos.getInt("smn_auxiliar_rf")+", "+
											            rsIngresos.getInt("smn_clase_auxiliar_rf")+", "+
											            rsIngresos.getInt("auxiliar")+", '"+
											            rsInfoControlRecibo.getString("rcr_numero_control_final")+"', "+
											            rsIngresos.getDouble("igs_monto_moneda_local")+","+
											            rsIngresos.getDouble("igs_monto_moneda_local")+","+
											            rsIngresos.getDouble("igs_monto_moneda_alterna")+", "+
											            rsIngresos.getDouble("igs_monto_moneda_alterna")+", "+
											            rsIngresos.getInt("smn_moneda_rf")+", "+
											            rsIngresos.getInt("smn_tasas_de_cambio_id")+",'PE', 'RE', 'es', '"+inputParams.getString("usuario")+"', '"+
											            fechaActual+"', '"+
											            hora+"','"+rsIngresos.getDate("igs_fecha_ingreso")+"','0','0','0',"+rsIngresos.getDouble("igs_monto_moneda_local")+", "+rsIngresos.getDouble("igs_monto_moneda_alterna")+")";	
												
												str = str + "3.1.- Insertando Caja Cabecera"+ " \n";
																			
												db.exec(sqlInsertCabeceraCaja);
												
												String hora2 = new SimpleDateFormat("HH:mm:ss").format(new Date());
																					
												//Insert detalle caja									
												/*String sqlInsertDetalleCaja = "INSERT INTO smn_caja.smn_mov_caja_detalle( " +
																					"smn_mov_caja_detalle_id, smn_mov_caja_cabecera_id, mcd_tipo_producto, " +
																		            "smn_id_rf, mcd_monto_por_pagar_ml, mcd_saldo_pago_ml, mcd_monto_por_pagar_ma, " +
																		            "mcd_saldo_pago_ma, smn_moneda_rf, smn_tasa_rf, mcd_idioma, mcd_usuario, " +
																		            "mcd_fecha_registro, mcd_hora) " +
																		      " SELECT nextval('smn_caja.seq_smn_mov_caja_detalle'), currval('smn_caja.seq_smn_mov_caja_cabecera'), 'SS', " +
																		            "smn_servicios_rf, inm_monto_ml, inm_monto_ml, " +
																		            "inm_monto_ma, inm_monto_ma, smn_moneda_rf, smn_tasa_rf, " + 
																		            "'es', '"+inputParams.getString("usuario")+"','" +fechaActual+"', '"+ 
																		            hora2+"' FROM smn_salud.smn_ingreso_movimiento WHERE not exists (SELECT * FROM smn_caja.smn_mov_caja_detalle WHERE smn_id_rf = smn_servicios_rf AND mcd_tipo_producto = 'SS' AND smn_mov_caja_cabecera_id = currval('smn_caja.seq_smn_mov_caja_cabecera') AND mcd_fecha_registro = current_date)";*/
												
												String sqlInsertDetalleCaja = "INSERT INTO smn_caja.smn_mov_caja_detalle( " +
														"smn_mov_caja_detalle_id, smn_mov_caja_cabecera_id, mcd_tipo_producto, " +
														"smn_id_rf, mcd_monto_por_pagar_ml, mcd_saldo_pago_ml, mcd_monto_por_pagar_ma, " +
														"mcd_saldo_pago_ma, smn_moneda_rf, smn_tasa_rf, mcd_idioma, mcd_usuario, " +
														"mcd_fecha_registro, mcd_hora, mcd_prestador_servicio, smn_contratante_clase_rf, smn_contratante_rf) " +
													" SELECT nextval('smn_caja.seq_smn_mov_caja_detalle'), currval('smn_caja.seq_smn_mov_caja_cabecera'), 'SS', " +
													"smn_servicios_rf, inm_monto_ml, inm_monto_ml, " +
													"inm_monto_ma, inm_monto_ma, smn_moneda_rf, smn_tasa_rf, " + 
													"'es', '"+inputParams.getString("usuario")+"','" +fechaActual+"', '"+hora2+"', '0', '0', '0' "+
													"FROM smn_salud.smn_ingreso_movimiento WHERE smn_ingreso_id = "+ inputParams.getInt("id_ingreso")+" AND smn_servicios_rf not in (SELECT smn_id_rf FROM smn_caja.smn_mov_caja_detalle WHERE mcd_tipo_producto = 'SS' AND smn_mov_caja_cabecera_id = currval('smn_caja.seq_smn_mov_caja_cabecera') AND mcd_fecha_registro <> current_date) order by smn_ingresos_mov_id desc";
												
												str = str + "3.1.- Insertando Caja";
												str = str + " Detalle"+ " \n";
												
												db.exec(sqlInsertDetalleCaja);
												
												str = str + "Paciente atendido"+ " \n";
												//System.out.println("Paciente atendido");
												
												/*Marcar a paciente como atendido*/
												String sqlUpdRuta = getResource("update-RutaPaciente.sql");
												sqlUpdRuta = getSQL(sqlUpdRuta, inputParams);
												db.exec(sqlUpdRuta);
												
											}else{
												//revertir estado a ingreso mov y restar monto en la cabecera

												//existen registros en mov procesados?
												if(rsServicio_aux.getRecordCount() > 0) {
													
													str = str + "Existen "+rsServicio_aux.getRecordCount()+ " registro(s) para revertir \n";						
													
													while (rsServicio_aux.next())
													{												
														String sqlUpdCabecera_Revert = getResource("update-PrecioCabecera_Revert.sql");
														sqlUpdCabecera_Revert = getSQL(sqlUpdCabecera_Revert, rsServicio_aux);
														db.exec(sqlUpdCabecera_Revert);
													}
												}
												str = str + "No se encontró ID de Documento en Caja, revisar que para persona natural la condición financiera este en 0 o para juridica en 1"+ " \n";
												bw.write(str);
												bw.flush();
												bw.newLine();
												getRequest().setAttribute("mensaje", str);
												rc = 1;
												return 1;
												//str = str + "El proceso no ha sido completado satisfactoriamente"+ " \n";
												
											}
							
										}else{
											

											//revertir estado a ingreso mov y restar monto en la cabecera

											//existen registros en mov procesados?
											if(rsServicio_aux.getRecordCount() > 0) {
												
												str = str + "Existen "+rsServicio_aux.getRecordCount()+ " registro(s) para revertir \n";						
												
												while (rsServicio_aux.next())
												{												
													String sqlUpdCabecera_Revert = getResource("update-PrecioCabecera_Revert.sql");
													sqlUpdCabecera_Revert = getSQL(sqlUpdCabecera_Revert, rsServicio_aux);
													db.exec(sqlUpdCabecera_Revert);
												}
											}
											str = str + "No existe Control Recibo para la caja"+ " \n";
											bw.write(str);
											bw.flush();
											bw.newLine();
											getRequest().setAttribute("mensaje", str);
											rc = 1;
											return 1;
											//str = str + "El proceso no ha sido completado satisfactoriamente"+ " \n";
										}
										
									}else{
										
										//revertir estado a ingreso mov y restar monto en la cabecera
										//existen registros en mov procesados?
										if(rsServicio_aux.getRecordCount() > 0) {
											
											str = str + "Existen "+rsServicio_aux.getRecordCount()+ " registro(s) para revertir \n";						
											
											while (rsServicio_aux.next())
											{												
												String sqlUpdCabecera_Revert = getResource("update-PrecioCabecera_Revert.sql");
												sqlUpdCabecera_Revert = getSQL(sqlUpdCabecera_Revert, rsServicio_aux);
												db.exec(sqlUpdCabecera_Revert);
											}
										}
										
										str = str + "No existe el módulo Ingreso"+ " \n";
										bw.write(str);
										bw.flush();
										bw.newLine();
										getRequest().setAttribute("mensaje", str);
										rc = 1;
										return 1;
										//str = str + "El proceso no ha sido completado satisfactoriamente"+ " \n";
									
									}			
								}else{
									
									//revertir estado a ingreso mov y restar monto en la cabecera
									//existen registros en mov procesados?
									if(rsServicio_aux.getRecordCount() > 0) {
										
										str = str + "Existen "+rsServicio_aux.getRecordCount()+ " registro(s) para revertir \n";						
										
										while (rsServicio_aux.next())
										{												
											String sqlUpdCabecera_Revert = getResource("update-PrecioCabecera_Revert.sql");
											sqlUpdCabecera_Revert = getSQL(sqlUpdCabecera_Revert, rsServicio_aux);
											db.exec(sqlUpdCabecera_Revert);
										}
									}
									str = str + "La caja no existe"+ " \n";
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									rc = 1;
									return 1;
									
								}						
							}else{	
								
								//revertir estado a ingreso mov y restar monto en la cabecera
								//existen registros en mov procesados?
								if(rsServicio_aux.getRecordCount() > 0) {
									
									str = str + "Existen "+rsServicio_aux.getRecordCount()+ " registro(s) para revertir \n";						
									
									while (rsServicio_aux.next())
									{												
										String sqlUpdCabecera_Revert = getResource("update-PrecioCabecera_Revert.sql");
										sqlUpdCabecera_Revert = getSQL(sqlUpdCabecera_Revert, rsServicio_aux);
										db.exec(sqlUpdCabecera_Revert);
									}
								}
								str = str + "No existe información para la unidad Caja en Ruta Paciente"+ " \n";
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								rc = 1;
								return 1;
								
							}
							
						}else{
							
							//Actualización de Cabecera en Caja
							rsCabeceraCaja.first();
							
							//String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
							String hora = new SimpleDateFormat("HH:mm:ss").format(new Date());
							
							str = str + "3.1.- Actualizando Caja Cabecera con ID: "+ rsCabeceraCaja.getInt("smn_mov_caja_cabecera_id") + " \n";
							
							String sqlUpdateCabeceraCaja2 = "UPDATE smn_caja.smn_mov_caja_cabecera " +
									   "SET mcc_monto_ml_documento= "+ rsIngresos.getDouble("igs_monto_moneda_local") +", mcc_saldo_ml_documento = mcc_saldo_ml_documento+("+rsIngresos.getDouble("igs_monto_moneda_local")+"-mcc_saldo_ml_documento), mcc_monto_ma_documento= "+ rsIngresos.getDouble("igs_monto_moneda_alterna") + ", mcc_saldo_ma_documento = mcc_saldo_ma_documento+("+ rsIngresos.getDouble("igs_monto_moneda_alterna") +"-mcc_saldo_ma_documento)," + 
									       "smn_moneda_rf= " + rsIngresos.getInt("smn_moneda_rf") +", smn_tasa_rf= " + rsIngresos.getInt("smn_tasas_de_cambio_id") + ", " + 
									       "mcc_idioma= 'es', mcc_usuario= '"+inputParams.getString("usuario")+"', mcc_fecha_registro= '"+ fechaActual +"', mcc_hora='" + hora +"', mcc_monto_original_doc_ml= "+ rsIngresos.getDouble("igs_monto_moneda_local") +", mcc_monto_original_doc_ma="+ rsIngresos.getDouble("igs_monto_moneda_alterna") +""+
									   " WHERE smn_mov_caja_cabecera_id = " + rsCabeceraCaja.getInt("smn_mov_caja_cabecera_id");
							db.exec(sqlUpdateCabeceraCaja2);
							
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							String hora2 = new SimpleDateFormat("HH:mm:ss").format(new Date());					
							String sqlInsertDetalleCaja = "INSERT INTO smn_caja.smn_mov_caja_detalle( " +
									"smn_mov_caja_detalle_id, smn_mov_caja_cabecera_id, mcd_tipo_producto, " +
									"smn_id_rf, mcd_monto_por_pagar_ml, mcd_saldo_pago_ml, mcd_monto_por_pagar_ma, " +
									"mcd_saldo_pago_ma, smn_moneda_rf, smn_tasa_rf, mcd_idioma, mcd_usuario, " +
									"mcd_fecha_registro, mcd_hora, mcd_prestador_servicio, smn_contratante_clase_rf, smn_contratante_rf) " +
								" SELECT nextval('smn_caja.seq_smn_mov_caja_detalle'), "+rsCabeceraCaja.getInt("smn_mov_caja_cabecera_id")+", 'SS', " +
								"smn_servicios_rf, inm_monto_ml, inm_monto_ml, " +
								"inm_monto_ma, inm_monto_ma, smn_moneda_rf, smn_tasa_rf, " + 
								"'es', '"+inputParams.getString("usuario")+"','" +fechaActual+"', '"+hora2+"', '0', '0', '0' "+
								"FROM smn_salud.smn_ingreso_movimiento WHERE smn_ingreso_id = "+ inputParams.getInt("id_ingreso")+" AND smn_servicios_rf not in (SELECT smn_id_rf FROM smn_caja.smn_mov_caja_detalle WHERE mcd_tipo_producto = 'SS' AND smn_mov_caja_cabecera_id = "+rsCabeceraCaja.getInt("smn_mov_caja_cabecera_id")+" AND mcd_fecha_registro <> current_date) order by smn_ingresos_mov_id desc";
							
							str = str + "3.1.- Insertando Caja Detalle"+ " \n";
							
							db.exec(sqlInsertDetalleCaja);
							
							str = str + "Paciente atendido"+ " \n";
							//System.out.println("Paciente atendido");
							
							/*Marcar a paciente como atendido*/
							String sqlUpdRuta = getResource("update-RutaPaciente.sql");
							sqlUpdRuta = getSQL(sqlUpdRuta, inputParams);
							db.exec(sqlUpdRuta);
							
						}
						
						CallPrestationServices(conn, inputParams, str,bw);
																					
					}else{
						
						//revertir estado a ingreso mov y restar monto en la cabecera
						
						//existen registros en mov procesados?
						if(rsServicio_aux.getRecordCount() > 0) {
							
							str = str + "Existen "+rsServicio_aux.getRecordCount()+ " registro(s) para revertir \n";						
							
							while (rsServicio_aux.next())
							{												
								String sqlUpdCabecera_Revert = getResource("update-PrecioCabecera_Revert.sql");
								sqlUpdCabecera_Revert = getSQL(sqlUpdCabecera_Revert, rsServicio_aux);
								db.exec(sqlUpdCabecera_Revert);
							}
						}
		
						str = str + "El ID ingreso no existe o hubo una falla a nivel de configuración, ver log"+ " \n";
						
						str = str + "El proceso no ha sido completado satisfactoriamente"+ " \n";
					}
					
					//Algo pasó, no se completo el paso 3
					
					
									
				}else{
					str = str + "No existen registros"+ " \n";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					rc = 1;
					return 1;
				}
				
				CallPrestationServices(conn, inputParams, str,bw);
				
			}else{
				str = str+ "El status financiero del Ingreso ID: " + inputParams.getInt("id_ingreso") + " no es Pendiente, no se pueden procesar servicios \n";
			}
				
			str = str + "Fin procesamiento!!!"+ " \n";
			//str = str + "Ejecutado exitosamente"+ " \n";
			//System.out.println("Fin procesamiento!!!");
		} 
		catch (Throwable e)
		{
			conn.rollback();
			throw e;
		}
		finally
		{
			if(rc == 0)
			{
				conn.commit();
				str = "Cambios en la base de datos guardados correctamente";	
				bw.write(str);
				bw.flush();
				bw.newLine();
			}
			else
			{
				conn.rollback();
				str = "Los cambios en la base de datos no se guardaron";	
				bw.write(str);
				bw.flush();
				bw.newLine();
			}
		}

		return rc;
		
	}
	
	protected Recordset getPriceService(Db db, Recordset rsIngresosMov,  String str, BufferedWriter bw) throws Throwable {
		String tipo_precio = rsIngresosMov.getString("tipo_precio");
		String sqlCheckPrecioServicio="";
		int rc = 0;
		
		//crea un recordset con la data obtenida

		try{
			//int contratante = rsIngresosMov.getInt("smn_contrantante_id");
			if(tipo_precio.equals("G")){
				bw.write(tipo_precio);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", tipo_precio);
				sqlCheckPrecioServicio = getSQL(getResource("sql-ConsultarPrecioG.sql"), rsIngresosMov);
				
			}
			
			if(tipo_precio.equals("C")){
				bw.write(tipo_precio);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", tipo_precio);
				sqlCheckPrecioServicio = getSQL(getResource("sql-ConsultarPrecioC.sql"), rsIngresosMov);	
			}
			
			if(tipo_precio.equals("E")){
				bw.write(tipo_precio);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", tipo_precio);
				sqlCheckPrecioServicio = getSQL(getResource("sql-ConsultarPrecioE.sql"), rsIngresosMov);	
			}
			
			Recordset rsServicio = db.get(sqlCheckPrecioServicio);
			if(rsServicio.getRecordCount()>0){
				rsServicio.first();
				//return rsServicio;
			}
			
			return rsServicio;
		}catch (Throwable e)
		{
			
			throw e;
			
			/*str = str + "No existen registros"+ " \n";
			bw.write(str);
			bw.flush();
			bw.newLine();
			getRequest().setAttribute("mensaje", str);
			rc = 1;*/
			//return 1;
		}
		
		//return rc;
	}
	
public int CallPrestationServices(Connection conn, Recordset inputParams, String str, BufferedWriter bw) throws Throwable{
		
		//default return code
		int rc = 0;

		//get security datasource
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		this.setConnection(conn);
		conn.setAutoCommit(false);		
		try {
			
			//get db channel
			Db db = getDb();
			str = str + "INICIO PROCESO PRESTACION SERVICIO AUTOMATICO"+ " \n";	
	
			String sqlCheckIng = getSQL(getResource("sql-consultaCabecera_group.sql"), inputParams);
			Recordset rsPrestacion = db.get(sqlCheckIng);
			
			if(rsPrestacion.getRecordCount() > 0) {
					
				while(rsPrestacion.next()){
						
						String sqlInsertOF = getResource("insert-prestacionCabecera.sql");
						sqlInsertOF = getSQL(sqlInsertOF, rsPrestacion);
						
						Recordset rsPrestacionDb =db.get(sqlInsertOF);
						rsPrestacionDb.first();
						inputParams.setValue("smn_prestacion_servicio_medico_cabecera_id", rsPrestacionDb.getInt("smn_prestacion_servicio_medico_cabecera_id"));
						inputParams.setValue("smn_grupo_prestador_rf", rsPrestacionDb.getInt("smn_grupo_prestador_rf"));
						inputParams.setValue("smn_unidades_servicios_rf", rsPrestacionDb.getInt("smn_unidades_servicios_rf"));
						inputParams.setValue("smn_prestador_servicio_rf", rsPrestacionDb.getInt("smn_prestador_servicio_rf"));
						
						
						str = str+ "Obteniendo ID DE LA CABECERA DE PRESTACION ID: " + rsPrestacionDb.getInt("smn_prestacion_servicio_medico_cabecera_id") + " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
						//db.exec(sqlInsertOF);
						
						str = str + "Fin proceso Agregar Cabecera PRESTACION"+ " \n";
										
						str = str + "Generando PRESTACION SERVICIO DETALLE."+ " \n";
					
					if(rsPrestacionDb.getInt("smn_prestador_servicio_rf") != 0){
						String sqlCheckDPS = getSQL(getResource("sql-consultaDetalle_new.sql"), inputParams);
						Recordset rsDPrestacion = db.get(sqlCheckDPS);
									
						if(rsDPrestacion.getRecordCount() > 0) {
							//rsDPrestacion.first();
							while(rsDPrestacion.next()){
								str  = str + "Creando Detalle"+ " \n";
								//rsDPrestacion.setValue("cabecera_id", cabeceraid);
								String sqlInsertOF2 = getResource("insert-prestacionDetalle.sql");
								sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPrestacion );
								db.exec(sqlInsertOF2);
								
							}
							str = str + "Fin proceso Agregar Detalle PRESTACION"+ " \n";
						}else{
							str = str + "Error getRecordCount del Detalle < 0"+ " \n";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							rc = 1;
							return 1;
						}
					}else{
						String sqlCheckDPS = getSQL(getResource("sql-consultaDetalle_new_isnull.sql"), inputParams);
						Recordset rsDPrestacion = db.get(sqlCheckDPS);
						
						if(rsDPrestacion.getRecordCount() > 0) {
							//rsDPrestacion.first();
							while(rsDPrestacion.next()){
								str  = str + "Creando Detalle"+ " \n";
								//rsDPrestacion.setValue("cabecera_id", cabeceraid);
								String sqlInsertOF2 = getResource("insert-prestacionDetalle.sql");
								sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPrestacion );
								db.exec(sqlInsertOF2);
								
							}
							str = str + "Fin proceso Agregar Detalle PRESTACION"+ " \n";
						}else{
							str = str + "Error getRecordCount del Detalle < 0"+ " \n";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							rc = 1;
							return 1;
						}
					}
				}
			}else{
				str = str + "Error getRecordCount de la Cabecera < 0"+ " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc = 1;
				return 1;
			}
			
			
	}catch (Throwable e)
		{
		conn.rollback();
		throw e;
	}
	finally
	{
		if(rc == 0)
		{
			conn.commit();
			str = "Cambios en la base de datos guardados correctamente";	
			bw.write(str);
			bw.flush();
			bw.newLine();
		}
		else
		{
			conn.rollback();
			str = "Los cambios en la base de datos no se guardaron";	
			bw.write(str);
			bw.flush();
			bw.newLine();
		}
	}

	return rc;
	
	}
}
