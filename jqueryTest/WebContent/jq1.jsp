<%@ page language="java" import="org.json.simple.*" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String name=request.getParameter("name");
	String age=request.getParameter("age");
	out.print("<h1>이름:"+name+" 나이:"+age+"</h1>");
	
// 	JSONArray arr=new JSONArray();
// 	JSONObject jo=new JSONObject();
// 	jo.put("name","aaa");
// 	jo.put("age",30);
	
// 	JSONObject jo1=new JSONObject();
// 	jo1.put("name","bbb");
// 	jo1.put("age",40);
	
// 	arr.add(jo);
// 	arr.add(jo1);
// 	out.print(arr.toJSONString());

%>