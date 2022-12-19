<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이번달 달력</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
</head>
<body>
	<%
	Calendar firstday = Calendar.getInstance(); // 오늘
	firstday.set(Calendar.DATE,1); // 오늘을 1일로 세팅
	int DAY_OF_WEEK = firstday.get(Calendar.DAY_OF_WEEK); // 1일의 요일(일:1)
	int lastDay = firstday.getActualMaximum(Calendar.DATE);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
	String yearMonth = sdf.format(firstday.getTime());
	%>
	<div class="container text-center">
		<h1><%=yearMonth%></h1>
		<table class="table">
			<thead>
				<th class="text-danger">일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</thead>
			<tbody>
			<!-- 첫째 주 -->
				<tr>
				<% // 첫째 주 빈칸 출력	
				for(int i = 1; i < DAY_OF_WEEK; i++){ // 첫날 요일 이전만큼 빈칸(일:1으로 시작)
				%>
					<td><span class="display-4"><%=""%></span></td>
				<%
				}
				%>

				<% // 첫째 주 날짜 출력 : 1일 ~ (7-빈칸)
				for(int i = 1; i <= 7-(DAY_OF_WEEK-1) ; i++){ // 1일부터 7개 숫자 나열 - 앞의 빈공간
				%>
					<td><span class="display-4"><%=i%></span></td>
				<%
				}
				%>
				</tr>
				
			<!-- 2~5째 주 -->
				<%
				for (int j = 0; j <= 3; j++) {
				%>
				<tr>
					<%
					for (int i = 7 - (DAY_OF_WEEK - 1) + 1 + (7 * j); i <= 7 - (DAY_OF_WEEK - 1) + 7 + (7 * j); i++) {
						// 시작 : 지난 주 마지막 일 + 1 (+ 주 만큼 7일을 더함) // 끝 : 시작 + 7일
						if(i > lastDay){ //  마지막 날이 넘어가면 끝내기
							break;
						}
					%>
							<td><span class="display-4"><%=i%></span></td>
					<%
					}
					%>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>