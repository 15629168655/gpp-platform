package com.tbyf.entity.hm.departments;

import com.tbyf.entity.system.*;

import java.util.*;

/**
 * 科室实体类
 * Created by ycp on 2016/6/24.
 */

public class Departments extends TreeNode
{
	private String DEPARTMENTS_ID;  //PK
	private String DEP_ID;    //医疗卫生机构（科室）标识
	private String DEP_NAME;  //医疗卫生机构（科室）实体名称
	private String DEP_ROLE_NAME; //医疗卫生机构（科室）角色名称
	private String DEP_TYPE_CODE;  //医疗卫生机构（科室）类别编码
	private String DEP_TYPE_NAME;  //医疗卫生机构（科室）类别名称
	private String ADDRESS;  //工作地址
	private String TELECOM;   //工作联系方式：电话、邮箱地址等
	private String PARENT_DEP_ID;  //上级医疗卫生机构（科室）号标识
	private String PARENT_DEP_NAME;  //上级医疗卫生机构（科室）名称
	private String ROLE_STATUS;  //角色状态(active)
	private String EFFECTIVE_TIME_LOW;  //角色有效期间(20100101)
	private String EFFECTIVE_TIME_HIGH;  //角色有效期间(20501231)
	private String AUTHOR_ID;  //委拖人ID
	private String AUTHOR_NAME;  //委拖人名称
	private String AUTHOR_DEP_ID; //委拖人科室号标识
	private String AUTHOR_DEP_NAME;  //委拖人科室名称
	private String AUTHOR_DEP_CONTACTS; //委拖人科室联系人
	private String CREATION_TIME;  //注册时间(20130116112855)
	private String ORG_CODE;  //所属机构标识
	private String ISLEAF; //是否是树也节点:1是也节点，其余不是
	
	private String target;
	private Departments departments;
	private List<Departments> subDepartments;
	private boolean hasDepartments = false;
	private String treeurl;
	
	public Departments()
	{
		
	}
	
	public String getDEPARTMENTS_ID()
    {
        return DEPARTMENTS_ID;
    }

    public void setDEPARTMENTS_ID(String DEPARTMENTS_ID)
    {
        this.DEPARTMENTS_ID = DEPARTMENTS_ID;
    }
    
    public String getDEP_ID()
    {
        return DEP_ID;
    }

    public void setDEP_ID(String DEP_ID)
    {
        this.DEP_ID = DEP_ID;
    }

    public String getDEP_NAME()
    {
        return DEP_NAME;
    }

    public void setDEP_NAME(String DEP_NAME)
    {
        this.DEP_NAME = DEP_NAME;
    }
    
    public String getDEP_ROLE_NAME()
    {
        return DEP_ROLE_NAME;
    }

    public void setDEP_ROLE_NAME(String DEP_ROLE_NAME)
    {
        this.DEP_ROLE_NAME = DEP_ROLE_NAME;
    }
    
    public String getDEP_TYPE_CODE()
    {
        return DEP_TYPE_CODE;
    }

    public void setDEP_TYPE_CODE(String DEP_TYPE_CODE)
    {
        this.DEP_TYPE_CODE = DEP_TYPE_CODE;
    }
    
    public String getDEP_TYPE_NAME()
    {
        return DEP_TYPE_NAME;
    }

    public void setDEP_TYPE_NAME(String DEP_TYPE_NAME)
    {
        this.DEP_TYPE_NAME = DEP_TYPE_NAME;
    }
    
    public String getADDRESS()
    {
        return ADDRESS;
    }

    public void setADDRESS(String ADDRESS)
    {
        this.ADDRESS = ADDRESS;
    }
    
    public String getTELECOM()
    {
        return TELECOM;
    }

    public void setTELECOM(String TELECOM)
    {
        this.TELECOM = TELECOM;
    }
    
    public String getPARENT_DEP_ID()
    {
        return PARENT_DEP_ID;
    }

    public void setPARENT_DEP_ID(String PARENT_DEP_ID)
    {
        this.PARENT_DEP_ID = PARENT_DEP_ID;
    }
    
