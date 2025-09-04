<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board_View.jsp</title>
<style>
	#container{
		width: 700px;
		margin: 20px auto;
	}

	table, tr, td, th {
		border: 1px solid black;
		text-align: center;
		border-collapse: collapse;
		padding: 5px 10px; /* 세미콜론 추가 */
	}
	th {
		background-color: #ccc;
		width: 100px; /* 세미콜론 추가 */
	}
	td {
		width: 500px;
	}
	.contents {
		height: 300px;
	}
</style>
</head>
<body>
	<%@ include file="db.jsp" %>

    <%
    	String boardNo = request.getParameter("boardNo"); // 쿼리스트링 값 가져오기
    	ResultSet rs = null;
		String query = "SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
		rs = stmt.executeQuery(query);
    %>

    <div id="container">
	<%
		if(rs.next()){
	%>
	<form name="board" action="Board-Remove.jsp" method="post">
		<input type="hidden" name="boardNo" value="<%= rs.getString("BOARDNO") %>">
        <table>
            <tr>
                <th>제목</th>
                <td><%= rs.getString("TITLE") %></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%= rs.getString("USERID") %></td>
            </tr>
            <tr>
                <th>조회수</th>
                <td><%= rs.getString("CNT") %></td>
            </tr>
            <tr>
                <th>작성일</th>
                <td><%= rs.getString("CDATETIME") %></td>
            </tr>
            <tr>
                <th class="contents">내용</th>
                <td id="contents"><%= rs.getString("CONTENTS") %></td>
            </tr>
        </table>
        <div>
       	<%
		String sessionId = (String)session.getAttribute("sessionId"); //가져오고자하는 변수의 타입으로 다운캐스팅해주기
		String userId = rs.getString("USERID"); // 게시글의 작성자 아이디 변수 만들기
		String status = (String)session.getAttribute("sessionStatus"); //status 기준으로 하기위한
		if(sessionId.equals(userId) || status.equals("A")) { // A는 관리자 (관리자는 다 수정 삭제 가능해야하니까)
		%>
		<div>
        	<input type="button" value="삭제" onclick="fnRemove()">
        	<input type="button" value="수정" onclick="fnEdit(<%= rs.getString("BOARDNO") %>)">
		</div>
		<%
		}
		%>
        </div>
    </form>
    <%
      } else {
           out.print("게시글 조회에 실패했습니다");
      }
    %>
    </div>

</body>
</html>
<script>
	function fnEdit(boardNo){
		let board = document.board;
		board.action = "Board-Edit.jsp?boardNo=" + boardNo;
		board.submit();
		console.log(board.action);
		
	}
	
	function fnRemove() {
		let board = document.board;
		if(!confirm("정말 삭제하시겠습니까?")){
			return;
		}
		board.submit();
	}
</script>
