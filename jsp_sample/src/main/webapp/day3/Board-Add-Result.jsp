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
		String id = (String)session.getAttribute("sessionId"); //가져오고자하는 변수의 타입으로 다운캐스팅해주기
	%>
	<%
		String kind = request.getParameter("kind");
		String title = request.getParameter("title");
		String userId = request.getParameter("userId");
		String contents = request.getParameter("contents");
		
		String query = "INSERT INTO TBL_BOARD VALUES("
						+ "B_SEQ.NEXTVAL, " 
						+ "'" + title + "',"
						+ "'" + contents + "',"
						+ "'" + id + "',"
						+ "0, "
						+ "0, "
						+ "'" + kind + "',"
						+ "SYSDATE, "
						+ "SYSDATE"
						+ ")";
		int result = stmt.executeUpdate(query);
		if(result > 0 ){
			out.println("작성되었습니다!");
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