package com.tbyf.entity.hm.organization;

import com.tbyf.entity.system.*;

import java.util.*;

/**
 * 机构实体类
 * Created by zzx on 2016/6/23.
 */
public class Organization extends TreeNode
{
    private String ORGANIZATION_ID;
    private String ORG_CODE;
    private String ORG_NAME;
    private String ORG_LOGIN_CODE;
    private String ORG_NAME2;
    private String ORG_CLASSCODE;
    private String ORG_CLASSVALUE;
    private String ORG_TYPECODE;
    private String ORG_TYPEVALUE;
    private String REGIONCODE;
    private String REGIONVALUE;
    private String ADDRESS;
    private String TOWN_STREET_CODE;
    private String TOWN_STREET_NAME;
    private String HOST_UNITCODE;
    private String HOST_UNITVALUE;
    private String SUP_DEPARTMENTCODE;
    private String SUP_DEPARTMENTVALUE;
    private String RELATIONSCODE;
    private String RELATIONSVALUE;
    private String POST_CODE;
    private String TEL;
    private String MAIL;
    private String CORP_REPRESENTATIVE;
    private String PRINC_PERSON;
    private Date UNIT_SETUP_TIME;
    private String UNIT_WEB_SET;
    private String PHONETIC_MNEMONIC;
    private String ORG_STATUS;
    private String AUTHOR_ID;
    private String AUTHOR_NAME;
    private String AUTHOR_DEP_ID;
    private String AUTHOR_DEP_NAME;
    private String AUTHOR_DEP_CONTACTS;
    private Date CREATION_TIME;
    private String P_ORG_CODE;
    private String ISLEAF;
    private String HOSPITAL_RANK;

    public String getHOSPITAL_RANK()
    {
        return HOSPITAL_RANK;
    }

    public void setHOSPITAL_RANK(String HOSPITAL_RANK)
    {
        this.HOSPITAL_RANK = HOSPITAL_RANK;
    }

    private String target;
    private Organization organization;
    private List<Organization> subOrganization;
    private boolean hasOrganization = false;
    private String treeurl;

    public Organization()
    {
    }

    public String getORGANIZATION_ID()
    {
        return ORGANIZATION_ID;
    }

    public void setORGANIZATION_ID(String ORGANIZATION_ID)
    {
        this.ORGANIZATION_ID = ORGANIZATION_ID;
    }

    public String getORG_CODE()
    {
        return ORG_CODE;
    }

    public void setORG_CODE(String ORG_CODE)
    {
        this.ORG_CODE = ORG_CODE;
    }

    public String getORG_NAME()
    {
        return ORG_NAME;
    }

    public void setORG_NAME(String ORG_NAME)
    {
        this.ORG_NAME = ORG_NAME;
    }

    public String getORG_LOGIN_CODE()
    {
        return ORG_LOGIN_CODE;
    }

    public void setORG_LOGIN_CODE(String ORG_LOGIN_CODE)
    {
        this.ORG_LOGIN_CODE = ORG_LOGIN_CODE;
    }

    public String getORG_NAME2()
    {
        return ORG_NAME2;
    }

    public void setORG_NAME2(String ORG_NAME2)
    {
        this.ORG_NAME2 = ORG_NAME2;
    }

    public String getORG_CLASSCODE()
    {
        return ORG_CLASSCODE;
    }

    public void setORG_CLASSCODE(String ORG_CLASSCODE)
    {
        this.ORG_CLASSCODE = ORG_CLASSCODE;
    }

    public String getORG_CLASSVALUE()
    {
        return ORG_CLASSVALUE;
    }

    public void setORG_CLASSVALUE(String ORG_CLASSVALUE)
    {
        this.ORG_CLASSVALUE = ORG_CLASSVALUE;
    }

    public String getORG_TYPECODE()
    {
        return ORG_TYPECODE;
    }

    public void setORG_TYPECODE(String ORG_TYPECODE)
    {
        this.ORG_TYPECODE = ORG_TYPECODE;
    }

    public String getORG_TYPEVALUE()
    {
        return ORG_TYPEVALUE;
    }

    public void setORG_TYPEVALUE(String ORG_TYPEVALUE)
    {
        this.ORG_TYPEVALUE = ORG_TYPEVALUE;
    }

    public String getREGIONCODE()
    {
        return REGIONCODE;
    }

    public void setREGIONCODE(String REGIONCODE)
    {
        this.REGIONCODE = REGIONCODE;
    }

    public String getREGIONVALUE()
    {
        return REGIONVALUE;
    }

    public void setREGIONVALUE(String REGIONVALUE)
    {
        this.REGIONVALUE = REGIONVALUE;
    }

    public String getADDRESS()
    {
        return ADDRESS;
    }

    public void setADDRESS(String ADDRESS)
    {
        this.ADDRESS = ADDRESS;
    }

    public String getTOWN_STREET_CODE()
    {
        return TOWN_STREET_CODE;
    }

