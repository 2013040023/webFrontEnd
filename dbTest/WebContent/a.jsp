<%@ page language="java" import="org.json.simple.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%		
/* *a.jsp 문서
-비동기 요청하는 프로토콜객체
서버로부터 데이터가 수신됐을때, 이벤트 함수 호출(응답이 오면 on_ready 호출
-GET 방식
-비동기 요청으로 수행

on_ready()
-정상적인상태이면


 */
 	String myname=request.getParameter("myname");
 	String myage=request.getParameter("myage");
 	out.println("<h1>이름: "+myname+"</h1>");
 	out.println("<h1>나이: "+myage+"</h1>");
 	
	JSONArray arr=new JSONArray();	
	JSONObject jo=new JSONObject();
	
	jo.put("name",myname);
	jo.put("age",myage);
	
	JSONObject jo1=new JSONObject();
	jo1.put("name","bbb");
	jo1.put("age",40);
	
	arr.add(jo);
	arr.add(jo1);
	out.print(arr.toJSONString());

	out.print(jo.toJSONString());	
	out.println("<div>헬러</div>");


%>