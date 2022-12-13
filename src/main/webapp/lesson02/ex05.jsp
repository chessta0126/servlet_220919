<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex05 - Calendar</title>
</head>
<body>
<%
	// Date now = new Date();
	Calendar today = Calendar.getInstance(); // 싱글턴 패턴 아님(우연히 이름만 getInstance로 겹칠 뿐)
	// out.println(today);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
	// Date처럼 바로 Calendar 객체 못 넣음 -> Date로 변경해서 넣기(getTime())
	out.println(sdf.format(today.getTime()) + "<br>");

	
	// 날짜 연산 : .add
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 MM월 dd일");
	Calendar yesterday = Calendar.getInstance();
	yesterday.add(Calendar.DATE, -1); // 하루 전
/* 	yesterday.add(Calendar.MONTH, -1); // 한 달 전
	yesterday.add(Calendar.YEAR, -1); // 1년 전 */
	
	out.println("어제 날짜 : " + sdf2.format(yesterday.getTime()) + "<br>");
	
	
	// 날짜 비교 : 기준.compareTo(비교시점)
	// -> 1(기준이 더 최근),0(같음),-1(비교시점이 더 최근)
	int result = today.compareTo(yesterday);
	if(result > 0){
		out.print("today가 더 크다.");
	} else if(result == 0){
		out.print("같은 날이다.");
	} else {
		out.print("today가 더 작다.");
	}
	
%>
</body>
</html>