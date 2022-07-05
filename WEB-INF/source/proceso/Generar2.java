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


public class Generar2 extends GenericTransaction {
	
	/* (non-Javadoc)
	 * @see dinamica.GenericTransaction#pedido(dinamica.Recordset)
	 */
	
	public int service(Recordset inputParams) throws Throwable{
			
		int rc = 0;
		//String response = "";
		String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String sistemaOperativo = System.getProperty("os.name");
		String file;
		
		if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
			file =  "C:/log/log_ProcesandoPSMaPagos"+fechaActual+".txt";
		else
			file = "./log_ProcesandoPSMaPagos"+fechaActual+".txt";
		
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
			str = str + "PROCESAR NOTA RECEPCION SERVICIO"+ " \n";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			String sqlrecepcion = getSQL(getResource("consultarPagRecServicios.sql"), inputParams);
			Recordset rsrecservicio = db.get(sqlrecepcion);
			
			if(rsrecservicio.getRecordCount() > 0) {
							//rsrecservicio.first();
				str = str + "NOTA RECEPCION SERVICIO ID"+ " \n";			
				while(rsrecservicio.next()){
					str  = str + "Creando NOTA RECEPCION SERVICIO dentro del while"+ " \n";
					bw.write(str);
					bw.flush();
					bw.newLine();
					
					String sqlInsertOF2 = getResource("insertPagRecServicios.sql");
					sqlInsertOF2 = getSQL(sqlInsertOF2, rsrecservicio);
					Recordset rsPrestacionDb = db.get(sqlInsertOF2);
					
					rsPrestacionDb.first();
					inputParams.setValue("ingreso", rsPrestacionDb.getInt("ingreso"));
					inputParams.setValue("smn_nota_recepcion_servicio_id", rsPrestacionDb.getInt("smn_nota_recepcion_servicio_id"));
					inputParams.setValue("smn_proveedor_id", rsPrestacionDb.getInt("smn_proveedor_id"));
					
					String rela = getSQL(getResource("verificasiexisteingreso.sql"), inputParams);
					Recordset sqlrela = db.get(rela);
					
					if(sqlrela.getRecordCount()>0 ){
						sqlrela.first();
						String sqlRelation = getResource("insertRelNpNrs.sql");
						sqlRelation = getSQL(sqlRelation, sqlrela);
						db.exec(sqlRelation);
					}else{
						str = str + "Este pago no tiene ingreso relacionado"+ " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
						rc = 1;
					}
				}	
				
				str = str + "UPDATE "+ " \n";
				String sqlUpdRuta = getResource("updateDatos.sql");
				sqlUpdRuta = getSQL(sqlUpdRuta, inputParams);
				db.exec(sqlUpdRuta);
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
			
				str = str + "Registro de NOTA RECEPCION SERVICIO"+ " \n";
				str = str + "Fin proceso NOTA RECEPCION SERVICIO"+ " \n";		
						
			}else{
				str = str + "No retorno datos la primera consulta consultarPagRecServicios.sql "+ " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc = 1;
			}

			String sqlconspres = getSQL(getResource("consultarPedComponent.sql"), inputParams);
			Recordset rsPrestComp = db.get(sqlconspres);

			if(rsPrestComp.getRecordCount() > 0){
				str  = str + "Actualizando Pedido Componentes desde la prestacion de servicio medico detalle"+ " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				rsPrestComp.first();
				String sqlInsertPC = getResource("updatePedidoComponente.sql");
				sqlInsertPC = getSQL(sqlInsertPC, rsPrestComp);
				db.exec(sqlInsertPC);
				
			}else{
				str  = str + "Error en el else getRecordCount UPDATE PRESTADOR PEDIDO COMPONENTES"+ " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc = 1;
				//return 1;
			}	
					
		}catch (Throwable e){
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
				getRequest().setAttribute("mensaje", str);
			}
			else
			{
				conn.rollback();
				str = "Los cambios en la base de datos no se guardaron";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc = 1;
				//return 1;
			}
			
			str = "FIN DEL PROCESO";	
			bw.write(str);
			bw.flush();
			bw.newLine();
		}

		return rc;
	}

}
