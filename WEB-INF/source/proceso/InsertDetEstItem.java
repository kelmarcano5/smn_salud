package proceso;

import java.sql.Connection;

import javax.sql.DataSource;

import dinamica.Db;
import dinamica.GenericTransaction;
import dinamica.Jndi;
import dinamica.Recordset;

import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

public class InsertDetEstItem extends GenericTransaction {
	
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
			str = str + "Consultando Diagnostico Detalle Estructura Item"+ " \n";	
			
			String sqlcheck = getSQL(getResource("query.sql"), inputParams);
			Recordset rs = db.get(sqlcheck);
			
				if(rs.getRecordCount() > 0) {
					//rs.first();
					while(rs.next()){
						str  = str + "Creando Detalle Estructura Item"+ " \n";
						
						String sqlInsert = getResource("insert.sql");
						sqlInsert = getSQL(sqlInsert, rs);
						db.exec(sqlInsert);
					}
				}else{
					str = str + "Error al crear el detalle del Diagnostico"+ " \n";
				}
	
			//String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			//File newLogFile = new File("D:/data/Simone/smn_automotriz/log/logInsertDetEstItem"+fechaActual+".txt");
	
	        //FileWriter fw = new FileWriter(newLogFile);
	        //fw.write(str);
	        //fw.close();
		}catch (Throwable e){
			throw e;
		}
		finally
		{
			if (conn!=null){
				conn.close();
			}
		}

		return rc;
	}
}
