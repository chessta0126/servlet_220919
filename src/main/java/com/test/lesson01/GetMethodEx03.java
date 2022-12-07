package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex03")
public class GetMethodEx03 extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json");
		
		// request 파라미터 꺼내기
		String userId = request.getParameter("user_id");
		String name = request.getParameter("name");
		Integer age = Integer.parseInt(request.getParameter("age"));
		
		PrintWriter out = response.getWriter();
		
//		out.print("user_id : " + userId);
//		out.print("name : " + name);
//		out.print("age : " + age);
		
		// JSON (JavaScript Object Notation) String으로 response 구성하기
		// {"user_id":"tjdrhkd0126","name":"chessta","age":25}
		
		out.print("{\"user_id\":\"" + userId + "\",\"name\":\"" + name + "\",\"age\":" + age + "}");
	}
}