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


public class generar_presupuesto1 extends GenericTransaction {
	
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
				//inputParams.setValue("smn_ingresos_id", rsImpuesto.getInt("smn_ingresos_id"));
				String sqlInsertImp = getResource("insert-presupuesto_cabecera.sql");
				sqlInsertImp = getSQL(sqlInsertImp, rsImpuesto);
				db.exec(sqlInsertImp);
				
				/*String sqlCheckDPed = getSQL(getResource("sql-consultaPresupuestoDetalle.sql"), inputParams);
				Recordset rsDPedido = db.get(sqlCheckDPed);
							
				if(rsDPedido.getRecordCount() > 0) {
					rsDPedido.first();
					while(rsDPedido.next()){
						str  = str + "Creando Detalle del Presupuesto con los servicios"+ " \n";
						
						String sqlInsertOF2 = getResource("insert-presupuesto_detalle.sql");
						sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPedido );
						db.exec(sqlInsertOF2);
					}
									
					str = str + "Registro de Detalle Presupuesto finalizado"+ " \n";
				}else{
					str = str + ("Error al crear el detalle del presupuesto con los servicios"+ " \n");
				}*/
				
			/*	String InsertItem = getSQL(getResource("sql-consultaDiagnosticaEstructuraItem.sql"), inputParams);
				Recordset rsItem = db.get(InsertItem);
				if(rsItem.getRecordCount() > 0){
					rsItem.first();
					while(rsItem.next()){
						str  = str + "Creando Detalle del Presupuesto con el Item"+ " \n";
						
						String InsertItem2 = getResource("insert-presupuesto_detalle_item.sql");
						InsertItem2 = getSQL(InsertItem2, rsItem );
						db.exec(InsertItem2);
					}
				}else{
					str = str + "Error al crear el detalle del Presupuesto con los item"+ " \n";
				}*/
				
			}else{
				str = str + "Error al crear la cabecera del Presupuesto"+ " \n";
				conn.close();
			}
			String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			//File newLogFile = new File("D:/data/Simone/smn_automotriz/log/logGenerarIngresoPresupuesto_"+fechaActual+".txt");
			//File newLogFile = new File("/log.txt");
			
	
			//FileWriter fw = new FileWriter(newLogFile);
	        //fw.write(str);
	        //fw.close();
			
			return rc;
		}catch (Throwable e){
			throw e;
			//conn.close();
		}
		finally
		{
			if (conn!=null){
				conn.close();
			}
		}

		//return rc;
	}
}


