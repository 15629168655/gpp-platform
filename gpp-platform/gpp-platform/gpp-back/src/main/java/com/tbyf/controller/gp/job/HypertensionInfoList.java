package com.tbyf.controller.gp.job;

import java.io.UnsupportedEncodingException;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.StatefulJob;
import com.tbyf.ehrclient.service.UserGeneralRemote;
public class HypertensionInfoList implements  StatefulJob{
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<HypertensionInfoList");
				try { 
					UserGeneralRemote  port = GetSoapPort.getSoap();
					String inputxmlbase64=new GetSfjlXmlInfo().getHypertensionInfoforString();  
					 String  outpxml= port.addSfjlHypertension(inputxmlbase64);
			    	  System.out.println(outpxml);  
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
		}

}
