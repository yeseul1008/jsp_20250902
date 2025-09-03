<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../db/db.jsp" %>
	<!-- ../db/db.jsp 파일을 현재 JSP에 그대로 포함시킴 -->
	<% 
		ResultSet rs = null;
		/* DB 조회 결과를 저장할 변수 선언. */
		String query = "SELECT * FROM STUDENT";
		rs = stmt.executeQuery(query);
		/* stmt(Statement 객체)를 이용해 쿼리 실행, 결과는 rs에 담김 */
		
/* 		rs.next(); // 데이터가 있으면 true리턴, 아니면 false리턴
		String stuName = rs.getString("STU_NAME"); // 해당 컬럼의 값 담기
		out.print(stuName + " "); */
		
	while(rs.next()){
		
		String stuName = rs.getString("STU_NAME"); // 해당 컬럼의 값 담기
		out.println(stuName + " ");
	}
	%>
	
</body>
</html>