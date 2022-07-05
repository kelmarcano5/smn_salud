package services;

import dinamica.*;

public class Service extends GenericTransaction {
	
	public String hello(String id) throws Exception
	{
		return "Hello "+id;
	}

}
