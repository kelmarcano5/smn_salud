package proceso;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.sql.DataSource;

import dinamica.Db;
import dinamica.GenericTransaction;
import dinamica.Jndi;
import dinamica.Recordset;

public class GenerarOrdenMedicaPrest extends GenericTransaction {
	public int service(Recordset inputParams) throws Throwable{
		
		//default return code
		int rc = 0;
		//String response = "";
		String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String sistemaOperativo = System.getProperty("os.name");
		String file;
		
		if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
			file =  "C:/log/log_GenerarOrdenMedicaPrest"+fechaActual+".txt";
		else
			file = "./log_GenerarOrdenMedicaPrest"+fechaActual+".txt";
		
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
			Db db = getDb();
			//String str="";
			str = str + "Consultando Ordenes Medicas para generar la prestacion de servicio medico cabecera"+ " \n";	
			
			String sqlcheck = getSQL(getResource("query_orden_medica.sql"), inputParams);
			Recordset rs = db.get(sqlcheck);
				
			if(rs.getRecordCount() > 0) {	
	
				   while(rs.next()){
					   String sqlInsert = getResource("insert-insert_prestacion_medico_cab.sql"); 
					   sqlInsert = getSQL(sqlInsert, rs);
					   Recordset rsPrestacionDb = db.get(sqlInsert);
					   
					   rsPrestacionDb.first();
					   inputParams.setValue("smn_prestacion_servicio_medico_cabecera_id", rsPrestacionDb.getInt("smn_prestacion_servicio_medico_cabecera_id"));
					   inputParams.setValue("smn_ingreso_id", rsPrestacionDb.getInt("smn_ingreso_id"));
					   inputParams.setValue("smn_unidades_servicios_rf", rsPrestacionDb.getInt("smn_unidades_servicios_rf"));
					   inputParams.setValue("smn_grupos_prestadores_id", rsPrestacionDb.getInt("smn_grupos_prestadores_id"));
					   inputParams.setValue("smn_prestador_servicio_rf", rsPrestacionDb.getInt("smn_prestador_servicio_rf"));
					   
				   		String sqlComp = getSQL(getResource("query_orden_medica_2.sql"), inputParams);
				   		Recordset rsComp = db.get(sqlComp);
							
						if(rsComp.getRecordCount() > 0) {
							str = str + "Insert Prestacion Det."+ " \n";					
							while(rsComp.next()){
								String sqlInsertComp= getResource("insert_prestacion_medico_det.sql");
								sqlInsertComp = getSQL(sqlInsertComp, rsComp);
								db.exec(sqlInsertComp);
							}
							str  = str + "FIN Prestacion Det."+ " \n";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
						}
				   } 
			}else{
				str = str + "Error al crear prestacion cab y det "+ " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc = 1;
			}
			
			String sqlComp3 = getSQL(getResource("query_det_mov.sql"), inputParams);
	   		Recordset rsComp3 = db.get(sqlComp3);
			
			if(rsComp3.getRecordCount() > 0) {
				//rs.first();
				while(rsComp3.next()){
				   String sqlInsert3= getResource("insert-movimiento_ingreso.sql"); 
				   sqlInsert3 = getSQL(sqlInsert3, rsComp3);
				   db.exec(sqlInsert3);
				}
				
				str = str + "Movimiento Ingreso Creado"+ " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
			}else{
				str = str + "Error al Movimiento Ingreso "+ " \n";
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
				
					String sqlCheckDPed2 = getSQL(getResource("select-consulta_detalle.sql"), inputParams);
					Recordset rsDPedido = db.get(sqlCheckDPed2);
					
					if(rsDPedido.getRecordCount() > 0) {
						while(rsDPedido.next()){
							str  = str + "Creando Detalle del Pedido"+ " \n";
							String sqlInsertOF2 = getResource("insert-pedidodetalle.sql");
							sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPedido);

							Recordset rsPrestacionDb2=db.get(sqlInsertOF2);
							rsPrestacionDb2.first();
							inputParams.setValue("smn_pedido_detalle_id", rsPrestacionDb2.getInt("smn_pedido_detalle_id"));
							inputParams.setValue("smn_servicios_rf", rsPrestacionDb2.getInt("smn_servicios_rf"));
							inputParams.setValue("smn_pedido_cabecera_id", rsPrestacionDb2.getInt("smn_pedido_cabecera_id"));
							inputParams.setValue("ingresoid", rsPrestacionDb2.getInt("ingresoid"));
							//inputParams.setValue("smn_prestacion_servicio_medico_cabecera_id", rsPrestacionDb2.getInt("smn_prestacion_servicio_medico_cabecera_id"));
							
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
							}else{
								str = str + "Error al crear el Pedido Compnentes"+ " \n";
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								rc = 1;
							}
						}
					}else{
						str = str + "Error al crear Pedido Detalle"+ " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
						rc = 1;
					}				
			}else{
				str = str + "Error al crear cabecera del Pedido"+ " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc = 1;
			}  
			//Actualizar precio de la cabecera
			String sqlUpdCabecera = getResource("update-orden_medica.sql");
			sqlUpdCabecera = getSQL(sqlUpdCabecera, rs);
			db.exec(sqlUpdCabecera);
				
			//Actualizar el estatus del detalle
			String sqlUpdIngresoCab = getResource("update_ingreso_cab.sql");
			sqlUpdIngresoCab = getSQL(sqlUpdIngresoCab, rs);
			db.exec(sqlUpdIngresoCab);

}catch (Throwable e){
	str = str + "Error al crear la cabecera "+ " \n";
	bw.write(str);
    bw.flush();
    bw.newLine();
    getRequest().setAttribute("mensaje", str);
	rc = 1;
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
