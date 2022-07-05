/**
 * 
 */
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

/**
 * @author kelvin marcano
 * Este genere agarra la informacion grabada en plan quirurgico y lo inserta en el control quirurgico
 */
public class GenerarPlanQuirurgico extends GenericTransaction{
	public int service(Recordset inputParams) throws Throwable{
		int rc = 0;
		//String response = "";
		String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String sistemaOperativo = System.getProperty("os.name");
		String file;
		
		if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
			file =  "C:/log/log_PlanQuirurgico"+fechaActual+".txt";
		else
			file = "./log_PlanQuirurgico"+fechaActual+".txt";
		
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
		
		try{
			Db db = getDb();
			str = "-----Procesar Plan Quirurgico-----"+timestamp+"-----a control quirofano-----";
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			 String sqlValRelPlan = getSQL(getResource("select-verificarRelacion.sql"), inputParams);
			 Recordset rsValRel = db.get(sqlValRelPlan);
			   
			   if(rsValRel.getRecordCount() > 0){
			
					String sqlPlan = getSQL(getResource("select-plan-quirurgico.sql"), inputParams);
					Recordset rsPlanQuirurgico = db.get(sqlPlan);
					
					if(rsPlanQuirurgico.getRecordCount() > 0) {
						  str = str + "Inicio proceso Control Quirofano"+ " \n";
						  bw.write(str);
						  bw.flush();
						  bw.newLine();
						  
						  rsPlanQuirurgico.first();
						  
						  String sqlInsertOF = getResource("InsertControlQuirofano.sql");
						  sqlInsertOF = getSQL(sqlInsertOF, rsPlanQuirurgico);
		
						  Recordset parametros = db.get(sqlInsertOF);
						  parametros.first();
						  inputParams.setValue("smn_control_quirofano_id", parametros.getInt("smn_control_quirofano_id"));
						 			   
						   String sqlRelPlan = getSQL(getResource("select-relacion_plan_quirurgico.sql"), inputParams);
						   Recordset rsRel = db.get(sqlRelPlan);
							   
							if(rsRel.getRecordCount() > 0) {
								while(rsRel.next()){
							       String sqlInsertRel = getResource("InsertRelacionControlQuirurgico.sql");
							       sqlInsertRel = getSQL(sqlInsertRel, rsRel);
								   db.exec(sqlInsertRel);
								}
								str = str + "Fin proceso Agregando Relacion Control Quirofano"+ " \n";
								bw.write(str);
								bw.flush();
							    bw.newLine();
							}else{
								str = str + "Error Agregando Ingreso Mov"+ " \n";
								bw.write(str);
								bw.flush();
							    bw.newLine();
							    getRequest().setAttribute("mensaje", str);
								rc = 1;
							}
						}else{
							str = str + "Error Agregando Ingreso Cab"+ " \n";
							bw.write(str);
							bw.flush();
						    bw.newLine();
						    getRequest().setAttribute("mensaje", str);
							rc = 1;
						}
			   }else{
				   str = str + "Registro no procesado no existe relacion creada a ese plan quirurgico verifique su informacion"+ " \n";
					bw.write(str);
					bw.flush();
				    bw.newLine();
				    getRequest().setAttribute("mensaje", str);
					rc = 1;
			   }
			
		}catch (Throwable e){
			conn.rollback();
			throw e;
	}finally{
		if(rc == 0){
			conn.commit();
			str = "Cambios en la base de datos guardados correctamente";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			getRequest().setAttribute("mensaje", str);
			
		}else{
			conn.rollback();
			str = "Los cambios en la base de datos no se guardaron";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			getRequest().setAttribute("mensaje", str);
			rc = 1;
		}
	}
	return rc;
	
	}
}
