<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>즐겨찾기 목록</title>
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
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

	<%
	// DB 연결 해제
	ms.disconnect();
	%>
</body>
</html>