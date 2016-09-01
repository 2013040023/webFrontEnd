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
	String sql="insert into gongyou(title,writer,pwd,content) values(?,?,?,?)";

	String title = request.getParameter("title");
	String writer=request.getParameter("writer");
	String pwd =request.getParameter("pwd");
	String content =request.getParameter("content");
	
	
	try{
		conn = DriverManager.getConnection(mysqlURL, user, pass);
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, title);
		pstmt.setString(2, writer);
		pstmt.setString(3, pwd);
		pstmt.setString(4, content);
		
		pstmt.execute();
		out.print("insert success");
	}catch( Exception ex){
		out.print(ex.getMessage());
	}
	conn.close();

%>