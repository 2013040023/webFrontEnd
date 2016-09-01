<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
		out.print("driver load success");
	}catch(Exception ex){
		out.print(ex.getMessage() );
	}
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	String mysqlURL ="jdbc:mysql://localhost:3306/world";
	String user ="root";
	String pass = "1234";
	//String sql="insert into student(name, age) values('È«±æµ¿',30)";
	String sql="insert into student(name, age) values(?,?)";
	
	String myname=request.getParameter("myname");
	String myage=request.getParameter("myage");
	int age=Integer.parseInt(myage);
	
	try{
		conn = DriverManager.getConnection(mysqlURL, user, pass);
		pstmt = conn.prepareStatement(sql);
		//ÀÓ²©Á¤¾¾¿Í 40¼¼¸¦ ³Ö¾îÁÜ.
		pstmt.setString(1, myname);
		pstmt.setInt(2, age);
		//stmt = conn.createStatement();
		//stmt.execute(sql);
		pstmt.execute();
		out.print("insert success");
	}catch( Exception ex){
		out.print(ex.getMessage() );
	}
	conn.close();

%>












