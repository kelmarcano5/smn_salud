package proceso_orig;

import dinamica.*;

import javax.sql.DataSource;

import java.io.File;
import java.sql.*;

public class Proximo extends GenericTransaction
{

	/* (non-Javadoc)
	 * @see dinamica.GenericTransaction#service(dinamica.Recordset)
	 */
	
	public int service(Recordset inputParams) throws Throwable
	{
		
		//default return code
		int rc = 2;
		
		//reuse superclass code
		super.service(inputParams);
		
		//set request attributes in case of forward to another Action
		//getRequest().setAttribute("smn_usuarios_id", inputParams.getString("smn_usuarios_id"));
		
		
		
		//get security datasource
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		//get datasource and DB connection
		DataSource ds = Jndi.getDataSource(jndiName); 
		Connection conn = ds.getConnection();
		this.setConnection(conn);
				
		try {
			
			//get db channel
			Db db = getDb();
			
			int ruta_id;
			String auxiliar_id;
			int entero = 0;
			String sqlCheckPaciente;
			Recordset rsPaciente;
			
			
			//validar pacientes asignados
			sqlCheckPaciente = getSQL(getResource("sql-info_paciente.sql"), inputParams);
			
			//crea un recordset con la data obtenida
			rsPaciente = db.get(sqlCheckPaciente);
			
			//existe paciente asignado?
			if(rsPaciente.getRecordCount() > 0) {				
				
				rsPaciente.first();
				ruta_id = rsPaciente.getInt("smn_ruta_id");
				auxiliar_id = rsPaciente.getString("smn_auxiliar_rf");
				
				if(auxiliar_id != null)
					entero = Integer.parseInt(auxiliar_id);
				
				//cambiar RecordSet, agregandole el ID de la ruta
				inputParams.setValue("ruta_id",ruta_id);
				
				//cambiar RecordSet, agregandole el ID del auxiliar
				inputParams.setValue("auxiliar_id",entero);
				
			}else{
			
				//conocer si hay pacientes próximos a atender
				sqlCheckPaciente = getSQL(getResource("sql-verificar_paciente.sql"), inputParams);
				
				//crea un recordset con la data obtenida
				rsPaciente =  db.get(sqlCheckPaciente);
				
				//existe proximo paciente?
				if(rsPaciente.getRecordCount() > 0) {
					
					rsPaciente.first();
					ruta_id = rsPaciente.getInt("smn_ruta_id");
					auxiliar_id = rsPaciente.getString("smn_auxiliar_rf");			
					
					if(auxiliar_id != null)
						entero = Integer.parseInt(auxiliar_id);
					
					//cambiar RecordSet, agregandole el ID de la ruta
					inputParams.setValue("ruta_id",ruta_id);
					
					//cambiar RecordSet, agregandole el ID del auxiliar
					inputParams.setValue("auxiliar_id",entero);
					
					//se hace una especie de bloqueo al paciente, asignadolo al ejecutivo que lo llamó
					String sqlUpdRuta = getResource("update-asignar-paciente.sql");
					sqlUpdRuta = getSQL(sqlUpdRuta, inputParams);
					db.exec(sqlUpdRuta);
					
					/*String str = "Ruta ID: "+ruta_id;
		            File newTextFile = new File("C:/Users/alexander/Desktop/dinamica/thetextfileRuta.txt");
		            File newTextFile = new File("D:/data/Simone/smn_salud/log/log"+fechaActual+"_"+inputParams.getInt("id_ingreso")+".txt");
	
		            FileWriter fw = new FileWriter(newTextFile);
		            fw.write(str);
		            fw.close();*/
				
				}
			
			}	/*else{
				
				//obtener info paciente próximo a atender
				sqlCheckPaciente = getSQL(getResource("sql-info_paciente.sql"), inputParams);
				
				//crea un recordset con la data obtenida
				rsPaciente = db.get(sqlCheckPaciente);
				
				//existe proximo paciente?
				if(rsPaciente.getRecordCount() > 0) {
					
					rsPaciente.first();
					ruta_id = rsPaciente.getInt("smn_ruta_id");
					auxiliar_id = rsPaciente.getString("smn_auxiliar_rf");
					
					if(auxiliar_id != null)
						entero = Integer.parseInt(auxiliar_id);
					
					//cambiar RecordSet, agregandole el ID de la ruta
					inputParams.setValue("ruta_id",ruta_id);
					
					//cambiar RecordSet, agregandole el ID del auxiliar
					inputParams.setValue("auxiliar_id",entero);		
				}
				
			} */
        } 
		catch (Throwable e)
		{
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
