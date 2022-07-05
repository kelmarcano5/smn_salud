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

public class generar_presupuesto_ingreso extends GenericTransaction{
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
				str = str + "Procesando Ingreso Movimiento"+ " \n";	
				
				String sqlCheckDPed = getSQL(getResource("sql-consultaPresupuestoDetalleIngMov.sql"), inputParams);
				Recordset rsDPedido = db.get(sqlCheckDPed);
			
				if(rsDPedido.getRecordCount() > 0) {			
					//rsDPedido.first();
					while(rsDPedido.next()){
						str  = str + "Creando Ingreso Movimiento"+ " \n";
						
						String sqlInsertOF2 = getResource("insert-movimiento_ingreso.sql");
						sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPedido );
						db.exec(sqlInsertOF2);
					}
					str = str + "Registro de Ingreso Movimiento finalizado"+ " \n";
					str = str + "Fin proceso Ingreso Movimiento Requisicion"+ " \n";		
						
				}else{
					str = str + "Error al crear el detalle del Ingreso Movimiento"+ " \n";
				}
				
				String s = getSQL(getResource("sql-consultaPresupuestoCabecera.sql"), inputParams);
				Recordset rset = db.get(s);
			
				if(rset.getRecordCount() > 0) {
					str = str + ("Registro de Prestacion de Servicio Medico Cab"+ " \n");
					//str = str + ("Insertando Presupuesto con ID: "+ rsImpuesto.getInt("id_ingreso") + " \n");
					rset.first();
					String si = getResource("insert-prestacionCabecera.sql");
					si = getSQL(si, rset);
					db.exec(si);
				}else{
					str = str + ("Error al crear Prestacion de Servicio Medico Cab"+ " \n");
				}
					
				
				String sqlCheckDPed2 = getSQL(getResource("sql-consultaPresupuestoDetallePrest.sql"), inputParams);
				Recordset rsDPedido2 = db.get(sqlCheckDPed2);
							
				if(rsDPedido2.getRecordCount() > 0) {
					//rsDPedido.first();
					while(rsDPedido2.next()){
						str  = str + "Creando Detalle Prestacion de Servicio Medico Det"+ " \n";
						
						String sqlInsertOF3 = getResource("insert-prestacionDetalle.sql");
						sqlInsertOF3 = getSQL(sqlInsertOF3, rsDPedido2);
						db.exec(sqlInsertOF3);
					}

					str = str + "Registro de Detalle Prestacion de Servicio Medico Detalle finalizado"+ " \n";
					str = str + "Fin proceso Detalle Prestacion de Servicio Medico Detalle Requisicion"+ " \n";		
						
				}else{
					str = str + "Error al crear el detalle del Prespuesto Requisicion"+ " \n";
				}
				
						
				String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
				File newLogFile = new File("./logGenerarPresupuestoReq_"+fechaActual+".txt");
				//File newLogFile = new File("D:/data/Simone/smn_automotriz/log/logGenerarPresupuestoReq_"+fechaActual+".txt");
		
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
