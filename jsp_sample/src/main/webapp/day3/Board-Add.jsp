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
	<%
		String id = (String)session.getAttribute("sessionId"); //가져오고자하는 변수의 타입으로 다운캐스팅해주기
	%>
	<div id=container>
		<form name="board" action="Board-Add-Result.jsp">
		
        <table>
        	<tr>
        		<th>게시글종류</th>
        		<td>
        			<!-- 1.공지사항, 2.자유, 3. 문의 -->
        			<select name="kind">
        				<option value='1'>공지사항</option>
        				<option value='2'>자유게시판</option>
        				<option value='3'>문의게시판</option>
        			</select>
        		</td>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" class="input-txt"></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><input type="text" name="userId" class="input-txt" value="<%= id%>" disabled="disabled"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td id="contents">
                	<textarea name="contents" rows="20" cols="68"></textarea>
                </td>
            </tr>
        </table>
        <div>
        	<input type="button" value="작성" onclick="fnAdd()">
        </div>
    </form>
    </div>


</body>
</html>
<script>
	function fnAdd() {
		let form = document.board; // name이 board인거 불러오기
		form.submit();
	}
</script>