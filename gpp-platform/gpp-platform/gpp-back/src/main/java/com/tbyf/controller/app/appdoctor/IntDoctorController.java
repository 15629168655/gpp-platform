package com.tbyf.controller.app.appdoctor;

import com.tbyf.controller.base.*;
import com.tbyf.service.hm.yhry.*;
import com.tbyf.util.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import javax.annotation.*;
import java.util.*;

/**
 * 机构-接口类
 * 相关参数协议：
 * 00	请求失败
 * 01	请求成功
 * 02	返回空值
 * 03	请求协议参数不完整
 * 04   用户名或密码错误
 * 05   KEY验证失败
 */

@Controller
@RequestMapping(value="/appdoctor")
public class IntDoctorController extends BaseController
{
    @Resource(name="yhryService")
    private YhryManager yhryService;

    /**
     * app医护人员注册注册接口
     * @return
     */
    @RequestMapping(value="/save")
    @ResponseBody
    public Object save()
    {
        logBefore(logger, "app通过医护人员ID,医护人员姓名,机构编码注册医护人员信息");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
            if(Tools.checkKey("PROVIDER_ID", pd.getString("FKEY"))){	//检验请求key值是否合法
                if(AppUtil.checkParam("saveDoctor", pd)){	//检查参数
                    if(yhryService.findByProviderId(pd) != null) //表中如果已经存在该医护人员ID,则返回创建失败
                    {
                        result = "00";
                        map.put("result", result);
                        return AppUtil.returnObject(new PageData(), map);
                    }
                    pd.put("ID", this.get32UUID());	//主键
                    yhryService.save(pd);
                    map.put("pd", pd);
                    result = (null == pd) ?  "02" :  "01";
                }else {
                    result = "03";
                }
            }else{
                result = "05";
            }
        }catch (Exception e){
            logger.error(e.toString(), e);
        }finally{
            map.put("result", result);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }

    /**根据医护人员ID获取医护人员信息
     * @return
     */
    @RequestMapping(value="/getDocById")
    @ResponseBody
    public Object getDocById(){
        logBefore(logger, "根据医护人员ID获取医护人员信息");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
            if(Tools.checkKey("PROVIDER_ID", pd.getString("FKEY"))){	//检验请求key值是否合法
                if(AppUtil.checkParam("getDocById", pd)){	//检查参数
                    pd = yhryService.findByProviderId(pd);
                    map.put("pd", pd);
                    result = (null == pd) ?  "02" :  "01";
                }else {
                    result = "03";
                }
            }else{
                result = "05";
            }
        }catch (Exception e){
            logger.error(e.toString(), e);
        }finally{
            map.put("result", result);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
}