    public void setTOWN_STREET_CODE(String TOWN_STREET_CODE)
    {
        this.TOWN_STREET_CODE = TOWN_STREET_CODE;
    }

    public String getTOWN_STREET_NAME()
    {
        return TOWN_STREET_NAME;
    }

    public void setTOWN_STREET_NAME(String TOWN_STREET_NAME)
    {
        this.TOWN_STREET_NAME = TOWN_STREET_NAME;
    }

    public String getHOST_UNITCODE()
    {
        return HOST_UNITCODE;
    }

    public void setHOST_UNITCODE(String HOST_UNITCODE)
    {
        this.HOST_UNITCODE = HOST_UNITCODE;
    }

    public String getHOST_UNITVALUE()
    {
        return HOST_UNITVALUE;
    }

    public void setHOST_UNITVALUE(String HOST_UNITVALUE)
    {
        this.HOST_UNITVALUE = HOST_UNITVALUE;
    }

    public String getSUP_DEPARTMENTCODE()
    {
        return SUP_DEPARTMENTCODE;
    }

    public void setSUP_DEPARTMENTCODE(String SUP_DEPARTMENTCODE)
    {
        this.SUP_DEPARTMENTCODE = SUP_DEPARTMENTCODE;
    }

    public String getSUP_DEPARTMENTVALUE()
    {
        return SUP_DEPARTMENTVALUE;
    }

    public void setSUP_DEPARTMENTVALUE(String SUP_DEPARTMENTVALUE)
    {
        this.SUP_DEPARTMENTVALUE = SUP_DEPARTMENTVALUE;
    }

    public String getRELATIONSCODE()
    {
        return RELATIONSCODE;
    }

    public void setRELATIONSCODE(String RELATIONSCODE)
    {
        this.RELATIONSCODE = RELATIONSCODE;
    }

    public String getRELATIONSVALUE()
    {
        return RELATIONSVALUE;
    }

    public void setRELATIONSVALUE(String RELATIONSVALUE)
    {
        this.RELATIONSVALUE = RELATIONSVALUE;
    }

    public String getPOST_CODE()
    {
        return POST_CODE;
    }

    public void setPOST_CODE(String POST_CODE)
    {
        this.POST_CODE = POST_CODE;
    }

    public String getTEL()
    {
        return TEL;
    }

    public void setTEL(String TEL)
    {
        this.TEL = TEL;
    }

    public String getMAIL()
    {
        return MAIL;
    }

    public void setMAIL(String MAIL)
    {
        this.MAIL = MAIL;
    }

    public String getCORP_REPRESENTATIVE()
    {
        return CORP_REPRESENTATIVE;
    }

    public void setCORP_REPRESENTATIVE(String CORP_REPRESENTATIVE)
    {
        this.CORP_REPRESENTATIVE = CORP_REPRESENTATIVE;
    }

    public String getPRINC_PERSON()
    {
        return PRINC_PERSON;
    }

    public void setPRINC_PERSON(String PRINC_PERSON)
    {
        this.PRINC_PERSON = PRINC_PERSON;
    }

    public Date getUNIT_SETUP_TIME()
    {
        return UNIT_SETUP_TIME;
    }

    public void setUNIT_SETUP_TIME(Date UNIT_SETUP_TIME)
    {
        this.UNIT_SETUP_TIME = UNIT_SETUP_TIME;
    }

    public String getUNIT_WEB_SET()
    {
        return UNIT_WEB_SET;
    }

    public void setUNIT_WEB_SET(String UNIT_WEB_SET)
    {
        this.UNIT_WEB_SET = UNIT_WEB_SET;
    }

    public String getPHONETIC_MNEMONIC()
    {
        return PHONETIC_MNEMONIC;
    }

    public void setPHONETIC_MNEMONIC(String PHONETIC_MNEMONIC)
    {
        this.PHONETIC_MNEMONIC = PHONETIC_MNEMONIC;
    }

    public String getORG_STATUS()
    {
        return ORG_STATUS;
    }

    public void setORG_STATUS(String ORG_STATUS)
    {
        this.ORG_STATUS = ORG_STATUS;
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

    public Date getCREATION_TIME()
    {
        return CREATION_TIME;
    }

    public void setCREATION_TIME(Date CREATION_TIME)
    {
        this.CREATION_TIME = CREATION_TIME;
    }

    public String getP_ORG_CODE()
    {
        return P_ORG_CODE;
    }

    public void setP_ORG_CODE(String p_ORG_CODE)
    {
        P_ORG_CODE = p_ORG_CODE;
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

    public Organization getOrganization()
    {
        return organization;
    }

    public void setOrganization(Organization organization)
    {
        this.organization = organization;
    }

    public List<Organization> getSubOrganization()
    {
        return subOrganization;
    }

    public void setSubOrganization(List<Organization> subOrganization)
    {
        this.subOrganization = subOrganization;
    }

    public boolean isHasOrganization()
    {
        return hasOrganization;
    }

    public void setHasOrganization(boolean hasOrganization)
    {
        this.hasOrganization = hasOrganization;
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
