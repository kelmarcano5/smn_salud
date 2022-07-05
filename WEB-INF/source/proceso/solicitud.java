package proceso;

import java.sql.Connection;
import java.sql.Timestamp;

import javax.sql.DataSource;

import dinamica.Db;
import dinamica.GenericTransaction;
import dinamica.Jndi;
import dinamica.Recordset;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

public class solicitud extends GenericTransaction {
	
	public int service(Recordset inputParams) throws Throwable{
			
	int rc = 0;
	//String response = "";
	String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String sistemaOperativo = System.getProperty("os.name");
	String file;
	
	if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
		file =  "C:/log/log_SolicitudDespacho"+fechaActual+".txt";
	else
		file = "./log_SolicitudDespacho"+fechaActual+".txt";
	
	File newLogFile = new File(file);
	FileWriter fw;
	String str="";
	
	if(!newLogFile.exists())
		fw = new FileWriter(newLogFile);
	else
		fw = new FileWriter(newLogFile,true);
	
	BufferedWriter bw=new BufferedWriter(fw);
	
	Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		super.service(inputParams);
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		DataSource ds = Jndi.getDataSource(jndiName); 
		Connection conn = ds.getConnection();
		
		this.setConnection(conn);
		conn.setAutoCommit(false);	
				
		try {		
			str = "----------"+timestamp+"----------";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			bw.newLine();
			
			Db db = getDb();
			str = str + "PROCESAR PEDIDO"+ " \n";	
			bw.write(str);
			bw.flush();
			bw.newLine();	
			
			String sqlCheckPed = getSQL(getResource("query.sql"), inputParams);
			Recordset rsPedido = db.get(sqlCheckPed);
		
			if(rsPedido.getRecordCount() > 0) {
				str = str + ("Registro de Integracion Orden Despacho"+ " \n");
				//str = str + ("Insertando Presupuesto con ID: "+ rsImpuesto.getInt("id_ingreso") + " \n");
				rsPedido.first();
				String sqlInsertImp = getResource("insert.sql");
				sqlInsertImp = getSQL(sqlInsertImp, rsPedido);
				
				Recordset rsPrestacionDb = db.get(sqlInsertImp);
				rsPrestacionDb.first();
				inputParams.setValue("smn_despacho_id", rsPrestacionDb.getInt("smn_despacho_id"));
				
				String sqlCheckDPed = getSQL(getResource("query_det.sql"), inputParams);
				Recordset rsDPedidoD = db.get(sqlCheckDPed);
							
				if(rsDPedidoD.getRecordCount() > 0) {
					//rsDPedidoD.first();
					while(rsDPedidoD.next()){
						str  = str + "Creando Detalle Integracion Orden Despacho"+ " \n";
						
						String sqlInsertOF2 = getResource("insert_det.sql");
						sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPedidoD );
						db.exec(sqlInsertOF2);
					}	
					//str = str + "Registro de Detalle Integracion Orden Despacho finalizado"+ " \n";
					str = str + "Fin proceso Detalle Integracion Orden Despacho"+ " \n";	
					bw.write(str);
					bw.flush();
					bw.newLine();
					
					String sqlCheckMov = getSQL(getResource("query_det_mov.sql"), inputParams);
					Recordset rsMov = db.get(sqlCheckMov);
								
					if(rsMov.getRecordCount() > 0) {
						//rsDPedidoD.first();
						while(rsMov.next()){
							str  = str + "Creando Movimiento Ingreso"+ " \n";
							String sqlInsertMov = getResource("insert-movimiento_ingreso.sql");
							sqlInsertMov = getSQL(sqlInsertMov, rsMov);
							db.exec(sqlInsertMov);
						}	
						//str = str + "Registro de Detalle Integracion Orden Despacho finalizado"+ " \n";
						str = str + "Fin proceso Detalle Integracion Orden Despacho"+ " \n";	
						bw.write(str);
						bw.flush();
						bw.newLine();
							
					}else{
						str = str + "Error al crear el Ingreso Movimiento"+ " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
						rc = 1;
					}
				}else{
					str = str + "Error al crear el detalle de Integracion Orden Despacho"+ " \n";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					rc = 1;
				}
				
				//CODIGO DE INSERCION EN PEDIDOS DETALLE
				String sqlCheckPedId = getSQL(getResource("select-smn_pedido_cabecera_id.sql"), inputParams);
				Recordset rsMovimientoPedido = db.get(sqlCheckPedId);
				
				if(rsMovimientoPedido.getRecordCount() > 0) {
					
					rsMovimientoPedido.first();	
					inputParams.setValue("smn_pedido_cabecera_id", rsMovimientoPedido.getInt("smn_pedido_cabecera_id"));
					inputParams.setValue("smn_mov_caja_cabecera_id", rsMovimientoPedido.getInt("smn_mov_caja_cabecera_id"));
					
					str = str + "Insertando Pedido Detalle con ID: "+ rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					
						String sqlCheck = getSQL(getResource("select-consulta_detalle.sql"), inputParams);
						Recordset rsDet = db.get(sqlCheck);
						
						if(rsDet.getRecordCount() > 0) {
							while(rsDet.next()){
								str  = str + "Creando Detalle del Pedido"+ " \n";
								String sqlInsertDet = getResource("insert-pedidodetalle.sql");
								sqlInsertDet = getSQL(sqlInsertDet, rsDet);

								Recordset rsPrestacionDb2=db.get(sqlInsertDet);
								rsPrestacionDb2.first();
								inputParams.setValue("smn_pedido_detalle_id", rsPrestacionDb2.getInt("smn_pedido_detalle_id"));
								inputParams.setValue("smn_servicios_rf", rsPrestacionDb2.getInt("smn_servicios_rf"));
								inputParams.setValue("smn_pedido_cabecera_id", rsPrestacionDb2.getInt("smn_pedido_cabecera_id"));
								inputParams.setValue("smn_prestacion_servicio_medico_cabecera_id", rsPrestacionDb2.getInt("smn_prestacion_servicio_medico_cabecera_id"));
								
								str = str + "Asociando Pedido Componentes."+ " \n";
								String sqlComp = getSQL(getResource("sql-consultaComponentes.sql"), inputParams);
								Recordset rsComp = db.get(sqlComp);
								
								if(rsComp.getRecordCount() > 0) {
									str = str + "Insert Pedido Componentes."+ " \n";					
									while(rsComp.next()){																
										String sqlInsertComp= getResource("insert-pedidocomp.sql");
										sqlInsertComp = getSQL(sqlInsertComp, rsComp);
										db.exec(sqlInsertComp);
									}
									str  = str + "FIN Pedido Compnente"+ " \n";
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
								}	
							}
						}else{
							str = str + "Error al crear la detalle del Pedido"+ " \n";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							rc = 1;
						}				
				}else{
					str = str + "Error al crear la cabecera del Pedido"+ " \n";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					rc = 1;
				}  
			//Actualizar el estatus del detalle
			String sqlUpdDetalle = getResource("update_solicitud.sql");
			sqlUpdDetalle = getSQL(sqlUpdDetalle, rsDPedidoD);
			db.exec(sqlUpdDetalle);
			
			//Actualizar el estatus del detalle
			String sqlUpdIngresoCab = getResource("update_ingreso_cab.sql");
			sqlUpdIngresoCab = getSQL(sqlUpdIngresoCab, rsDPedidoD);
			db.exec(sqlUpdIngresoCab);
		}else{
			str = str + ("Error al crear la cabecera de la Integracion Orden Despacho"+ " \n");
			bw.write(str);
			bw.flush();
			bw.newLine();
			getRequest().setAttribute("mensaje", str);
			rc = 1;
		}
}catch (Throwable e){
	conn.rollback();
	throw e;
}
finally
{
	if(rc == 0){
		conn.commit();
		str = "Cambios en la base de datos guardados correctamente";	
		bw.write(str);
		bw.flush();
		bw.newLine();
		getRequest().setAttribute("mensaje", "Se aprobo el pedido correctamente");
	}
	else
	{
		conn.rollback();
		str = "Los cambios en la base de datos no se guardaron";	
		bw.write(str);
		bw.flush();
		bw.newLine();
		//getRequest().setAttribute("mensaje", str);
		rc = 1;
		//return 1;
	}
	
	str = "FIN DEL PROCESO";	
			bw.write(str);
			bw.flush();
			bw.newLine();
	        bw.close();
			
			if(conn!=null)
				conn.close();
		}

		return rc;
	}
}

	