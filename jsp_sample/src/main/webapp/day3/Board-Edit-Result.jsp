<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="db.jsp" %>
	<%
		String boardNo = request.getParameter("boardNo");
		String kind = request.getParameter("kind");
		String title = request.getParameter("title");
		String userId = request.getParameter("userId");
		String contents = request.getParameter("contents");
		
		String query = "UPDATE TBL_BOARD SET "
				+ "TITLE = '" + title + "', "
				+ "USERID = '" + userId + "', "
				+ "CONTENTS = '" + contents + "', "
				+ "KIND = '" + kind + "' "
				+ "WHERE BOARDNO = '" + boardNo + "'";
		
		int result = stmt.executeUpdate(query);
		if(result > 0 ){
			out.println("수정되었습니다!");
			%>
			<div>
				<a href="Board-List.jsp"><button>목록으로</button></a>
			</div>
			<%
		} else{
			out.println("오류가 발생했습니다.");
		}
		
	%>
</body>
</html>