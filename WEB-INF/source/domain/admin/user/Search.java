package domain.admin.user;

import dinamica.*;

/**
 * Users - search engine
 * Build a complex select query and retrieve the recordset.<br>
 * This class also takes care of retrieving the last filter recordset
 * from the session and refresh its values using the current input parameters,
 * so that when the filter is displayed again it will show the last
 * search parameters used.
 * <br><br>
 * Creation date: 25/02/2004<br>
 * Last Update: 25/02/2004<br>
 * (c) 2004 Martin Cordova<br>
 * This code is released under the LGPL license<br>
 * @author Martin Cordova (dinamica@martincordova.com)
 * */
public class Search extends GenericTransaction
{

	/** 
	 * Returns 1 if no records are found to satisfy the search criteria,
	 * otherwise returns 0.
	 */
	public int service(Recordset inputs) throws Throwable
	{

		//create any auto-recordsets defined in config.xml
		int rc = super.service(inputs);

		//prefix for recordsets IDs
		String prefix = "user";
		
		//retrieve filter recordset from session
		//and copy input values to restore filter state later
		Recordset filter = (Recordset)getSession().getAttribute(prefix + ".filter");
		inputs.copyValues(filter);
		
		/* start query assembling logic */
		
		//load base query
		String qBase = getResource("query-base.sql");

		//the "orderby" and "sortmode" fields must be replaced by hand
		//because they are not regular field markers - the getSQL()
		//method won't handle this case
		String orderby = inputs.getString("orderby");
		String sortmode = inputs.getString("sortmode");
		qBase = StringUtil.replace(qBase,"${orderby}", orderby);
		qBase = StringUtil.replace(qBase,"${sortmode}", sortmode);
		
		//variable where clause
		StringBuffer qFilter = new StringBuffer();
		
		//we will use generic logic to read 
		//all the applicable clauses
		String[] params = {
							"userlogin",
							"fname",
							"lname",
							"role_id",
						  };
		
		for (int i=0;i<params.length;i++)
		{
			if (inputs.getValue(params[i])!=null)
				qFilter.append(getResource("clause-" + params[i]+ ".sql"));
		}

		//retrieve the assembled filter
		String where = qFilter.toString();
		
		//place the where clause into the base query
		qBase = StringUtil.replace(qBase,"${filter}", where);

		/* end of query assembling logic */
		
		//generate SQL with the filter values
		String sql = getSQL(qBase, inputs);
		
		//execute query
		Db db = getDb();
		Recordset rs = db.get(sql);
		
		//set return value for page flow
		if (rs.getRecordCount()>0)
		{
			//publish recordset or store in session
			//if you are going to paginate results using another Action
			getSession().setAttribute(prefix + ".results", rs);
			rc = 0;
		}
		else
		{
			rc = 1;
		}
		
		return rc;
		
	}

}
