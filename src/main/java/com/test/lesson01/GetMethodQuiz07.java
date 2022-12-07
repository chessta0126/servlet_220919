package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz07")
public class GetMethodQuiz07 extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String address = request.getParameter("address");
		String card = request.getParameter("card");
		int price = Integer.parseInt(request.getParameter("price"));
		
		out.print("<html><head><title>주문결과</title></head><body>");
			if(!address.contains("서울시")) {
//			if(address.contains("서울시")==false) {
				out.println("배달 불가 지역입니다");
			} else if(card.equals("신한카드")) {
				out.println("결제 불가 카드 입니다.");
			} else {			
				out.print(address +" <b>배달준비중</b><br>");
				out.print("결제금액:" + price + "원");
			}
		out.print("</body></html>");
	}

}
