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

@WebServlet("/lesson04/quiz01")
public class quiz01 extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		response.setCharacterEncoding("utf-8"); // 이미 filter 패키지에서 설정함
		response.setContentType("text/plain");

		// DB 연결
		MysqlService ms = MysqlService.getInstance(); // 객체 생성
		ms.connect(); // ★ 실질적인 DB 연결(필수!!)

		// DB insert 한 행
		String insertQuery = "insert into `real_estate`"
				+ "(`realtorId`,`address`,`area`,`type`,`price`)"
				+ "values"
				+ "(3, '헤라펠리스 101동 5305호',350,'매매', 1500000);";
				
		try {
			ms.update(insertQuery);
		} catch (SQLException e1) {
			e1.printStackTrace(); // update 잘못된 건 서버 잘못 -> try-catch로 처리해주자
		}

		// DB selet & 결과 출력
		PrintWriter out = response.getWriter(); // error 입력자 잘못이므로 throws로 예외처리

		String selectQuery = "select `address`, `area`, `type` from `real_estate` order by `id` desc limit 10";
		try {
			ResultSet resultSet = ms.select(selectQuery);
			while(resultSet.next()) { // 결과 행이 있는 동안 수행(hasNext() 역할)
				out.print("매물 주소: " + resultSet.getString("address") + ", ");
				out.print("면적: " + resultSet.getInt("area") + ", ");
				out.println("타입: " + resultSet.getString("type"));
			}

		} catch (SQLException e) {
			e.printStackTrace(); // 쿼리 선택 잘못된 건 서버 잘못 -> try-catch로 처리해주자
		}
		
		// DB 연결 끊기
		ms.disconnect();
	}
}
