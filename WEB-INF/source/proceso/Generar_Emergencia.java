package proceso;

import dinamica.*;

import javax.sql.DataSource;

import org.omg.PortableServer.ServantLocatorHelper;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Generar_Emergencia extends GenericTransaction{

	/* (non-Javadoc)
	 * @see dinamica.GenericTransaction#service(dinamica.Recordset)
	 */
	
	public int service(Recordset inputParams) throws Throwable{
		
		int rc = 0;
		//String response = "";
		String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String sistemaOperativo = System.getProperty("os.name");
		String file;
		
		if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
			file =  "C:/log/log_ProcesarSaludMovimientoIngresoEmerg"+fechaActual+".txt";
		else
			file = "./log_ProcesarSaludMovimientoIngresoEmerg"+fechaActual+".txt";
		
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
				String sqlEx = getSQL(getResource("verificasiexiste.sql"), inputParams);
				Recordset rsE = db.get(sqlEx);
				
				   if(rsE.getRecordCount() > 0 ){
					   rsE.first();	
					   bw.write(str);
					   bw.flush();
					   bw.newLine();
					   getRequest().setAttribute("mensaje", str);
					   rsE.first();
						inputParams.setValue("smn_pedido_cabecera_id", rsE.getInt("smn_pedido_cabecera_id"));
						inputParams.setValue("id_ingreso", rsE.getInt("id_ingreso"));
						
								String sqlCheckDPed = getSQL(getResource("consulta-para-pedido-detalle.sql"), inputParams);
								Recordset rsDPedido = db.get(sqlCheckDPed);
								
								if(rsDPedido.getRecordCount() > 0) {
										while(rsDPedido.next()){
											str  = str + "Creando Detalle del Pedido"+ " \n";
											String sqlInsertOF2 = getResource("insert-pedido-detalle_si_existe.sql");
											sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPedido);
																		
											Recordset rsPrestacionDb = db.get(sqlInsertOF2);
											rsPrestacionDb.first();
											inputParams.setValue("smn_pedido_detalle_id", rsPrestacionDb.getInt("smn_pedido_detalle_id"));
											inputParams.setValue("smn_servicios_rf", rsPrestacionDb.getInt("smn_servicios_rf"));
											inputParams.setValue("smn_ingresos_mov_id", rsPrestacionDb.getInt("smn_ingresos_mov_id"));
											inputParams.setValue("smn_pedido_cabecera_id", rsPrestacionDb.getInt("smn_pedido_cabecera_id"));
											
											String sqlComp = getSQL(getResource("sql-consultaComponentes.sql"), inputParams);
											Recordset rsComp = db.get(sqlComp);
													
												if(rsComp.getRecordCount() > 0) {
													str = str + "Insert Pedido Componentes."+ " \n";					
													while(rsComp.next()){
														str = str + "Monto componente ML="+ rsComp.getString("monto_componente_ml") +" \n";
														str = str + "Monto componente MA="+ rsComp.getString("monto_componente_ma") +" \n";
														
														String sqlInsertComp= getResource("insert-pedidocomp.sql");
														sqlInsertComp = getSQL(sqlInsertComp, rsComp);
														db.exec(sqlInsertComp);							
													}
												
													str  = str + "FIN Pedido Compnente"+ " \n";
													bw.write(str);
													bw.flush();
													bw.newLine();
													getRequest().setAttribute("mensaje", str);
												}else{
													str = str + "Error al crear el Pedido Compnentes"+ " \n";
													bw.write(str);
													bw.flush();
													bw.newLine();
													getRequest().setAttribute("mensaje", str);
													rc = 1;
												}	
										}		
									}
									str = str + "Registro de Detalle Pedido finalizado"+ " \n";	
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
				   }else{
							 //verificar si se tiene registros en el movimiento del Ingreso a procesar
								String sqlCheckIngresosMov = getSQL(getResource("sql-RegistrosMovimiento.sql"), inputParams);
								//crea un recordset con la data obtenida
								Recordset rsIngresosMov = db.get(sqlCheckIngresosMov);
							    rsIngresosMov.first();
								//Recordset rsServicio_aux = new Recordset();							
								//rsServicio_aux = rsIngresosMov.copy();
							    
							   // rsServicio_aux.first();
								//str = str + "Entro en el else: "+ rsIngresosMov.getInt("id_ingreso") + " \n";	
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
									while (rsIngresosMov.next()){
										//System.out.println("1.- Validando Precio del Servicio");
										str = str + "1.- Validando Precio del Servicio"+ " \n";
										str = str + "Servicio: "+ rsIngresosMov.getInt("smn_servicios_rf") + " del ID Mov: " + rsIngresosMov.getInt("smn_ingresos_mov_id");
									
										Recordset rsServicio = getPriceService(db, rsIngresosMov, str, bw);
										if (rsServicio.getRecordCount() > 0){
											str = str + ", precio: " + rsServicio.getDouble("smn_precio_neto_ml_servicio") + ", tipo de precio : " + rsIngresosMov.getString("tipo_precio") + " \n";
											bw.write(str);
											bw.flush();
											bw.newLine();
											getRequest().setAttribute("mensaje", str);
											rsServicio.setValue( "id_detalle", rsIngresosMov.getInt("smn_ingresos_mov_id"));
											rsServicio.setValue( "id_ingreso", inputParams.getInt("id_ingreso"));
											
											//Actualizar precio de la cabecera
											String sqlUpdCabecera = getResource("update-PrecioCabecera.sql");
											sqlUpdCabecera = getSQL(sqlUpdCabecera, rsServicio);
											db.exec(sqlUpdCabecera);
										}else{
											//System.out.println("2.- Validando Ruta");
											str = str + "Error en el precio del servicio por favor verificar"+ " \n";
											bw.write(str);
											bw.flush();
											bw.newLine();
											getRequest().setAttribute("mensaje", str);	
										}
										
										//System.out.println("2.- Validando Ruta");
										str = str + "2.- Validando Ruta"+ " \n";
										bw.write(str);
										bw.flush();
										bw.newLine();
										getRequest().setAttribute("mensaje", str);		
									}
									
													
								}else{
									str = str + "No existen registros"+ " \n";
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									rc = 1;
									return 1;
								}
								
							//CODIGO PARA INSERTAR EN PEDIDO CABECERA	
							String sqlCheckPed = getSQL(getResource("consulta-para-pedido.sql"), inputParams);
							Recordset rsMovimientoPedido = db.get(sqlCheckPed);
							
							if(rsMovimientoPedido.getRecordCount() > 0) {
								rsMovimientoPedido.first();	
								str = str + "Insertando Pedido Cabecera con ID: "+ rsMovimientoPedido.getInt("id_ingreso") + " \n";
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								
							
								String sqlInsertOF = getResource("insert-pedido.sql");
								sqlInsertOF = getSQL(sqlInsertOF, rsMovimientoPedido);
								//db.exec(sqlInsertOF);
								
								Recordset rsCab = db.get(sqlInsertOF);
								rsCab.first();
								inputParams.setValue("smn_pedido_cabecera_id", rsCab.getInt("smn_pedido_cabecera_id"));
								
								str = str + "Fin proceso Agregar Cabecera Pedido"+ " \n";		
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								
								String sqlCheckDPed = getSQL(getResource("consulta-para-pedido-detalle.sql"), inputParams);
								Recordset rsDPedido = db.get(sqlCheckDPed);
								
								if(rsDPedido.getRecordCount() > 0) {
										while(rsDPedido.next()){
											str  = str + "Creando Detalle del Pedido"+ " \n";
											String sqlInsertOF2 = getResource("insert-pedido-detalle.sql");
											sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPedido);
											
											Recordset rsPrestacionDb = db.get(sqlInsertOF2);
											rsPrestacionDb.first();
											inputParams.setValue("smn_pedido_detalle_id", rsPrestacionDb.getInt("smn_pedido_detalle_id"));
											inputParams.setValue("smn_servicios_rf", rsPrestacionDb.getInt("smn_servicios_rf"));
											inputParams.setValue("smn_ingresos_mov_id", rsPrestacionDb.getInt("smn_ingresos_mov_id"));
											inputParams.setValue("smn_pedido_cabecera_id", rsPrestacionDb.getInt("smn_pedido_cabecera_id"));
											
											String sqlComp = getSQL(getResource("sql-consultaComponentes.sql"), inputParams);
											Recordset rsComp = db.get(sqlComp);
													
												if(rsComp.getRecordCount() > 0) {
													str = str + "Insert Pedido Componentes."+ " \n";					
													while(rsComp.next()){
														str = str + "Monto componente ML="+ rsComp.getString("monto_componente_ml") +" \n";
														str = str + "Monto componente MA="+ rsComp.getString("monto_componente_ma") +" \n";
														
														String sqlInsertComp= getResource("insert-pedidocomp.sql");
														sqlInsertComp = getSQL(sqlInsertComp, rsComp);
														db.exec(sqlInsertComp);							
													}
												
													str  = str + "FIN Pedido Compnente"+ " \n";
													bw.write(str);
													bw.flush();
													bw.newLine();
													getRequest().setAttribute("mensaje", str);
												}else{
													str = str + "Error al crear el Pedido Compnentes"+ " \n";
													bw.write(str);
													bw.flush();
													bw.newLine();
													getRequest().setAttribute("mensaje", str);
													rc = 1;
												}	
										}		
									}
									str = str + "Registro de Detalle Pedido finalizado"+ " \n";	
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
							}
							
							//CODIGO PARA GENERACION DE PRESTACION CABECERA
							String sqlCheckIng = getSQL(getResource("sql-consultaCabecera.sql"), inputParams);
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
									
									str = str+ "Obteniendo ID DE LA CABECERA DE PRESTACION ID: " + rsPrestacionDb.getInt("smn_prestacion_servicio_medico_cabecera_id") + " \n";
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									//db.exec(sqlInsertOF);
									
									str = str + "Fin proceso Agregar Cabecera PRESTACION"+ " \n";			
									str = str + "Generando PRESTACION SERVICIO DETALLE."+ " \n";
								
									String sqlCheckDPS = getSQL(getResource("sql-consultaDetalle.sql"), inputParams);
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
							}else{
								str = str + "Error getRecordCount de la Cabecera < 0"+ " \n";
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								rc = 1;
								return 1;
							}
				     }
			}
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
				//CallPrestationServices(conn, inputParams, str,bw);
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
		}

	}
}
