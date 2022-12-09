<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex03_1 - POST Method</title>
</head>
<body>
	<%
	String nickname = request.getParameter("nickname");
	String hobby = request.getParameter("hobby");
	String animal = request.getParameter("animal");
	String[] foodArr = request.getParameterValues("food"); // 선택 항목이 여러 개일 때
	String fruit = request.getParameter("fruit");
	%>

	<table border=1>
		<tr>
			<th>별명</th>
			<td><%= nickname %></td>
		</tr>
		<tr>
			<th>취미</th>
			<td><%= hobby %></td>
		</tr>
		<tr>
			<th>선호하는 동물</th>
			<td><%= animal %></td>
		</tr>
		<tr>
			<th>음식</th>
			<td>
				<%
				String result = ""; // null로 하면 이어붙이기 안 됨
				if (foodArr != null) {
					for (String food : foodArr) {
						result += food + ", ";
					}

					// 맨 뒤에 붙은 콤마,띄어쓰기 제거
					result = result.substring(0, result.length() - 2);
				}
				%>
				<%= result %>
			</td>
		</tr>
		<tr>
			<th>과일</th>
			<td><%= fruit %></td>
		</tr>
	</table>
</body>
</html>