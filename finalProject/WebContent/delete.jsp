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
   
   int mynum = Integer.parseInt(request.getParameter("num"));
	System.out.println( "=>"+mynum);
	
   String sql="delete from gongyou where num='"+mynum+"'";
   System.out.println( "=>"+sql);
	


   try{
      conn = DriverManager.getConnection(mysqlURL, user, pass);
//       pstmt = conn.prepareStatement(sql);
      stmt = conn.createStatement();
      stmt.executeUpdate(sql);
      out.print("delete success");
   }catch( Exception ex){
	   System.out.println( "error");
      out.print(ex.getMessage());
   }
   conn.close();

%>