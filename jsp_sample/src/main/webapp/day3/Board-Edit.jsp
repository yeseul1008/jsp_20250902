<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container{
		width: 700px;
		margin: 20px auto;
	}

	table, tr, td, th {
		border: 1px solid black;
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
	.input-txt{
		width: 95%;
		height: 25px;
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
		rs.next();
		String kind = rs.getString("KIND"); //전달된 kind값 저장됨
    %>
	<div id=container>

		<form name="board" action="Board-Edit-Result.jsp">
			<input name="boardNo" value="<%= rs.getString("BOARDNO") %>" hidden>
			<!-- 보드번호 값도 보내주기위해. 굳이 보여줄 필요는없으니 히든으로 숨김 -->
        <table>
        	<tr>
        		<th>게시글종류</th>
        		<td>
        			<!-- 1.공지사항, 2.자유, 3. 문의 -->
        			<select name="kind" >
        				<option value='1' <%= "1".equals(kind) ? "selected" : "" %>>공지사항</option>
        				<option value='2' <%= "2".equals(kind) ? "selected" : "" %>>자유게시판</option>
        				<option value='3' <%= "3".equals(kind) ? "selected" : "" %>>문의게시판</option>
        			</select>
        		</td>
            <tr>
                <th>제목</th>
                <td>
    			<input type="text" name="title" class="input-txt" value="<%= rs.getString("TITLE") %>">
				</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><input type="text" name="userId" class="input-txt" value="<%= rs.getString("USERID") %>"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td id="contents">
                	<textarea name="contents" rows="20" cols="68"><%= rs.getString("CONTENTS") %></textarea>
                </td>
            </tr>
        </table>
        <div>
        	<input type="button" value="수정" onclick="fnEdit()">
        </div>
    </form>

    </div>


</body>
</html>
<script>
	function fnEdit() {
		let form = document.board; // name이 board인거 불러오기
		form.submit();
	}
</script>