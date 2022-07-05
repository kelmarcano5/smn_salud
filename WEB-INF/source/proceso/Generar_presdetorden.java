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

public class Generar_presdetorden extends GenericTransaction {
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
			str = str + "Procesando Integracion Ingreso Prespuesto"+ " \n";	

				String sqlCheckDet = getSQL(getResource("sql-consultaPresupuestoDetalle.sql"), inputParams);
				Recordset rsDetalle = db.get(sqlCheckDet);
							
				if(rsDetalle.getRecordCount() > 0) {
					//rsDetalle.first();
					while(rsDetalle.next()){
						str  = str + "Creando Detalle de la Presupuesto"+ " \n";
						String sqlInsertOF2 = getResource("insert-PresupuestoDetalle.sql");
						sqlInsertOF2 = getSQL(sqlInsertOF2, rsDetalle );
						db.exec(sqlInsertOF2);
					}
					str = str + "Registro de Detalle Presupuesto finalizado"+ " \n";
					str = str + "Fin proceso Detalle Presupuesto"+ " \n";		
						
				}else{
					str = str + "Error al crear el detalle del Presupuesto"+ " \n";
				}
			String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			File newLogFile = new File("E:/data/Simone/smn_salud/log/logGenerar"+fechaActual+".txt");
	
	        FileWriter fw = new FileWriter(newLogFile);
	        fw.write(str);
	        fw.close();
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
