<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Board-List.jsp</title>

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

	<%@ include file="../db/db.jsp"%>

	<!-- jsp 문법 통해 CRUD - 테이블 만들기 -->



	<div id="container">

		<div id="search">

			검색어 : <input id="keyword">

			<button onclick="fnSearch()">검색</button>

		</div>

		<!-- 상단(제목)영역 만들기: html 식으로 넣기(이게 더 나음) / 자바식으로도 넣을 수는 있음 -->

		<table>

			<tr>

				<th>번호</th>

				<th>제목</th>

				<th>작성자</th>

				<th>조회수</th>

				<th>작성일</th>

			</tr>



			<!-- DB에서 목록 가져오기 -->

			<%
			ResultSet rs = null;

			// 검색어 input란에 입력값이 들어와서 검색 클릭(함수실행)이 되면 그 파라미터 값 변수에 넣음

			// 처음에 검색하기 전까지는 keyword는 null임

			String keyword = request.getParameter("keyword");

			String keywordQuery = "";

			if (keyword != null) {

				// null이 아니라면, 즉 input창 통해 검색이 되어 변수에 값이 들어왔다면

				// '제목' 기준으로 입력한 keyword를 포함하는 게시글 찾기

				keywordQuery = "WHERE TITLE LIKE '%" + keyword + "%'";

			}

			String query = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') CTIME " +

					"FROM TBL_BOARD B " + keywordQuery;

			rs = stmt.executeQuery(query); // 실행 (select)

			while (rs.next()) {

				// DB 테이블의 각 행에 순차적 접근하면서 한줄씩 출력하기
			%>

			<!-- 여기 while문 열고닫은 사이에 html 태그 작성 가능 -->

			<tr>

				<!-- ↓ 표현식 안에 안쓰면 문자열로 인식해버림 -->

				<td><%=rs.getString("BOARDNO")%></td>



				<!-- ↓ 게시글 제목 누르면 상세페이지로 넘어가도록 해보기 (onclick 또는 a태그) -->

				<td>
					<!-- 어떤 게시글번호 제목을 눌렀는지 주소창에 같이 포함해서 보내주기 --> <!-- 방법1) a태그 : href 속성 안에도 표현식 넣을 수 있다 -->

					<%-- <a href="Board-View.jsp?boardNo=<%= rs.getString("BOARDNO") %>">

							<%= rs.getString("TITLE") %>

						</a> --%> <!-- 방법2) onclick --> <a href="javascript:;"
					onclick="fnBoard(<%=rs.getString("BOARDNO")%>)"> <%=rs.getString("TITLE")%>

				</a>

				</td>



				<td><%=rs.getString("USERID")%></td>

				<td><%=rs.getString("CNT")%></td>

				<td><%=rs.getString("CTIME")%></td>

				<!-- ↑ yyyy-mm-dd 형태로만 출력하기 -->

				<!-- 위처럼 컬럼을 따로 정의해야할땐(?) 테이블에 별칭 만들어야 함-->

				<!-- 40행 SELECT 절을 저렇게 수정해야함 -->

			</tr>

			<%
			}
			%>

		</table>



	</div>







</body>

</html>

<script>	

	function fnBoard(boardNo){

		location.href = "Board-View.jsp?boardNo=" + boardNo;

	}

	

	function fnSearch(){

		let keyword = document.querySelector("#keyword").value; // 밸류값이 필요해

		location.href = "Board-List.jsp?keyword=" + keyword;

	}

	

</script>