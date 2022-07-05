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

public class aprobarPresupuesto extends  GenericTransaction{
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
			file =  "C:/log/log_AprobarPresupuesto"+fechaActual+".txt";
		else
			file = "./log_AprobarPresupuesto"+fechaActual+".txt";
		
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
			
			String sqlUpdRuta = getResource("updateEstatusPresupuesto.sql");
			sqlUpdRuta = getSQL(sqlUpdRuta, inputParams);
			db.exec(sqlUpdRuta);
			
			String sqlCheckIng = getSQL(getResource("select-presupuesto.sql"), inputParams);
			Recordset rsPresupuesto = db.get(sqlCheckIng);
			
			if(rsPresupuesto.getRecordCount() > 0) {
				rsPresupuesto.first();
				inputParams.setValue("smn_estado_presupuesto_id", rsPresupuesto.getInt("smn_estado_presupuesto_id"));
				str = str+ "Obteniendo Estatus del Presupuesto en ID: " + rsPresupuesto.getInt("smn_estado_presupuesto_id") + " \n";
				
				//*** SI EL PRESUPUESTO ES IGUAL A 4(APROBADO) ENTONCES INSERTA LA CABECERA DEL ***//
				//*** INGRESO HOSPITALIZACION CON LOS DATOS DE LA CABECERA DEL PRESUPUESTO ***//
				if(rsPresupuesto.getInt("smn_estado_presupuesto_id") == 4){
					
					inputParams.setValue("smn_ingresos_id", rsPresupuesto.getInt("smn_ingresos_id"));
					inputParams.setValue("smn_clase_rf", rsPresupuesto.getInt("smn_clase_rf"));
					inputParams.setValue("smn_auxiliar_rf", rsPresupuesto.getInt("smn_auxiliar_rf"));
					
					String updateIngreso = getResource("updatePresupuestoIngreso.sql");
					updateIngreso = getSQL(updateIngreso, inputParams);
					db.exec(updateIngreso);
					
					String sqlCheckPreDet = getSQL(getResource("select-presupuesto_det.sql"), inputParams);
					Recordset rsPreDetDb = db.get(sqlCheckPreDet);
					
					if(rsPreDetDb.getRecordCount() > 0){
						while(rsPreDetDb.next()){
							str  = str + "Creando Detalle"+ " \n";
							String sqlInsertDet = getResource("insert_ingreso_det.sql");
							sqlInsertDet = getSQL(sqlInsertDet, rsPreDetDb);
							db.exec(sqlInsertDet);
						}
						
					}else{
						str = str + "Error getRecordCount del MOV CAJA DETALLE < 0"+ " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
						rc = 1;
					}
				}else{
					str = str + "Estatus del presupuesto es diferente de aprobado"+ " \n";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					rc = 1;
				}
				
			}else{
				str = str + "Error getRecordCount al consultar el presupuesto en la linea 56 < 0"+ " \n";
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
			getRequest().setAttribute("mensaje", str);

		}
		else{
			conn.rollback();
			str = "Los cambios en la base de datos no se guardaron";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			getRequest().setAttribute("mensaje", str);
		}
	}

	return rc;
	
	}
}

	 

