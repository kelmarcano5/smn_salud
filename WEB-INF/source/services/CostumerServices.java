package services;

import javax.jws.WebService;
@WebService

public class CostumerServices {
	public String findByID(String customerID) throws Exception
	{
	Service obj = new Service();
	String companyName = obj.hello(customerID);
	return companyName;
	}
}