    public String getPARENT_DEP_NAME()
    {
        return PARENT_DEP_NAME;
    }

    public void setPARENT_DEP_NAME(String PARENT_DEP_NAME)
    {
        this.PARENT_DEP_NAME = PARENT_DEP_NAME;
    }
    
    public String getROLE_STATUS()
    {
        return ROLE_STATUS;
    }

    public void setROLE_STATUS(String ROLE_STATUS)
    {
        this.ROLE_STATUS = ROLE_STATUS;
    }
    
    public String getEFFECTIVE_TIME_LOW()
    {
        return EFFECTIVE_TIME_LOW;
    }

    public void setEFFECTIVE_TIME_LOW(String EFFECTIVE_TIME_LOW)
    {
        this.EFFECTIVE_TIME_LOW = EFFECTIVE_TIME_LOW;
    }
    
    public String getEFFECTIVE_TIME_HIGH()
    {
        return EFFECTIVE_TIME_HIGH;
    }

    public void setEFFECTIVE_TIME_HIGH(String EFFECTIVE_TIME_HIGH)
    {
        this.EFFECTIVE_TIME_HIGH = EFFECTIVE_TIME_HIGH;
    }
    
    public String getAUTHOR_ID()
    {
        return AUTHOR_ID;
    }

    public void setAUTHOR_ID(String AUTHOR_ID)
    {
        this.AUTHOR_ID = AUTHOR_ID;
    }
    
    public String getAUTHOR_NAME()
    {
        return AUTHOR_NAME;
    }

    public void setAUTHOR_NAME(String AUTHOR_NAME)
    {
        this.AUTHOR_NAME = AUTHOR_NAME;
    }
    
    public String getAUTHOR_DEP_ID()
    {
        return AUTHOR_DEP_ID;
    }

    public void setAUTHOR_DEP_ID(String AUTHOR_DEP_ID)
    {
        this.AUTHOR_DEP_ID = AUTHOR_DEP_ID;
    }
    
    public String getAUTHOR_DEP_NAME()
    {
        return AUTHOR_DEP_NAME;
    }

    public void setAUTHOR_DEP_NAME(String AUTHOR_DEP_NAME)
    {
        this.AUTHOR_DEP_NAME = AUTHOR_DEP_NAME;
    }
    
    public String getAUTHOR_DEP_CONTACTS()
    {
        return AUTHOR_DEP_CONTACTS;
    }

    public void setAUTHOR_DEP_CONTACTS(String AUTHOR_DEP_CONTACTS)
    {
        this.AUTHOR_DEP_CONTACTS = AUTHOR_DEP_CONTACTS;
    }
    
    public String getCREATION_TIME()
    {
        return CREATION_TIME;
    }

    public void setCREATION_TIME(String CREATION_TIME)
    {
        this.CREATION_TIME = CREATION_TIME;
    }
    
    public String getORG_CODE()
    {
        return ORG_CODE;
    }

    public void setORG_CODE(String ORG_CODE)
    {
        this.ORG_CODE = ORG_CODE;
    }
    
    public String getISLEAF()
    {
        return ISLEAF;
    }

    public void setISLEAF(String ISLEAF)
    {
        this.ISLEAF = ISLEAF;
    }

    public String getTarget()
    {
        return target;
    }

    public void setTarget(String target)
    {
        this.target = target;
    }

    public Departments getDepartments()
    {
        return departments;
    }

    public void setDepartments(Departments departments)
    {
        this.departments = departments;
    }

    public List<Departments> getSubDepartments()
    {
        return subDepartments;
    }

    public void setSubDepartments(List<Departments> subDepartments)
    {
        this.subDepartments = subDepartments;
    }

    public boolean isHasDepartments()
    {
        return hasDepartments;
    }

    public void setHasDepartments(boolean hasDepartments)
    {
        this.hasDepartments = hasDepartments;
    }

    public String getTreeurl()
    {
        return treeurl;
    }

    public void setTreeurl(String treeurl)
    {
        this.treeurl = treeurl;
    }
}