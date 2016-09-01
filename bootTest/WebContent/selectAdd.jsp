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
	String mysqlURL ="jdbc:mysql://localhost:3306/world";
	String user ="root";
	String pass = "1234";
	String sql="select * from gongyou";
	ResultSet rs;
	try{
		conn = DriverManager.getConnection(mysqlURL, user, pass);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		int num=0;
		String title ="";
		String writer ="";
		
		JSONArray arr = new JSONArray();

		while( rs.next()){
			JSONObject member = new JSONObject();

			num = rs.getInt("num");
			title = rs.getString("title");
			writer = rs.getString("writer");
		
			
			member.put("num", num);
		 	member.put("title", title);
		 	member.put("writer", writer);
		 	arr.add(member);
		}
		rs.close();
		out.print(arr.toJSONString());
	}catch( Exception ex){
		out.print(ex.getMessage() );
	}
	conn.close();

%>
    