<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container {
	width: 700px;
	margin: 20px auto; /* 가운데 정렬 */
}

table, tr, td, th {
	border: 1px solid black;
	text-align: center;
	border-collapse: collapse;
	padding: 5px 10px;
}

th {
	background-color: beige;
}

#search {
	margin-bottom: 10px;
}
</style>
</head>
<body>

	<%@ include file="db.jsp"%>

	<!-- jsp 문법 통해 CRUD - 테이블 만들기 -->



	<div id="container">

		<div id="search">

			검색어 : <input id="keyword" name="keyword">

			<button onclick="fnSearch()">검색</button>

		</div>

		<!-- 상단(제목)영역 만들기: html 식으로 넣기(이게 더 나음) / 자바식으로도 넣을 수는 있음 -->

		<table>

			<tr>

				<th>학번</th>

				<th>이름</th>

				<th>학과</th>

				<th>키</th>

			</tr>



			<!-- DB에서 목록 가져오기 -->

			<%
			ResultSet rs = null;

			// 검색어 input란에 입력값이 들어와서 검색 클릭(함수실행)이 되면 그 파라미터 값 변수에 넣음

			// 처음에 검색하기 전까지는 keyword는 null임

			String keyword = request.getParameter("keyword");

			String keywordQuery = "";

			if (keyword != null && !keyword.trim().equals("")) {
				keywordQuery = " WHERE STU_NAME LIKE '%" + keyword + "%' "; 
			}

			// SQL문 완성
			String query = "SELECT * FROM STUDENT " + keywordQuery;
			rs = stmt.executeQuery(query); // 실행 (select)

			while (rs.next()) {

				// DB 테이블의 각 행에 순차적 접근하면서 한줄씩 출력하기
			%>

			<!-- 여기 while문 열고닫은 사이에 html 태그 작성 가능 -->

			<tr>

				<td><%=rs.getString("STU_NO")%></td>

				<td>
					<a href="javascript:;" onclick="fnBoard('<%=rs.getString("STU_NO")%>')"><%=rs.getString("STU_NAME")%>
					</a>
				</td>

				<td><%=rs.getString("STU_DEPT")%></td>

				<td><%=rs.getString("STU_HEIGHT")%></td>

			</tr>

			<%
			}
			%>

		</table>



	</div>







</body>
</html>
<script>	

	function fnBoard(stuNo){
		location.href = "Stu-View.jsp?stuNo=" + stuNo;
	}

	function fnSearch(){

		let keyword = document.querySelector("#keyword").value; // 밸류값이 필요
		location.href = "Stu-List.jsp?keyword=" + keyword;
	}


</script>