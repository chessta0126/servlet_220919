package com.test.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlService {
	// 필드
	private static MysqlService mysqlService = null; // 싱글턴 패턴
	// static : 일단 메모리에 올라가고 시작하기 때문에, new를 할 수 없는 상황에서 사용 가능하게 함
	private String url = "jdbc:mysql://localhost:3306/db_220919"; // 도메인 뒤에 접속할 DB명까지 넣는다.
	private String id = "root";
	private String pw = "root"; // MySQL 비번 (깃허브에 노출될 수도 있으므로, root로 설정 했던 것)
	
	private Connection conn;
	private Statement statement;
	private ResultSet res;
	
	// 메서드
	// Singleton pattern : MysqlService라는 객체가 단 하나만 생성될 수 있도록 하는 디자인 패턴
	// DB 연결을 여러 객체에서 하지 않도록
	
	public static MysqlService getInstance() {
		if(mysqlService == null) { // 가져올 객체가 없을 경우 생성
			mysqlService = new MysqlService();
		}
		return mysqlService;
	}
	
	// DB 접속
	public void connect() {
		try {
			// 1. 드라이버(JDBC) 메모리에 로딩
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			// try-catch로 예외 처리
			
			// 2. DB 연결(connection)
			conn = DriverManager.getConnection(url, id , pw);
			
			// 3. statement : DB와 연결해서 쿼리를 실행하기 위한 준비
			statement = conn.createStatement();
			
		} catch (SQLException e) {
			e.printStackTrace(); // 연결문제 : 사용자가 할 수 있는게 없으므로, 에러 보여주고 끝낸다.
		}	
	}
	
	// DB 연결 해제
	public void disconnect() {
		try {
			statement.close(); // 쿼리 할 수 있는 것 끊기
			conn.close(); // 연결 끊기
		} catch (SQLException e) {
			e.printStackTrace(); // 연결문제 : 사용자가 할 수 있는게 없으므로, 에러 보여주고 끝낸다.
		}
	}
	
	// R : select
	public ResultSet select(String query) throws SQLException {
		res = statement.executeQuery(query);
		// 쿼리 작성자(request)에게 책임이 있다. -> throws
		return res;
	}
	
	// CUD : insert, update, delete
	public void update(String query) throws SQLException {
		statement.executeUpdate(query);
		// 쿼리 작성자(request)에게 책임이 있다. -> throws
	}
}
