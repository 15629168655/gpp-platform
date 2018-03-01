package com.tbyf.controller.gp.job;

import java.util.List;
import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;

import com.tbyf.service.gp.job.TaskInfoManager;
import com.tbyf.service.gp.job.impl.TaskInfoService;
import com.tbyf.util.PageData;

@Controller
public class TimingTask extends HttpServlet {
	
	/*@Resource(name="taskInfoService")
	private TaskInfoManager taskInfoService;*/
	private static final long serialVersionUID = 8960476626701739939L;
	public void init()throws ServletException{
	    System.out.println("enter ToJob init");
	    super.init();
	    Timer timer = new Timer();
	    timer.schedule(new TimerTask()
	    {
	      public void run(){
	        try {
	          StdSchedulerFactory factorys = new StdSchedulerFactory();
	          Scheduler schedule = factorys.getScheduler();
	          Properties props = new Properties();
				props.put("org.quartz.scheduler.instanceName", "fuck_a_dog");
				props.put("org.quartz.threadPool.threadCount", "10");
				props.put("org.quartz.threadPool.class", "org.quartz.simpl.SimpleThreadPool");
				factorys.initialize(props);
				//从数据量读取配置文件
				//List<PageData> datelist= new TaskInfoService().querytask();
				//List<PageData> datelist= taskInfoService.querytask();
	          for (Class<?> clazz : new Class[] {HypertensionInfoList.class})// job 
	          {
	            JobDetail jobDetail = new JobDetail(clazz.getSimpleName(),"defaultext", clazz);// 
	            CronTrigger trigger = new CronTrigger(clazz.getSimpleName() + "Trigger", "DEFAULT");
	            trigger.setCronExpression("0 0/1 * * * ?");//Config.getProperties("orderInfo." +clazz.getSimpleName().toLowerCase()))
	            schedule.scheduleJob(jobDetail, trigger);
	          }
	          schedule.start();
	          System.out.println("exit Job init");
	        } catch (Exception e) {
	          e.printStackTrace();
	          System.out.println("Job init fail");
	        }
	      }
	    }
	 , 60000L);
	    System.out.println("leavel ToJob init");
	  }
	
	public static void main(String[] args) {
		
		//List<PageData> datelist= taskInfoService.querytask();
		
		//从数据量读取配置文件
	/*	try {
			@SuppressWarnings("unused")
			List<PageData> datelist= new TaskInfoService().querytask();
		} catch (Exception e) {
			e.printStackTrace();
		}*/
	//	test();
	}
	
	
	public static void  test(){
		ApplicationContext ctx = new FileSystemXmlApplicationContext("WebContent/WEB-INF/spring/*.xml");   //创建容器类上下文
		TaskInfoService cfpanmouncementService= (TaskInfoService) ctx.getBean("taskInfoService");
		try {
			List<PageData> list = cfpanmouncementService.querytask();
			System.out.println("11111"+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	


}