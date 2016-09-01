<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
// *mys.jsp
// Resultset rs:
// rs=stmt.executeQuery(sql);
// insert 시킬뿐만아니라 
// select까지 시켜서 결과값을 가져온다.
// rs.close()로 소멸시켜준다
// -string으로 변환시켰으니 string!!
// -string은 파싱이 안되기 때문에 객체로 변환시켜줘야한다.
	
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
	String sql="select * from student";
	//ResultSet: insert 시킬뿐만아니라 select까지 시켜서 결과값을 가져온다.
	ResultSet rs;

	try{
		conn = DriverManager.getConnection(mysqlURL, user, pass);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		String name ="";
		int age=0;
		JSONArray arr=new JSONArray();		
		//String myresult="";
		
		while( rs.next()){
			JSONObject jo=new JSONObject();			
			name = rs.getString("name");
			age = rs.getInt("age");
			jo.put("name",name);
			jo.put("age",age);
			arr.add(jo);
			//myresult +="이름:"+name+" 나이:"+age;
		}
		//rs.close()로 소멸시켜준다
		rs.close();
 //		out.print(myresult);
		out.print( arr.toJSONString() );
	}catch( Exception ex){
		out.print(ex.getMessage() );
	}
	conn.close();

%>
