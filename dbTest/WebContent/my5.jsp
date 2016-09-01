<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	response.setContentType("text/xml");
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
		//out.print("driver load success");
	}catch(Exception ex){
		out.print(ex.getMessage() );
	}
	Connection conn = null;
	Statement stmt = null;
	String mysqlURL ="jdbc:mysql://localhost:3306/world";
	String user ="root";
	String pass = "1234";
	String sql="select * from sinsang";
	ResultSet rs;
	try{
		conn = DriverManager.getConnection(mysqlURL, user, pass);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		String name ="";
		int age=0;
		Date birth;
		
		StringBuffer xmlResult = new StringBuffer();
		xmlResult.append("<student>");
		while( rs.next()){
			name = rs.getString("name");
			age = rs.getInt("age");
			birth=rs.getDate("birth");
					
			xmlResult.append("<people>");
			xmlResult.append("<name>"+name+"</name>");
			xmlResult.append("<age>"+age+"</age>");
			xmlResult.append("<birth>"+birth+"</birth>");
			xmlResult.append("</people>");
		}
		xmlResult.append("</student>");
		rs.close();
		out.print( xmlResult );
	}catch( Exception ex){
		out.print(ex.getMessage() );
	}
	conn.close();

%>



