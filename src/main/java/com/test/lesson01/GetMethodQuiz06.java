package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz06")
public class GetMethodQuiz06 extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json");
		
		PrintWriter out = response.getWriter();
		
		Integer number1 = Integer.parseInt(request.getParameter("number1"));
		Integer number2 = Integer.parseInt(request.getParameter("number2"));
		
		Integer addtion = number1 + number2;
		Integer subtraction = number1 - number2;
		Integer multiplication = number1 * number2;
		Integer division = number1 / number2;
		
		out.print("{\"addition\": " + addtion
				+ ",\"subtraction\": " + subtraction
				+ ",\"multiplication\": " + multiplication
				+ ",\"division\": " + division + "}");
	}
}
