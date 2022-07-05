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

public class GenerarRecipeMedicoPrest extends GenericTransaction {
	public int service(Recordset inputParams) throws Throwable{
		
		//default return code
		int rc = 0;
		//String response = "";
		String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String sistemaOperativo = System.getProperty("os.name");
		String file;
		
		if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
			file =  "C:/log/log_GenerarRecipeMedicoPrest"+fechaActual+".txt";
		else
			file = "./log_GenerarRecipeMedicoPrest"+fechaActual+".txt";
		
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
			
			String sqlcheck = getSQL(getResource("query_recipe_medico.sql"), inputParams);
			Recordset rs = db.get(sqlcheck);
			if(rs.getRecordCount() > 0) {	
			   rs.first();
			   str = str + "ID RECIPE MEDICO "+ rs.getInt("smn_recipe_medico_id") + " \n";	
			   str = str + "ID INGRESOS "+ rs.getInt("smn_ingreso_id") + " \n";	
			   String sqlInsert = getResource("insert-insert_prestacion_medico_cab.sql"); 
			   sqlInsert = getSQL(sqlInsert, rs);
			   Recordset rsPrestacionDb = db.get(sqlInsert);
			   rsPrestacionDb.first();
			   inputParams.setValue("smn_prestacion_servicio_medico_cabecera_id", rsPrestacionDb.getInt("smn_prestacion_servicio_medico_cabecera_id"));
			   inputParams.setValue("smn_recipe_medico_id", rsPrestacionDb.getInt("smn_recipe_medico_id"));
			   inputParams.setValue("smn_ingreso_id", rsPrestacionDb.getInt("smn_ingreso_id"));
			   inputParams.setValue("smn_documento_id", rsPrestacionDb.getInt("smn_documento_id"));
			   
			 //Actualizar precio de la cabecera
				String sqlUpdCabecera = getResource("update-orden_medica.sql");
				sqlUpdCabecera = getSQL(sqlUpdCabecera, rs);
				db.exec(sqlUpdCabecera);
			   
			   		String sqlComp = getSQL(getResource("query_recipe_medico_det.sql"), inputParams);
			   		Recordset rsComp = db.get(sqlComp);
						
					if(rsComp.getRecordCount() > 0) {
						str = str + "Insert Prestacion Det."+ " \n";					
						while(rsComp.next()){
							String sqlInsertComp= getResource("insert_prestacion_medico_det.sql");
							sqlInsertComp = getSQL(sqlInsertComp, rsComp);
							 Recordset rsDetMov = db.get(sqlInsertComp);
							 rsDetMov.first();
							 inputParams.setValue("smn_recipe_medico_id", rsDetMov.getInt("smn_recipe_medico_id"));
							 inputParams.setValue("smn_ingreso_id", rsDetMov.getInt("smn_ingreso_id"));
							 inputParams.setValue("smn_documento_id", rsDetMov.getInt("smn_documento_id"));
							 inputParams.setValue("rmd_dosis_total", rsDetMov.getInt("rmd_dosis_total"));
							 inputParams.setValue("smn_prestador_servicio_rf", rsDetMov.getInt("smn_prestador_servicio_rf"));
						}
					
						/*String sqlM = getSQL(getResource("query_recipe_medico_det_mov.sql"), inputParams);
					   	Recordset rsMov = db.get(sqlM);
					   	
					   	if(rsMov.getRecordCount() > 0) {
							//rs.first();
							while(rsMov.next()){
							   String sqlInsert3= getResource("insert-movimiento_ingreso.sql"); 
							   sqlInsert3 = getSQL(sqlInsert3, rsMov);
							   db.exec(sqlInsert3);
							}
							
							str = str + "Movimiento Ingreso Creado"+ " \n";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
						}else{
							str = str + "Error al crear Movimiento Ingreso"+ " \n";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							rc = 1;
						}	   */
					
						str  = str + "FIN Prestacion Det."+ " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
					}else{
						str = str + "Error al crear el Prestacion Detalle"+ " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
						rc = 1;
					}			
			}
		
			
	
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
