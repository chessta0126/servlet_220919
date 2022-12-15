package com.test.lesson04;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson04/Ex01")
public class Ex01 extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		
		// DB 연결
		MysqlService ms = MysqlService.getInstance(); // 객체 생성
		ms.connect(); // ★ 실질적인 DB 연결(필수!!)
		
		// DB insert 한 행
		String insertQuery = "insert into `used_goods`"
				+ "(`sellerId`,`title`,`description`,`price`)"
				+ "	values"
				+ "(1, '고양이 간식 팝니다', '저희 고양이가 입맛이 까다로워서 잘 안 먹어요ㅠ', 2000);";
		
		try {
			ms.update(insertQuery);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		// DB selet & 결과 출력
		PrintWriter out = response.getWriter(); // error 입력자 잘못이므로 throws로 에러처리
		
		String selectQuery = "select * from `used_goods`";
		try {
			ResultSet resultSet = ms.select(selectQuery);
			while(resultSet.next()) { // 결과 행이 있는 동안 수행(hasNext() 역할)
				out.println(resultSet.getInt("id"));
				out.println(resultSet.getInt("title"));
				out.println(resultSet.getInt("price"));
				out.println(resultSet.getInt("description"));
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// DB 연결 해제
		ms.disconnect();
	}
}
