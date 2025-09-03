<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_Result.jsp</title>
</head>
<body>
<%@ include file="../db/db.jsp" %> <!-- db가져오기 -->
	
	<% 
	String userId = request.getParameter("userId"); //변수에 담기
	String pwd = request.getParameter("pwd");
	
	
	/* ResultSet : DB 조회 결과를 담는 객체 */
	ResultSet rs = null;
	String query = "SELECT * FROM TBL_USER WHERE USERID = '" + userId + "' AND PASSWORD = '" + pwd + "'";
	
	/* stmt: SQL문을 DB로 보내 실행시키는 도구 . rs에 결과를 담음*/
	rs = stmt.executeQuery(query);
	
	if(rs.next()){ //값이 있으면 true리턴
	    response.sendRedirect("Main.jsp");
	}else{
	    out.println("<h2 style='color: red'>로그인 실패</h2>");
	}
	%>
</body>
</html>