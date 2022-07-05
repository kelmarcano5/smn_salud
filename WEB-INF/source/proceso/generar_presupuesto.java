package proceso;

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


public class generar_presupuesto extends GenericTransaction {
	
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
			
			String sqlCheckImp = getSQL(getResource("sql-consultaPresupuestoCabecera.sql"), inputParams);
			Recordset rsImpuesto = db.get(sqlCheckImp);
		
			if(rsImpuesto.getRecordCount() > 0) {
				str = str + ("Registro de Presupuesto"+ " \n");
				//str = str + ("Insertando Presupuesto con ID: "+ rsImpuesto.getInt("id_ingreso") + " \n");
				rsImpuesto.first();
				String sqlInsertImp = getResource("insert-presupuesto_cabecera.sql");
				sqlInsertImp = getSQL(sqlInsertImp, rsImpuesto);
				db.exec(sqlInsertImp);
				
				String sqlCheckDPed = getSQL(getResource("sql-consultaPresupuestoDetalle.sql"), inputParams);
				Recordset rsDPedido = db.get(sqlCheckDPed);
							
				if(rsDPedido.getRecordCount() > 0) {
					//rsDPedido.first();
					while(rsDPedido.next()){
						str  = str + "Creando Detalle de la Presupuesto"+ " \n";
						
						String sqlInsertOF2 = getResource("insert-presupuesto_detalle.sql");
						sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPedido );
						db.exec(sqlInsertOF2);
					}

					str = str + "Registro de Detalle Presupuesto finalizado"+ " \n";
					str = str + "Fin proceso Detalle Presupuesto"+ " \n";		
						
				}else{
					str = str + "Error al crear el detalle del Presupuesto"+ " \n";
				}
				
				str = str + ("Fin proceso presupuesto"+ " \n");		
			}else{
				str = str + ("Error al crear la cabecera del presupuesto"+ " \n");
			}
			
			String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			File newLogFile = new File("../logGenerarIngresoPresupuesto_"+fechaActual+".txt");

			//File newLogFile = new File("D:/data/Simone/smn_automotriz/log/logGenerarIngresoPresupuesto_"+fechaActual+".txt");
	
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
