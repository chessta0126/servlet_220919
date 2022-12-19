<%@page import="com.test.common.MysqlService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
// DB 연결
MysqlService ms = MysqlService.getInstance(); // 객체 생성
ms.connect(); // 연결

// DB select query
String selectQuery = "select * from `seller`;";
ResultSet rs = ms.select(selectQuery);
%>

<div class="m-5">
	<div class="display-4">물건 올리기</div>
	<div class="d-flex justify-content-between pt-5 pb-3">
		<!-- id -->
		<select class="form-control col-3">
			<option>-아이디 선택-</option>
			<%
			while (rs.next()) {
			%>
			<option><%=rs.getString("nickname")%></option>
			<%
			}
			%>
		</select>
		
		<!-- title -->
		<input type="text" class="form-control col-5" value="제목">
		
		<!-- price -->
		<input type="text" class="form-control col-2" value="가격">
		
	</div>
	<textarea cols="150" rows="7" class="form-control"></textarea>
	<input type="text" class="form-control mt-3">


</div>

<%
// DB 연결 해제
ms.disconnect();
%>
