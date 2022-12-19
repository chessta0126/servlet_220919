<%@page import="com.test.common.MysqlService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// DB 연결
MysqlService ms = MysqlService.getInstance(); // 객체 생성
ms.connect(); // 연결

// DB select query
String selectQuery = "select * from `seller` group by `nickname`;";
ResultSet rs = ms.select(selectQuery);
%>

<% boolean validation = true; %>
<script>
	$(document).ready(function() {
		// 저장 클릭 시
		$('#save').on('click', function() {
			// 노드 가져오기
			let sellerId = $('#sellerId').val();
			let title = $('#title').val();
			let price = $('#price').val();
			
			if (sellerId == "0") {
				alert("아이디를 선택해주세요");
				<% validation = false; %>
				return;
			}
			if (title.length < 1) {
				alert("제목을 입력해주세요");
				<% validation = false; %>
				return;
			}
			if (price.length < 1) {
				alert("가격을 입력해주세요");
				<% validation = false; %>
				return;
			}

			// 전부 입력됐다면 등록 승인 안내 공지
			alert("상품 등록이 완료 되었습니다.");
		});
	});
</script>

<div class="m-5">
	<div class="display-4">물건 올리기</div>
	<form method="post" action="/lesson04/quiz03_insert"
	<% if(validation == false){ %>
		onSubmit="return false;"
	<%} %>
	>
		<div class="d-flex justify-content-between pt-5 pb-3">
			<!-- nickname -->
			<select class="form-control col-3" id="sellerId" name="sellerId">
				<option value=0>-아이디 선택-</option>
				<%
				while (rs.next()) {
				%>
				<option value="<%=rs.getInt("id")%>"><%=rs.getString("nickname")%></option>
				<!-- sellerId가 잘 입력됐었다면, 닉네임으로 group by된 순서(id)대로 메겼을 것 -->
				<%
				}
				%>
			</select>

			<!-- title -->
			<input type="text" class="form-control col-5" id="title" name="title"
				placeholder="제목">

			<!-- price -->
			<div class="col-2">
				<div class="input-group">
					<input type="text" class="form-control" id="price" name="price"
						placeholder="가격">
					<div class="input-qroup-append">
						<button type="button" class="btn btn-secondary">원</button>
					</div>
				</div>
			</div>
		</div>

		<!-- description -->
		<textarea cols="150" rows="7" class="form-control mb-3"
			name="description"></textarea>

		<!-- pictureUrl -->
		<div class="input-group mb-3">
			<div class="input-qroup-append">
				<button type="button" class="btn btn-secondary">이미지 url</button>
			</div>
			<input type="text" class="form-control" name="pictureUrl">
		</div>

		<!-- submit -->
		<button type="submit" id="save" class="w-100 btn btn-secondary">저장</button>
	</form>
</div>

<%
// DB 연결 해제
ms.disconnect();
%>