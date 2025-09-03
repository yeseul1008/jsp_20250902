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
	<!-- 인서트 하기 전에 학번이 이미 있는지 확인하고 -->
	<!-- 없으면 인서트, 있으면 해당 학번은 이미 사용중입니다 -->
	<%
		String stuNo = request.getParameter("stuNo");
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		
		String query1 = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		int result1 = stmt.executeUpdate(query1);
		
		if(result1 > 0) {
			out.println("해당학번은 이미 사용중입니다.");
		}else{
			String query = "INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT) VALUES('"
			        + stuNo + "', '"
			        + stuName + "', '"
			        + stuDept + "')";

			int result = stmt.executeUpdate(query);
			
			if(result > 0){
				out.println("추가되었습니다.");
			} else {
				out.println("오류가 발생했습니다.");
			}
		}
	%>
</body>
</html>