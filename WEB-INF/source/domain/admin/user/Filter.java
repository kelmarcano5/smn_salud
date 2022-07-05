package domain.admin.user;

import dinamica.*;

/**
 * Users search filter
 * Initializes recordsets used by the filter form,
 * when called the first time the recordsets are created
 * and stored in the session. Next invocations will retrieve 
 * the last state (recordset values) from session. This is done
 * in order to restore the last search filter without complex logic
 * <br><br>
 * Creation date: 26/02/2004<br>
 * Last Update: 26/02/2004<br>
 * (c) 2004 Martin Cordova<br>
 * This code is released under the LGPL license<br>
 * @author Martin Cordova (dinamica@martincordova.com)
 * */
public class Filter extends GenericTransaction
{

	/* (non-Javadoc)
	 * @see dinamica.GenericTransaction#service(dinamica.Recordset)
	 */
	public int service(Recordset inputs) throws Throwable
	{
		
		//change this ID
		String filterID = "user.filter";
		
		//create any auto-recordsets defined in config.xml
		int rc = super.service(inputs);

		//check if filter recordset exists in session
		Recordset filter = (Recordset)getSession().getAttribute(filterID);
		
		//first time?
		if (filter==null)
		{
			
			filter = new Recordset();
			
			//define your filter columns
			filter.append("userlogin", java.sql.Types.VARCHAR);
			filter.append("lname", java.sql.Types.VARCHAR);
			filter.append("fname", java.sql.Types.VARCHAR);
			filter.append("role_id", java.sql.Types.INTEGER);

			//standard features - do not remove
			filter.append("orderby", java.sql.Types.VARCHAR);
			filter.append("sortmode", java.sql.Types.VARCHAR);
			filter.append("pagesize", java.sql.Types.INTEGER);
		
			filter.addNew();
			getSession().setAttribute(filterID, filter);
			
		}
		
		publish(filterID, filter);
		
		return rc;
		
	}

}
