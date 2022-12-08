<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz01</title>
</head>
<body>
<%! // 선언문
	// 1. 1부터 n까지의 합계를 구하는 함수
	public int getSum(int N) {
		int sum = 0;
		for(int i = 1; i < N; i++){
			sum += i;
		}
		return sum;
	}
%>
	
	
<%
	// 2. 평균
	int[] scores = {80, 90, 100, 95, 80};
		int sum = 0;
		for(int i = 0; i < scores.length; i++){
			sum += scores[i];
		}
	double average = (double)sum / scores.length;
	
	
	// 3. 채점결과
	// 방법 1 : for-each문
	double quizScore = 0;
	List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
	for(String score : scoreList){
		if(score.equals("O")){
			quizScore += 100 / scoreList.size();
		}
	}
	
	// 방법 2 : for문
	/* for(int i = 0; i <scoreList.size(); i++){
		if(scoreList.get(i).equals("O")){
			quizScore += 100 / scoreList.size();
		}
	} */
	
	
	// 4. 나이 구하기
	String birthDay = "20010820";
	LocalDate now = LocalDate.now();
	String currentYear = now.toString().substring(0,4);
	int currentYear2 = Integer.parseInt(currentYear);
	
	String birthYear = birthDay.substring(0,4);
	int birthYear2 = Integer.parseInt(birthYear);
	int age = currentYear2 - birthYear2 + 1;	
%>


<h2>1부터 50까지의 합은 <%= getSum(50) %>입니다.</h2>
<h2>평균 점수는 <%= average %> 입니다.</h2>
<h2>채점 결과는 <%= quizScore %>점 입니다.</h2>
<h2><%= birthDay %>의 나이는 <%= age %>세 입니다.</h2>
</body>
</html>