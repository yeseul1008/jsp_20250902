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
		String stuNum = request.getParameter("stuNum");
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		String stuGrade = request.getParameter("stuGrade");
		String stuClass = request.getParameter("stuClass");
		String stuGender = request.getParameter("stuGender");
		String stuHeight = request.getParameter("stuHeight");
		String stuWeight = request.getParameter("stuWeight");
		
		String query = "INSERT INTO STUDENT VALUES(" 
						+ "'" + stuNum + "',"
						+ "'" + stuName + "',"
						+ "'" + stuDept + "',"
						+ "" + stuGrade + ","
						+ "'" + stuClass + "',"
						+ "'" + stuGender + "',"
						+ "" + stuHeight + ","
						+ "" + stuWeight + ""
						+ ")";
		System.out.println(query);
		int result = stmt.executeUpdate(query);
		if(result > 0 ){
			out.println("추가되었습니다!");
			%>
			<div>
				<a href="Stu-List.jsp"><button>목록으로</button></a>
			</div>
			<%
		} else{
			out.println("오류가 발생했습니다.");
		}
		
	%>
</body>
</html>