package proceso_orig;

import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
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
		
		super.service(inputParams);
		
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		DataSource ds = Jndi.getDataSource(jndiName); 
		Connection conn = ds.getConnection();
		this.setConnection(conn);
				
		try {
		
			Db db = getDb();
			String str="";
			str = str + "PROCESAR NOTA RECEPCION SERVICIO"+ " \n";	
			
			String sqlrecepcion = getSQL(getResource("consultarPagRecServicios.sql"), inputParams);
			Recordset rsrecservicio = db.get(sqlrecepcion);
		
			if(rsrecservicio.getRecordCount() > 0) {
			
				//rsrecservicio.first();
				str = str + "NOTA RECEPCION SERVICIO ID"+ " \n";			
			
				while(rsrecservicio.next()){
					str  = str + "Creando NOTA RECEPCION SERVICIO dentro del while"+ " \n";
					String sqlInsertOF2 = getResource("insertPagRecServicios.sql");
					sqlInsertOF2 = getSQL(sqlInsertOF2, rsrecservicio);
					db.exec(sqlInsertOF2);	
				}
				
				
				////INSERTANDO PEDIDO COMPONENTES
				String sqlpedcomp = getSQL(getResource("consultarPedComponent.sql"), inputParams);
				Recordset rspedcomp = db.get(sqlpedcomp);
			
				if(rspedcomp.getRecordCount() > 0) {
				
					//rsrecservicio.first();
					str = str + "PEDIDO COMPONENTE ID"+ " \n";			
				
					while(rspedcomp.next()){
						str  = str + "Creando PEDIDO COMPONENTE dentro del while"+ " \n";
						String sqlInsertPC = getResource("insertPedComponent.sql");
						sqlInsertPC = getSQL(sqlInsertPC, rspedcomp);
						db.exec(sqlInsertPC);	
					}
							
					str = str + "Registro de PEDIDO COMPONENTE"+ " \n";
					str = str + "Fin proceso PEDIDO COMPONENTE"+ " \n";		
							
				}else{
					str  = str + "Error en el else getRecordCount PEDIDO COMPONENTE"+ " \n";
				}
				
				
						
				str = str + "Registro de NOTA RECEPCION SERVICIO"+ " \n";
				str = str + "Fin proceso NOTA RECEPCION SERVICIO"+ " \n";		
						
			}else{
				str  = str + "Error en el else getRecordCount "+ " \n";
			}
		
			String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
			File newLogFile = new File("E:/data/Simone/smn_salud/log/log_recepcionservicio"+fechaActual+".txt");
			//File newLogFile = new File("D:/data/Simone/smn_comercial/log/log_ProcesarPedido"+fechaActual+".txt");
			//File newLogFile = new File("C:/Users/alexander/Desktop/dinamica/log_ProcesarCaja"+fechaActual+"_"+inputParams.getInt("smn_mov_caja_cabecera_id")+".txt");
	
	        FileWriter fw = new FileWriter(newLogFile);
	        fw.write(str);
	        fw.close();
		}catch (Throwable e){
			throw e;
		}
		finally
		{
			if (conn!=null)
				conn.close();
		}

		return rc;
	}

}
