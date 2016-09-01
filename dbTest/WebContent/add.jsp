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
	String sql="insert into sinsang(name, age, birth) values(?,?,?)";
	
	String myname=request.getParameter("stdname");
	String myage=request.getParameter("stdage");
	String mybirth=request.getParameter("stdbirth");	
	int age=Integer.parseInt(myage);
// 	Date mydate = request.parseInt(mybirth);

	
// 	SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd HH:mm:ss");	
// 	String from = "2013-04-08 10:10:10";
// 	SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
// 	Date to = transFormat.parse(from);
	
	try{
		conn = DriverManager.getConnection(mysqlURL, user, pass);
		pstmt = conn.prepareStatement(sql);
		//ÀÓ²©Á¤¾¾¿Í 40¼¼¸¦ ³Ö¾îÁÜ.
		pstmt.setString(1, myname);
		pstmt.setInt(2, age);		
		pstmt.setString(3,mybirth);
		//stmt = conn.createStatement();
		//stmt.execute(sql);
		pstmt.execute();
		out.print("insert success");
	}catch( Exception ex){
		out.print(ex.getMessage() );
	}
	conn.close();

%>












