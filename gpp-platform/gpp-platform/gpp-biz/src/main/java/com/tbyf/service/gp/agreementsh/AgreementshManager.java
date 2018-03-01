package com.tbyf.service.gp.agreementsh;

import com.tbyf.util.PageData;

public interface AgreementshManager {
	
	public void edit(PageData pd)throws Exception;
	
	public PageData findById(PageData pd)throws Exception;
	
}
