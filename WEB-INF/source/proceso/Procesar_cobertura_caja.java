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

public class Procesar_cobertura_caja extends  GenericTransaction{
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
			file =  "C:/log/log_ProcesarSaludCoberturaIngHosp"+fechaActual+".txt";
		else
			file = "./log_ProcesarSaludCoberturaIngHosp"+fechaActual+".txt";
		
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
			boolean procesamiento_caja = true;
			str = "Inicio proceso"+ " \n";
			String sqlCheckIng = getSQL(getResource("select-cob_cab.sql"), inputParams);
			Recordset rsCaja = db.get(sqlCheckIng);
			
			if(rsCaja.getRecordCount() > 0) {
				
			
				while(rsCaja.next()){
					String sqlInsertOF = getResource("insert_cab_caja.sql");
					sqlInsertOF = getSQL(sqlInsertOF, rsCaja);
					
					Recordset rsCajaDb = db.get(sqlInsertOF);
					rsCajaDb.first();
					inputParams.setValue("smn_mov_caja_cabecera_id", rsCajaDb.getInt("smn_mov_caja_cabecera_id"));
					inputParams.setValue("smn_documento_id", rsCajaDb.getInt("smn_documento_id"));
					inputParams.setValue("igs_monto_moneda_local", rsCajaDb.getDouble("igs_monto_moneda_local"));
					inputParams.setValue("igs_monto_moneda_alternal", rsCajaDb.getDouble("igs_monto_moneda_alternal"));
					inputParams.setValue("smn_moneda_rf", rsCajaDb.getInt("smn_moneda_rf"));
					inputParams.setValue("smn_tasa_rf", rsCajaDb.getInt("smn_tasa_rf"));
										
					str = str+ "Obteniendo ID DE LA CABECERA DE LA CAJA: " + rsCajaDb.getInt("smn_mov_caja_cabecera_id") + " \n";
					str = str+ "Obteniendo ID DE LA CABECERA DE LA CAJA: " + rsCajaDb.getInt("smn_documento_id") + " \n";
					
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					
					str = str + "Fin proceso Agregar CAJA Cabecera "+ " \n";			
					str = str + "Generando MOV CAJA DETALLE."+ " \n";
					
					String sqlCheckDPS = getSQL(getResource("select-cob_det.sql"), inputParams);
					Recordset rsCajaDetDb = db.get(sqlCheckDPS);
					
					if(rsCajaDetDb.getRecordCount() > 0) {
						rsCajaDetDb.first();
							str  = str + "Creando Detalle"+ " \n";
							String sqlInsertOF2 = getResource("insert_det_caja.sql");
							sqlInsertOF2 = getSQL(sqlInsertOF2, rsCajaDetDb);
							db.exec(sqlInsertOF2);
							
						str = str + "Fin proceso Agregar MOV CAJA DETALLE"+ " \n";
					}else{
						str = str + "Error getRecordCount del MOV CAJA DETALLE < 0"+ " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
						rc = 1;
					}
				}
				
				
			   String sqlUpdRuta = getResource("update-cobertura.sql");
			   sqlUpdRuta = getSQL(sqlUpdRuta, inputParams);
			   db.exec(sqlUpdRuta);
			}else{
				str = str + "Error getRecordCount de la CAJA Cabecera < 0"+ " \n";
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
	finally{
		if(rc == 0){
			conn.commit();
			str = "Cambios en la base de datos guardados correctamente";	
			bw.write(str);
			bw.flush();
			bw.newLine();
		}
		else{
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

	 

