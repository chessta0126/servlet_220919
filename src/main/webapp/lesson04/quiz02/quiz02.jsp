<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>
	<%
	// DB 연결
	MysqlService ms = MysqlService.getInstance();
	ms.connect();

	// DB select query
	// resultSet은 한 테이블만 쓸 수 있다.(동시 구동 불가) -> join으로 합쳐서 써야 함
	String selectQuery = "select * from `searchUrl` order by `id` desc;";
	ResultSet rs = ms.select(selectQuery);
	%>

	<div class="container">
		<table class="table text-center">
			<thead>
				<th>사이트</th>
				<th>사이트 주소</th>
			</thead>
			<tbody>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("name")%></td>
					<td><a href="<%=rs.getString("url")%>"><%=rs.getString("url")%></a></td>
					<td><a href="/lesson04/quiz02_delete?id=<%=rs.getInt("id")%>">삭제</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<%
	// DB 연결 해제
	ms.disconnect();
	%>
</body>
</html>