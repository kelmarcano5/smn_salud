package proceso;

import dinamica.*;

import javax.sql.DataSource;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Generar_MovIngresoEmergencia extends GenericTransaction
{

	/* (non-Javadoc)
	 * @see dinamica.GenericTransaction#service(dinamica.Recordset)
	 */
	
	public int service(Recordset inputParams) throws Throwable
	{
		
		int rc = 0;
		//String response = "";
		String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String sistemaOperativo = System.getProperty("os.name");
		String file;
		
		
		if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
			file =  "C:/log/log_ProcesarMovIngresoEmergencia"+fechaActual+".txt";
		else
			file = "./log_ProcesarMovIngresoEmergencia"+fechaActual+".txt";
		
		File newLogFile = new File(file);
		FileWriter fw;
		String str="";
		
		if(!newLogFile.exists())
			fw = new FileWriter(newLogFile);
		else
			fw = new FileWriter(newLogFile,true);
		
		BufferedWriter bw=new BufferedWriter(fw);
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		
		//reuse superclass code
		super.service(inputParams);
		
		
		//get security datasource
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		//get datasource and DB connection
		DataSource ds = Jndi.getDataSource(jndiName); 
		Connection conn = ds.getConnection();
		this.setConnection(conn);
		conn.setAutoCommit(false);
		try {
			
			//get db channel
			Db db = getDb();
			
			//String str="";
			boolean procesamiento_caja = true;
			
			//System.out.println("Inicio proceso");
			str = "Inicio proceso"+ " \n";
	
			str = "Validando igs_estatus_financiero del Ingreso"+ " \n";
			
			//verificar si el igs_estatus_financiero del Ingreso es Pendiente
			String sqlCheckIngreso = getSQL(getResource("sql-ConsultarStatus.sql"), inputParams);
			//crea un recordset con la data obtenida
			Recordset rsIngreso = db.get(sqlCheckIngreso);
			if(rsIngreso.getRecordCount() > 0) {
				rsIngreso.first();
				
				str = str+ "El status financiero del Ingreso ID: " + inputParams.getInt("id_ingreso") + " es Pendiente, se pueden procesar servicios \n";
				
				//System.out.println("Obteniendo registros del detalle del Ingreso ID: " + inputParams.getInt("id_ingreso"));
				str = str+ "Obteniendo registros del detalle del Ingreso ID: " + inputParams.getInt("id_ingreso") + " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				//rc = 1;
				
				//verificar si se tiene registros en el movimiento del Ingreso a procesar
				String sqlCheckIngresosMov = getSQL(getResource("sql-RegistrosMovimiento.sql"), inputParams);
				
				//crea un recordset con la data obtenida
				Recordset rsIngresosMov = db.get(sqlCheckIngresosMov);
				
				Recordset rsServicio_aux = new Recordset();							
				rsServicio_aux = rsIngresosMov.copy();
				
				//existen registros en mov?
				if(rsIngresosMov.getRecordCount() > 0) {
					int i=0;
					str = str + "Existen registros"+ " \n";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					//rc = 1;
					//System.out.println("Existen registros");
					while (rsIngresosMov.next())
					{
						//System.out.println("1.- Validando Precio del Servicio");
						str = str + "1.- Validando Precio del Servicio"+ " \n";
						
						str = str + "Servicio: "+ rsIngresosMov.getInt("smn_servicios_rf") + " del ID Mov: " + rsIngresosMov.getInt("smn_ingresos_mov_id");
						Recordset rsServicio = getPriceService(db, rsIngresosMov, str, bw);
						//rsServicio.first();																		
						str = str + ", precio: " + rsServicio.getDouble("smn_precio_neto_ml_servicio") + ", tipo de precio : " + rsIngresosMov.getString("tipo_precio") + " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
						
						rsServicio.setValue( "id_detalle", rsIngresosMov.getInt("smn_ingresos_mov_id"));
						rsServicio.setValue( "id_ingreso", inputParams.getInt("id_ingreso"));	
						
						//Actualizar precio de la cabecera
						String sqlUpdCabecera = getResource("update-PrecioCabecera.sql");
						sqlUpdCabecera = getSQL(sqlUpdCabecera, rsServicio);
						db.exec(sqlUpdCabecera);
						
						//System.out.println("2.- Validando Ruta");
						str = str + "2.- Validando Ruta"+ " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
					}
				}
				
		
				
			}else{
				str = str+ "El status financiero del Ingreso ID: " + inputParams.getInt("id_ingreso") + " no es Pendiente, no se pueden procesar servicios \n";
			}
				
			str = str + "Fin procesamiento!!!"+ " \n";
			//str = str + "Ejecutado exitosamente"+ " \n";
			//System.out.println("Fin procesamiento!!!");
		} 
		catch (Throwable e)
		{
			conn.rollback();
			throw e;
		}
		finally
		{
			if(rc == 0)
			{
				conn.commit();
				//CallPrestationServices(conn, inputParams, str,bw);
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
	
	protected Recordset getPriceService(Db db, Recordset rsIngresosMov,  String str, BufferedWriter bw) throws Throwable {
		String tipo_precio = rsIngresosMov.getString("tipo_precio");
		String sqlCheckPrecioServicio="";
		int rc = 0;
		
		//crea un recordset con la data obtenida

		try{
			//int contratante = rsIngresosMov.getInt("smn_contrantante_id");
			if(tipo_precio.equals("G")){
				bw.write(tipo_precio);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", tipo_precio);
				sqlCheckPrecioServicio = getSQL(getResource("sql-ConsultarPrecioG.sql"), rsIngresosMov);
				
			}
			
			if(tipo_precio.equals("C")){
				bw.write(tipo_precio);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", tipo_precio);
				sqlCheckPrecioServicio = getSQL(getResource("sql-ConsultarPrecioC.sql"), rsIngresosMov);	
			}
			
			if(tipo_precio.equals("E")){
				bw.write(tipo_precio);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", tipo_precio);
				sqlCheckPrecioServicio = getSQL(getResource("sql-ConsultarPrecioE.sql"), rsIngresosMov);	
			}
			
			Recordset rsServicio = db.get(sqlCheckPrecioServicio);
			if(rsServicio.getRecordCount()>0){
				rsServicio.first();
				//return rsServicio;
			}
			
			return rsServicio;
		}catch (Throwable e)
		{
			
			throw e;
			
			/*str = str + "No existen registros"+ " \n";
			bw.write(str);
			bw.flush();
			bw.newLine();
			getRequest().setAttribute("mensaje", str);
			rc = 1;*/
			//return 1;
		}
		
		//return rc;
	}
	
}
