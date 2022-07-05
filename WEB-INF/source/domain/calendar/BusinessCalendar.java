package domain.calendar;

import java.util.Calendar;
import java.util.Date;

import dinamica.*;
import dinamica.calendar.DefaultCalendar;

public class BusinessCalendar extends DefaultCalendar {

	@Override
	protected String getCellStyle(Calendar c, int currentDay, Date minDate,
			Date maxDate) throws Throwable {
		String style = super.getCellStyle(c, currentDay, minDate, maxDate);
		//desactivar sabados y domingos
		if (c.get(Calendar.DAY_OF_WEEK)==1 || c.get(Calendar.DAY_OF_WEEK)==7) {
			style = "calDisabled";
			return style;
		}
		//desactivar feriados
		Recordset rs = this.getRecordset("feriados.sql");
		rs.top();
		while (rs.next())
		{
			if (rs.getDate("fecha").compareTo(c.getTime())==0)
			{
				style="calDisabled";
				break;
			}
		}
		return style;
	}

	@Override
	protected String getCellOnClickValue(String elementID, Calendar c,
			int currentDay, Date minDate, Date maxDate, String date) throws
	Throwable {
		String value = super.getCellOnClickValue(elementID, c, currentDay, minDate,
				maxDate, date);
		//desactivar sabados y domingos
		if (c.get(Calendar.DAY_OF_WEEK)==1 || c.get(Calendar.DAY_OF_WEEK)==7) {
			value = "";
			return value;
		}
		//desactivar feriados
		Recordset rs = this.getRecordset("feriados.sql");
		rs.top();
		while (rs.next())
		{
			if (rs.getDate("fecha").compareTo(c.getTime())==0)
			{
				value="";
				break;
			}
		}
		return value;
	}
}

