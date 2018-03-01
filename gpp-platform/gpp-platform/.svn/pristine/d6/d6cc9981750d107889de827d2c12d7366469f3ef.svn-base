package com.tbyf.ehr.client;

import org.apache.cxf.endpoint.Client;
import org.apache.cxf.endpoint.ClientImpl;
import org.apache.cxf.endpoint.Endpoint;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;
import org.apache.cxf.service.model.BindingInfo;
import org.apache.cxf.service.model.ServiceInfo;
import org.apache.xml.utils.QName;

import com.tbyf.ehr.util.StringHelper;

public class ClientTest {
		 public static void main(String[] args) throws Exception {  
		        JaxWsDynamicClientFactory clientFactory = JaxWsDynamicClientFactory.newInstance();  
		        Client client = clientFactory.createClient("http://127.0.0.1:8081/ehr-webservice/service/UserGenerinfo?wsdl"); 
		       StringBuffer str  =new StringBuffer();
		       str.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
		       str.append("<request>");
		       str.append("<requestid>110</requestid> ");
		       str.append("<inputvalues>");
		       str.append("<idcode>421125197901253325</idcode>");
		       str.append("</inputvalues>");
		       str.append("</request>");
		       String  inputxml=str.toString();
		   	  String inputxmlbase64 = StringHelper.getBASE64(inputxml.getBytes("utf-8"));
		        Object[] result = client.invoke("CheckSpecialFile", inputxmlbase64);  
		        System.out.println(result[0]);  
		         
		}

	
	
	
/*	public static void main(String[] args) {
		JaxWsProxyFactoryBean svr = new JaxWsProxyFactoryBean();
		    svr.setServiceClass(HelloWorld.class);
		    svr.setAddress("http://localhost:8081/helloWorld");
		    HelloWorld hw = (HelloWorld) svr.create();
		    User user = new User();
		    user.setName("Tony");
		    //user.setDescription("test");
		    System.out.println(hw.sayHiToUser(user));
		         
		}*/
		 

		 /*   private static final QName SERVICE_NAME = new QName(namespace, serviceName);
	
		    public static void main(String[] args) throws Exception {
		        // 远程webService的URL
		        String hostUrl = "****************?wsdl";
		        try {
		            // 创建动态客户端
		            JaxWsDynamicClientFactory factory = JaxWsDynamicClientFactory.newInstance();
		            // 创建客户端连接
		            Client client = factory.createClient(hostUrl, SERVICE_NAME);
		            ClientImpl clientImpl = (ClientImpl) client;
		            Endpoint endpoint = clientImpl.getEndpoint();
		            // Make use of CXF service model to introspect the existing WSDL
		            ServiceInfo serviceInfo = endpoint.getService().getServiceInfos().get(0);
		            // 创建QName来指定NameSpace和要调用的service
		            QName bindingName = new QName(namespace, service);
		            BindingInfo binding = serviceInfo.getBinding(bindingName);
		            // 创建QName来指定NameSpace和要调用的方法
		            QName opName = new QName(namespace, methodName);
		            
		            BindingOperationInfo boi = binding.getOperation(opName);
		            BindingMessageInfo inputMessageInfo = boi.getInput();
		            List<MessagePartInfo> parts = inputMessageInfo.getMessageParts();
		            // 取得对象实例
		            MessagePartInfo partInfo = parts.get(0);
		            Class<?> partClass = partInfo.getTypeClass();
		            Object inputObject = partClass.newInstance();

		            // 取得字段的set方法并赋值
		            PropertyDescriptor partPropertyDescriptor = new PropertyDescriptor("字段名", partClass);
		            Method userNoSetter = partPropertyDescriptor.getWriteMethod();
		            userNoSetter.invoke(inputObject, 属性值);

		            // 取得字段的set方法并赋值
		            PropertyDescriptor partPropertyDescriptor2 = new PropertyDescriptor("字段名", partClass);
		            Method productCodeSetter = partPropertyDescriptor2.getWriteMethod();
		            productCodeSetter.invoke(inputObject, 属性值);

		            // 调用客户端invoke()方法，把inputObject传递给要调用的方法并取得结果对象
		            Object[] result = client.invoke(opName, inputObject);
		            // 取得的结果是一个对象
		            Class<?> resultClass = result[0].getClass();
		            // 取得返回结果的get方法并得到它的值
		            PropertyDescriptor resultDescriptor = new PropertyDescriptor("结果字段名", resultClass);
		            Object resultGetter = resultDescriptor.getReadMethod().invoke(result[0]);
		            System.out.println("result：" + resultGetter);
		            // 取得返回结果的get方法并得到它的值
		            PropertyDescriptor tokenDescriptor = new PropertyDescriptor("结果字段名", resultClass);
		            // 取得的是一个对象实例
		            Object getObj= tokenDescriptor.getReadMethod().invoke(result[0]);
		            if(tokenGetter != null) {
		                Class<?> resultTokenClass = tokenDescriptor.getReadMethod().invoke(result[0]).getClass();
		                // 得到对象实例下的***属性值
		                PropertyDescriptor expiredTimeDescriptor = new PropertyDescriptor(字段名, resultTokenClass);
		                Object getter = expiredTimeDescriptor.getReadMethod().invoke(getObj);
		                System.out.println("字段名：" + getter );
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }*/
}
