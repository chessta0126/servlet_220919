package com.test.lesson04;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson04/quiz03_insert")
public class UploadPageInsert extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// response.setCharacterEncoding("utf-8"); // 이미 필터 적용
		// content type 생략(redirect <- 내가 응답을 만들지 않음)

		// request parameter 꺼내기
		int sellerId = Integer.parseInt(request.getParameter("sellerId"));
		String title = request.getParameter("title");
		int price = Integer.parseInt(request.getParameter("price"));
		String description = request.getParameter("description");
		String pictureUrl = request.getParameter("pictureUrl");

		// DB 연동
		MysqlService ms = MysqlService.getInstance(); // 객체 생성
		ms.connect(); // 실제 연결

		// searchUrl에 insert 쿼리
		String insertQuery = "insert into `used_goods`"
		+ "(`sellerId`,`title`,`price`,`description`,`pictureUrl`,`createdAt`,`updatedAt`)"
		+ "values" + "('"
		+ sellerId + "','" + title + "','" + price + "','" + description + "','" + pictureUrl + "',now(),now());";
		
		try {
			ms.update(insertQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// DB 연결 해제
		ms.disconnect();

		// 사용자 목록 화면으로 이동
		// redirect : 이미 있는 별도의 페이지로 링크해주는 것(request가 새로 발생)
		response.sendRedirect("/lesson04/quiz03/template.jsp"); // throws로 예외처리
	}
}
