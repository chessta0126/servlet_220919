<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>quiz03_1</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<%
	int height = 0;
	int weight = 0;
	
	if(request.getParameter("name").equals("height")){
		height = Integer.parseInt(request.getParameter("name"));
	} else if(request.getParameter("name").equals("weight")){
		weight = Integer.parseInt(request.getParameter("name"));
	}
	
	double BMI = weight / ((height / 100.0) * (height / 100.0));
	
	String result = null;
	
	if(BMI <= 20){
		result = "저체중";
	} else if(BMI >= 21 && BMI <= 25){
		result = "정상";
	} else if(BMI >= 26 && BMI <= 30){
		result = "과체중";
	} else {
		result = "비만";
	}

%>

<h3><b>BMI</b> 측정 결과</h3>
<span class="display-3">당신은 <span class="text-info"><%= result %></span> 입니다.</span>
<span>BMI 수치 : <%= BMI %></span>
</body>
</html>