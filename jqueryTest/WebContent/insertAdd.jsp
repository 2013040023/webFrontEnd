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
	String sql="insert into sinsang(name, age, birth) values(?,?,?)";

	String myname = request.getParameter("name");
	String age=request.getParameter("age");
	int myage = Integer.parseInt(age);
	String mybirth = request.getParameter("birth");
	
	try{
		conn = DriverManager.getConnection(mysqlURL, user, pass);
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, myname);
		pstmt.setInt(2, myage);
		pstmt.setString(3, mybirth);
		
		pstmt.execute();
		out.print("insert success");
	}catch( Exception ex){
		out.print(ex.getMessage() );
	}
	conn.close();

%>