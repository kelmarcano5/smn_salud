package domain.calendars;

import java.util.Calendar;
import java.util.Date;
import dinamica.Recordset;
import dinamica.calendar.DefaultCalendar;

/*Supongamos que necesitamos deshabilitar la selecci�n de s�bados,
domingos y d�as feriados (bancarios, semana santa, etc.). Para estos
�ltimos usaremos una tabla de base de datos para tenerlos
almacenados y configurarlos mediante un m�dulo de mantenimiento
(un CRUD Simple por ejemplo).
Una clase que cumpla con el prop�sito de proveer los d�as a un calendario debe extender a la
clase base dinamica.calendar.DefaultCalendar*/


/* 1.- Necesitamos deshabilitar los dias donde no hay disponibilidad por parte del prestador de servicio
 * 2.- Solo debemos habilitar los dias disponibles
 * */

public class AgendaCalendar extends DefaultCalendar 
{
	//getCellStyle: permite indicar el estilo a aplicar, desactivado, activado, otro.
	@Override
	protected String getCellStyle(Calendar c, int currentDay, Date minDate, Date maxDate) throws Throwable 
	{
		String style = super.getCellStyle(c, currentDay, minDate, maxDate);
		//desactivar sabados y domingos
		if (c.get(Calendar.DAY_OF_WEEK)==1 || c.get(Calendar.DAY_OF_WEEK)==2 || c.get(Calendar.DAY_OF_WEEK)==4 || c.get(Calendar.DAY_OF_WEEK)==6 || c.get(Calendar.DAY_OF_WEEK)==7) 
		{
			style = "calDisabled";
			return style;
		}
		//desactivar feriados
	
		//desactivar los dias que no estan en la agenda
		/*Recordset rs = this.getRecordset("agenda.sql");
		rs.top();
		while (rs.next())
		{
			if (rs.getDate("fecha").compareTo(c.getTime())!=0)
			{
				style="calDisabled";
				break;
			}
			
			if(rs.getString("fecha").compareTo("LU")!=0){
				//	equalsIgnoreCase("LU")){
				style="calDisabled";
				break;
			}
		}*/
		return style;
	}

	//getCellOnClickValue: permite indicar la acci�n en caso de clic (no hacer nada, retornar la fecha, etc.)
	@Override
	protected String getCellOnClickValue(String elementID, Calendar c, int currentDay, Date minDate, Date maxDate, String date) throws Throwable 
	{
		String value = super.getCellOnClickValue(elementID, c, currentDay, minDate, maxDate, date);

		//desactivar sabados y domingos
		if (c.get(Calendar.DAY_OF_WEEK)==1 || c.get(Calendar.DAY_OF_WEEK)==2 || c.get(Calendar.DAY_OF_WEEK)==4 || c.get(Calendar.DAY_OF_WEEK)==6 || c.get(Calendar.DAY_OF_WEEK)==7) 
			{
			value = "";
			return value;
		}
        
		//desactivar feriados
		
		//desactivar los dias que no estan en la agenda
		/*Recordset rs = this.getRecordset("agenda.sql");
		rs.top();
		while (rs.next())
		{			
			if (rs.getDate("fecha").compareTo(c.getTime())!=0)
			{
				value="";
				break;
			}
		}*/
		return value;
	}
}