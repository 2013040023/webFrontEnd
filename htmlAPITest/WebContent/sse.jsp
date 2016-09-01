
<%@ page language="java" import="org.json.simple.*" contentType="text/event-stream; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- contentType을 event-stream으로 바꾸어 주어야 한다. -->
<%

	JSONArray jarr=new JSONArray();
	JSONObject jo=new JSONObject();
	jo.put("mname","명량");
	jo.put("nCnt",300);
	jarr.add(jo);

	jo=new JSONObject();
	jo.put("mname","해적");
	jo.put("nCnt",500);
	jarr.add(jo);

	String str;
	str=String.format("data:%s\n\n",jarr.toJSONString() );
	//서버에서 문자열로 보냈으니까, 프론트엔드에서 json으로 바꿔줘야 한다.
	out.print("retry:3000\n");
	out.print(str);
	
// 	// retry:3초에 한번씩 보낸다. data: 메시지 부분은 메시지 구분을 위해서 개행이 꼭 두번 들어가야 된다
// 	out.print("retry:3000\n");
// 	out.print("data:hello\n\n");
	
// 	out.print("event:mymessage\n");
// 	out.print("data:hi...\n\n");
%>