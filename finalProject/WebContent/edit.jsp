<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
	}catch(Exception ex){
		out.print(ex.getMessage() );
	}

	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	String mysqlURL ="jdbc:mysql://localhost:3306/world";
	String user ="root";
	String pass = "1234";

	String title = request.getParameter("title");
	String content =request.getParameter("content");
	String menum=request.getParameter("num");
	int num=Integer.parseInt(menum);

	String sql="update gongyou set title='"+title+"',content='"+content+"' where num="+num+"";
			

	try{
		
	      conn = DriverManager.getConnection(mysqlURL, user, pass);
	      stmt = conn.createStatement();
	      stmt.executeUpdate(sql);

 		int mynum=0;
		title ="";
		content="";
		
		JSONArray arr = new JSONArray();
		
		out.print(arr.toJSONString());
		System.out.println( "=>"+arr.toJSONString());

	}catch( Exception ex){
		out.print("Error");
		out.print(ex.getMessage() );
	}
	conn.close();

%>
