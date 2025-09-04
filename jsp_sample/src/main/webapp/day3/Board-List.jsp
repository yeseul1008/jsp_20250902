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
a {
	text-decoration: none;
}
.page a{
	text-decoration: none;
	color : black;
	padding: 5px;
	text-align: center;
}
.page .active {
	font-weight: bold;
	text-decoration: underline;
}
</style>
</head>
<body>

	<%@ include file="db.jsp"%>

	<div id="container">
		<div id="search">
			검색어 : <input id="keyword">
			<button onclick="fnSearch()">검색</button>
		</div>
		<div id="number">
			<select id="search" onchange="fnNumber(this.value)"> <!-- 한 페이지에 나타낼 게시글 개수 선택-->
				<%                       // onchange: 선택 한 값을 벨류로 파라미터 보내기 가능
					int arr[] = {3,5,7,10,15,20};
					for(int i = 0; i<arr.length; i++){
				%>
						<option value="<%=arr [i] %>"><%= arr[i] + "개씩" %></option>
				<%		
					}
				%>
			</select>
		</div>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>
				<%
				    // 현재 정렬 상태 확인
				    String orderKind = request.getParameter("orderKind");
				    if(orderKind == null){
				%>
				    <a href="javascript:;" onclick="fnList('CNT', 'DESC')">조회수</a>
				<%
				    } else if(orderKind.equals("DESC")){
				%>
				    <a href="javascript:;" onclick="fnList('CNT', 'ASC')">조회수▼</a>
				<%
				    } else {
				%>
				    <a href="javascript:;" onclick="fnList('CNT', 'DESC')">조회수▲</a>
				<%
				    }
				%>
				</th>
				<th>작성일</th>
			</tr>

			<%
			ResultSet rs = null;

			// 검색어 가져오기
			String keyword = request.getParameter("keyword");
			String keywordQuery = "";

			if (keyword != null) { // 검색어가 있으면 실행되는 코드
				keywordQuery = "WHERE TITLE LIKE '%" + keyword + "%' ";
			}
			
			// 정렬 조건 가져오기
			String column = request.getParameter("column");
			String orderQuery = "";
			if(column != null && orderKind != null){
				orderQuery = "ORDER BY " + column + " " + orderKind;
			}
			
			/* 페이징 변수 */
			int pageSize = 5; // 한 페이지에 몇개씩 보여줄지 저장하는 변수 (디폴트값 5)
			int currentPage = 1;
			
			
			
			if(request.getParameter("size")!= null){
				pageSize = Integer.parseInt(request.getParameter("size")); // 사용자가 선택한 개수
			}
			if(request.getParameter("page")!= null){
				currentPage = Integer.parseInt(request.getParameter("page"));
			}
			/* 현재페이지 위치에 따라서 가져올 값을 정하기 위해 offset 구하기 */
			int offset = (currentPage - 1) * pageSize;
			
			
			String cntQuery = "SELECT COUNT(*) TOTAL FROM TBL_BOARD";
			ResultSet rsCnt = stmt.executeQuery(cntQuery);
			rsCnt.next();
			
			int total = rsCnt.getInt("TOTAL"); //게시글 전체 개수
			
			int pageList = (int) Math.ceil((double)total / pageSize);
			
			
			// 최종 쿼리
			String query = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') CTIME "
						+ "FROM TBL_BOARD B " + keywordQuery + orderQuery
						+ " OFFSET " + offset + " ROW FETCH NEXT " + pageSize + " ROW ONLY" ;

			rs = stmt.executeQuery(query);

			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("BOARDNO")%></td>
				<td>
					<a href="javascript:;" onclick="fnBoard(<%=rs.getString("BOARDNO")%>)">
						<%=rs.getString("TITLE")%>
					</a>
				</td>
				<td><%=rs.getString("USERID")%></td>
				<td><%=rs.getString("CNT")%></td>
				<td><%=rs.getString("CTIME")%></td>
			</tr>
			<%
			}
			%>
		</table>
		<div class="page">
			<%
				for(int i=1; i<=pageList; i++){ //밑에 페이지 번호 넣기
					if(i == currentPage){
					out.println("<a href='?page=" + i + "&size=" + pageSize +"' class='active'>" + i + "</a>");
					}else{
					out.println("<a href='?page=" + i + "&size=" + pageSize +"'>" + i + "</a>");
					}
				}
			%>
		</div>
		<div>
			<a href="Board-Add.jsp">
				<input type="button" value="글쓰기">
			</a>
		</div>
	</div>

</body>
</html>

<script>
	function fnBoard(boardNo){
		location.href = "Board-View.jsp?boardNo=" + boardNo;
	}

	function fnSearch(){
		let keyword = document.querySelector("#keyword").value;
		location.href = "Board-List.jsp?keyword=" + keyword;
		// 현재 페이지를 다시 열면서 키워드 매개변수를 주소에 추가해서 보내줌
	}

	function fnList(column, orderKind) {
		location.href = "?column=" + column + "&orderKind=" + orderKind;
	}
	
	function fnNumber(number) {
		location.href="?size=" + number;
	}
</script>
