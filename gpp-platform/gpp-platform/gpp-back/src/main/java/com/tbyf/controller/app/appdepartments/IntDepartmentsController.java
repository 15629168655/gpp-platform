package com.tbyf.controller.app.appdepartments;

import com.tbyf.controller.base.*;
import com.tbyf.service.hm.departments.*;
import com.tbyf.util.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import javax.annotation.*;
import java.util.*;


/**
  * 科室-接口类 
  * 相关参数协议：
  * 00	请求失败
  * 01	请求成功
  * 02	返回空值
  * 03	请求协议参数不完整    
  * 04  用户名或密码错误
  * 05  FKEY验证失败
 */
@Controller
@RequestMapping(value="/appdepartments")
public class IntDepartmentsController extends BaseController {
    
	@Resource(name="departmentsService")
	private DepartmentsManager departmentsService;
	
	  /**
     * app科室注册接口
     * @return
     */
    @RequestMapping(value="/save")
    @ResponseBody
    public Object save()
    {
        logBefore(logger, "app通过科室标识、科室名称、上级科室标识注册科室信息");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
            if(Tools.checkKey("DEP_ID", pd.getString("FKEY"))){	//检验请求key值是否合法
                if(AppUtil.checkParam("saveDepartments", pd)){	//检查参数
                    if(departmentsService.findByDEP_ID(pd) != null) //表中如果已经存在该机构,则返回创建失败
                    {
                        result = "00";
                        map.put("result", result);
                        return AppUtil.returnObject(new PageData(), map);
                    }
                    pd.put("ISLEAF","1");
                    pd.put("DEPARTMENTS_ID", this.get32UUID());	//主键
                    departmentsService.save(pd);

                    //当在叶子节点下新增节点时，将原来的叶子节点的ISLEAF变为0
                    if(departmentsService.listSubDepByPARENT_DEP_ID(pd.getString("PARENT_DEP_ID")) != null)
                    {
                        PageData pd1 = new PageData();
                        pd1.put("DEP_ID",pd.getString("PARENT_DEP_ID"));
                        pd1.put("ISLEAF","0");
                        departmentsService.changeToParent(pd1);
                    }
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

	
	/**根据科室标识获取科室信息
	 * @return
	 */
	@RequestMapping(value="/getDepByDepId")
	@ResponseBody
	public Object getDepByDepId(){
		logBefore(logger, "根据科室标识获取科室信息");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			if(Tools.checkKey("DEP_ID", pd.getString("FKEY"))){	//检验请求key值是否合法
				if(AppUtil.checkParam("getDepByDepId", pd)){	//检查参数
					pd = departmentsService.findByDEP_ID(pd);
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
	
 