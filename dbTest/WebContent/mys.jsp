<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
// *mys.jsp
// Resultset rs:
// rs=stmt.executeQuery(sql);
// insert ��ų�Ӹ��ƴ϶� 
// select���� ���Ѽ� ������� �����´�.
// rs.close()�� �Ҹ�����ش�
// -string���� ��ȯ�������� string!!
// -string�� �Ľ��� �ȵǱ� ������ ��ü�� ��ȯ��������Ѵ�.
	
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
	//ResultSet: insert ��ų�Ӹ��ƴ϶� select���� ���Ѽ� ������� �����´�.
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
			//myresult +="�̸�:"+name+" ����:"+age;
		}
		//rs.close()�� �Ҹ�����ش�
		rs.close();
 //		out.print(myresult);
		out.print( arr.toJSONString() );
	}catch( Exception ex){
		out.print(ex.getMessage() );
	}
	conn.close();

%>
