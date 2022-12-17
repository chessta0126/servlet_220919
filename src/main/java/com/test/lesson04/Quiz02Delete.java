package com.test.lesson04;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson04/quiz02_delete")
public class Quiz02Delete extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// content type 생략(redirect 할 것이므로)
		
		// request parameter 꺼내기
		int id = Integer.valueOf(request.getParameter("id"));

		// DB 연결
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		// searchUrl 테이블의 id 데이터 삭제 - query
		String deleteQuery = "delete from `searchUrl` where `id` = " + id + ";";
		try {
			ms.update(deleteQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// DB 연결 해제
		ms.disconnect();
		
		// 사용자 목록 화면으로 이동 (redirect)
		response.sendRedirect("/lesson04/quiz02/quiz02.jsp"); // throws로 예외처리
	}
}
