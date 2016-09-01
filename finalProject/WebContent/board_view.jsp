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
	String menum = request.getParameter("num");
	int num=Integer.parseInt(menum);
	String sql="select * from gongyou where num="+num+"";	
 	//out.print("board_view.jsp"+num);	
 	
	ResultSet rs;	
	try{
		conn = DriverManager.getConnection(mysqlURL, user, pass);
 		stmt = conn.createStatement();
	 	rs = stmt.executeQuery(sql);

 		int mynum=0;
		String title ="";
		String writer ="";
		String content="";
		
		JSONArray arr = new JSONArray();
		
		while( rs.next()){			
			JSONObject member = new JSONObject();					
			
			mynum = rs.getInt("num");
			title = rs.getString("title");
			writer = rs.getString("writer");
			content = rs.getString("content");			
			
			member.put("num", mynum);
		 	member.put("title", title);
		 	member.put("writer", writer);
		 	member.put("content",content);
		 	arr.add(member);
		}
		out.print(arr.toJSONString());
		System.out.println( "=>"+arr.toJSONString());
		rs.close(); 
	}catch( Exception ex){
		out.print("Error");
		out.print(ex.getMessage() );
	}
	conn.close();

%>

    