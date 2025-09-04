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
<%@ include file="db.jsp"%>

	<div id="container">
		<form name="stu" action="Stu-Add-Result.jsp">
    <%
    	String stuNo = request.getParameter("stuNo"); // 쿼리스트링 값 가져오기
    	ResultSet rs = null;
		String query = "SELECT * FROM STUDENT WHERE STU_NO = " + stuNo;
		rs = stmt.executeQuery(query);
		rs.next();
    %>

		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>학년</th>
				<th>클래스</th>
				<th>성별</th>
				<th>키</th>
				<th>몸무게</th>
			</tr>

			<tr>

				<td><input type="text" name="stuNum" class="input-txt" value="<%= rs.getString("STU_NO") %>"></td>

				<td><input type="text" name="stuName" class="input-txt" value="<%= rs.getString("STU_NAME") %>"></td>

				<td><input type="text" name="stuDept" class="input-txt" value="<%= rs.getString("STU_DEPT") %>"></td>

				<td><input type="text" name="stuGrade" class="input-txt" value="<%= rs.getString("STU_GRADE") %>"></td>
				
				<td><input type="text" name="stuClass" class="input-txt" value="<%= rs.getString("STU_CLASS") %>"></td>
				
				<td><input type="text" name="stuGender" class="input-txt" value="<%= rs.getString("STU_GENDER") %>"></td>
				
				<td><input type="text" name="stuHeight" class="input-txt" value="<%= rs.getString("STU_HEIGHT") %>"></td>
				
				<td><input type="text" name="stuWeight" class="input-txt" value="<%= rs.getString("STU_WEIGHT") %>"></td>

			</tr>

		</table>
		<div>
        	<input type="button" value="수정" onclick="fnAdd()">
        </div>

</body>
</html>