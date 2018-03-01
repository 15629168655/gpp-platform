package com.tbyf.controller.gp.job;

import java.net.URL;

import com.tbyf.ehrclient.service.UserGenerLogicService;
import com.tbyf.ehrclient.service.UserGeneralRemote;

public class GetSoapPort {
	 public static UserGeneralRemote getSoap(){
	   	 URL wsdlURL = UserGenerLogicService.WSDL_LOCATION;  
	   	 UserGenerLogicService ss = new UserGenerLogicService(wsdlURL, UserGenerLogicService.SERVICE); 
	   	 UserGeneralRemote  port = ss.getUserGenerLogicPort();  
	   	 return  port;
		
	}

}
