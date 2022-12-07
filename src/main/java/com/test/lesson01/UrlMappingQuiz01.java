package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UrlMappingQuiz01 extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 한글 깨짐 방지
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");   
		
		PrintWriter out = response.getWriter();
		
		Date now = new Date();
		
		// formatter 
		SimpleDateFormat sdf = new SimpleDateFormat("오늘의 날짜는 yyyy년 M월 d일"); //두자리면 알아서 뜸, 한 자리면 0 안붙이고 출력
		out.println(sdf.format(now));
	}
}
