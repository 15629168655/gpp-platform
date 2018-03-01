package com.tbyf.ehr.util;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.WebServiceContext;

import org.apache.cxf.transport.http.AbstractHTTPDestination;

public class ClientIPCXF {
	
	@Resource
    private WebServiceContext context;
	 /**
     * CXF获取客户端IP地址
     * 
     * @Author MH
     * @return
     */
    public String getClientIpCxf() {
        try {
            javax.xml.ws.handler.MessageContext ctx = context
                    .getMessageContext();
            HttpServletRequest request = (HttpServletRequest) ctx
                    .get(AbstractHTTPDestination.HTTP_REQUEST);
            String ip = request.getRemoteAddr();
            System.out.println("对方主机IP"+ip);
            return ip;
        } catch (Exception e) {
            System.out.println("无法获取对方主机IP");
            e.printStackTrace();
            return null;
        }
    }
/*    
    *//**
     * XFIRE获取客户端IP地址
     * 
     * @Author MH
     * @return
     *//*
    public static String getClientIpXfire() {
        String ip = null;
        try {
            HttpServletRequest request = XFireServletController.getRequest();
            ip = request.getRemoteAddr();
            return ip;
        } catch (Exception e) {
            System.out.println("无法获取对方主机IP");
            e.printStackTrace();
            return null;
        }
    }

    *//**
     * AXIS获取客户端IP地址
     * 
     * @Author MH
     * @return
     *//*
    public static String getClientIpAxis() {
        try {
            MessageContext mc = MessageContext.getCurrentContext();
            HttpServletRequest request = (HttpServletRequest) mc
                    .getProperty(HTTPConstants.MC_HTTP_SERVLETREQUEST);
            System.out.println("remote ip: " + request.getRemoteAddr());
            return request.getRemoteAddr();
        } catch (Exception e) {
            System.out.println("无法获取对方主机IP");
            e.printStackTrace();
            return null;
        }

    }*/

}
