<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>길이 변환</title>
</head>
<body>
	<%
		int cm = Integer.parseInt(request.getParameter("length"));
		String[] standardArr = request.getParameterValues("standard");
	%>
	
	<div class="container">
		<h1>길이 변환 결과</h1>
		<h3><%= cm %> cm</h3>
		<hr>
		
		<h2>
		<%
			if(standardArr != null){
				for(String standard:standardArr){
					if(standard.equals("inch")){
						double inch = cm * 0.393701;
						out.print(inch + " in<br>");
					} else if(standard.equals("yard")){
						double yard = cm * 0.0109361;
						out.print(yard + " yd<br>");
					} else if(standard.equals("feet")){
						double feet = cm * 0.0328083;
						out.print(feet + " ft<br>");
					} else if(standard.equals("meter")){
						double meter = cm / 100.0;
						out.print(meter + " m<br>");
					}
				}
			}
		%>
		</h2>
	</div>
</body>
</html>