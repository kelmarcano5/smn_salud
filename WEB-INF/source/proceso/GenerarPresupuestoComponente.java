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

public class GenerarPresupuestoComponente extends GenericTransaction {
	
	public int service(Recordset inputParams) throws Throwable{
			
		//default return code
		int rc = 0;
		//String response = "";
		String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String sistemaOperativo = System.getProperty("os.name");
		String file;
		
		if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
			file =  "C:/log/log_GenerarPresComponentes"+fechaActual+".txt";
		else
			file = "./log_GenerarPresComponentes"+fechaActual+".txt";
		
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
			str = str + "Consultando Presupuesto Detalle"+ " \n";	
			
			 //str = str + "Borra los componentes: "+ rs.getInt("smn_presupuesto_id") + " \n";	
			 
			
			
			
			String sqlUpdRuta = getResource("eliminarComponentes.sql");
			sqlUpdRuta = getSQL(sqlUpdRuta, inputParams);
			db.exec(sqlUpdRuta);
				
			String sqlcheck = getSQL(getResource("query.sql"), inputParams);
			Recordset rs = db.get(sqlcheck);
				
			if(rs.getRecordCount() > 0) {
	
				while(rs.next()){
					
					inputParams.setValue("smn_presupuesto_detalle_id", rs.getInt("smn_presupuesto_detalle_id"));
					inputParams.setValue("smn_servicios_rf", rs.getInt("smn_servicios_rf"));
					
					String sql_componentes = getSQL(getResource("query_componentes.sql"), inputParams);
					Recordset rsCo = db.get(sql_componentes);
	
					if(rsCo.getRecordCount()>0){
						while(rsCo.next()){									
							String sqlInsert = getResource("insert_lo.sql");
							sqlInsert = getSQL(sqlInsert, rsCo);
							db.exec(sqlInsert);
						}
					}else{
						str = str + "Error getRecordCount del presupuesto componente < 0"+ " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
						rc = 1;
						return 1;
				  }
					//rsCompo.next();
					
				}
				
				str  = str + "END PRESUPUESTO DETALLE ID"+ " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				
			}else{
				str = str + "Error al crear el detalle"+ " \n";
				bw.write(str);
			    bw.flush();
			    bw.newLine();
			    getRequest().setAttribute("mensaje", str);
				rc = 1;
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
