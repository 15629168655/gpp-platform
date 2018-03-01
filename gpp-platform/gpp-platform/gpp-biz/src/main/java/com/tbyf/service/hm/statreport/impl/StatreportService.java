package com.tbyf.service.hm.statreport.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.github.abel533.echarts.Option;
import com.github.abel533.echarts.axis.CategoryAxis;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.data.PieData;
import com.github.abel533.echarts.series.Bar;
import com.github.abel533.echarts.series.Pie;
import com.tbyf.service.hm.statreport.StatreportManager;


@Service
public class StatreportService implements StatreportManager {
	
	@Override
	public Option selectRemoveCauses() throws Exception {
	   
	    //数据库查询获取统计数据
	    //List<Map<String, Object>> list = kc22Mapper.selectRemoveCauses();
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> objectMap1 = new HashMap<>();
		objectMap1.put("ORG_NAME", "机构1");
		objectMap1.put("REFERRAL_SUM", "11");
		Map<String, Object> objectMap2 = new HashMap<>();
		objectMap2.put("ORG_NAME", "机构2");
		objectMap2.put("REFERRAL_SUM", "22");
		Map<String, Object> objectMap3 = new HashMap<>();
		objectMap3.put("ORG_NAME", "机构2");
		objectMap3.put("REFERRAL_SUM", "33");
		list.add(objectMap1);
		list.add(objectMap2);
		list.add(objectMap3);
	    //创建Option
	    Option option = new Option();
	    option.title("机构").tooltip(Trigger.axis).legend("转诊数");
	    //横轴为值轴
	    option.xAxis(new ValueAxis().boundaryGap(0d, 0.01));
	    //创建类目轴
	    CategoryAxis category = new CategoryAxis();
	    //柱状数据
	    Bar bar = new Bar("转诊数");
	    //饼图数据  
	    Pie pie = new Pie("转诊数"); 
	 
	    //循环数据
	    for (Map<String, Object> objectMap : list) {
	        //设置类目
	        category.data(objectMap.get("ORG_NAME"));
	        //类目对应的柱状图
	        bar.data(objectMap.get("REFERRAL_SUM"));
	      //饼图数据  
	        pie.data(new PieData(objectMap.get("ORG_NAME").toString(), objectMap.get("REFERRAL_SUM")));  
	    }
	    //设置类目轴
	    option.yAxis(category);
	  
	    //饼图的圆心和半径  
	    pie.center(900,380).radius(100);  
	    //设置数据  
	    option.series(bar, pie);  
	    //由于药品名字过长，图表距离左侧距离设置180，关于grid可以看ECharts的官方文档
	    option.grid().x(180);
	    //返回Option
	    return option;
	}
}
