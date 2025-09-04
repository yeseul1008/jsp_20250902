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

				<td><input type="text" name="stuNum" class="input-txt"></td>

				<td><input type="text" name="stuName" class="input-txt"></td>

				<td><input type="text" name="stuDept" class="input-txt"></td>

				<td><input type="text" name="stuGrade" class="input-txt"></td>
				
				<td><input type="text" name="stuClass" class="input-txt"></td>
				
				<td><input type="text" name="stuGender" class="input-txt"></td>
				
				<td><input type="text" name="stuHeight" class="input-txt"></td>
				
				<td><input type="text" name="stuWeight" class="input-txt"></td>

			</tr>

		</table>
		<div>
        	<input type="button" value="작성" onclick="fnAdd()">
        </div>

</body>
</html>
<script>
	function fnAdd(){
		let form = document.stu; 
		form.submit();
		
	}
</script>