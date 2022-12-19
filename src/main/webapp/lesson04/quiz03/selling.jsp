<%@page import="com.test.common.MysqlService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// DB 연결
MysqlService ms = MysqlService.getInstance(); // 객체 생성
ms.connect(); // 연결

// DB select query
String selectQuery = "select A.*, B.* from `seller`as A join `used_goods` as B on A.id = B.sellerId order by A.id desc;";
ResultSet rs = ms.select(selectQuery);
%>

<section class="pt-3">
	<div class="d-flex flex-wrap justify-content-between">
		<%
		while (rs.next()) {
		%>
		<div class="border border-danger mb-5">
			<div class="m-2">
				<%
				if (rs.getString("pictureUrl") == null) {
				%>
				<div class="d-flex justify-content-center align-item-center">
					<div
						class="emptybox d-flex justify-content-center align-item-center">
						<div class="text-secondary">이미지 없음</div>
					</div>
				</div>
				<%
				} else {
				%>
				<img src="<%=rs.getString("pictureUrl")%>" width=280 height=280>
				<%
				}
				%>
				<div class="font-weight-bold"><%=rs.getString("description")%></div>
				<div class="font-weight-bold text-secondary"><%=rs.getInt("price")%>원</div>
				<div class="font-weight-bold text-danger"><%=rs.getString("nickname")%></div>
			</div>
		</div>
		<%
		}
		%>
	</div>
</section>

<%
// DB 연결 해제
ms.disconnect();
%>