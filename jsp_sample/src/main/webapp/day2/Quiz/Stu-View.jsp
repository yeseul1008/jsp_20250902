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
    
    	ResultSet rs = null;
    	String stuNo = request.getParameter("stuNo");
    	
    	String query = "SELECT S.STU_NO, S.STU_NAME, S.STU_DEPT, AVG(ENR_GRADE) AS AVG_GRADE " +
    	               "FROM STUDENT S LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO " +
    	               "WHERE S.STU_NO = '" + stuNo +
    	               "' GROUP BY S.STU_NO, S.STU_NAME, S.STU_DEPT";
    	
    	rs = stmt.executeQuery(query);
    %>

    <div id="container">
	<%
		if(rs.next()){
	%>
	<form name="board" action="Stu-Remove.jsp" method="post">
		<input type="hidden" name="stuNo" value="<%= rs.getString("STU_NO") %>">
        <table>
            <tr>
                <th>학번</th>
                <td><%= rs.getString("STU_NO") %></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><%= rs.getString("STU_NAME") %></td>
            </tr>
            <tr>
                <th>학과</th>
                <td><%= rs.getString("STU_DEPT") %></td>
            </tr>
            <tr>
                <th>시험평균점수</th>
                <td><%= rs.getString("AVG_GRADE") %></td>
            </tr>
        </table>
        <div>
        	<input type="button" value="삭제" onclick="fnRemove()">
        	<input type="button" value="수정" onclick="fnEdit(<%= rs.getString("STU_NO") %>)">
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
	function fnRemove() {
		let board = document.board;
		if(!confirm("정말 삭제하시겠습니까?")){
			return;
		}
		board.submit();
	}
	function fnEdit(stuNo) {
		let board = document.board;
		board.action = "Stu-Edit.jsp?stuNo=" + stuNo;
		board.submit();
		console.log(board.action);
	}
</script>