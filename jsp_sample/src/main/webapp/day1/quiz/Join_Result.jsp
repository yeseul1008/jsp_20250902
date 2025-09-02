<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <%
    String id = request.getParameter("userId");
    String pwd = request.getParameter("pwd"); 
    String name = request.getParameter("userName");
    String gender = request.getParameter("gender");
    String[] hobby = request.getParameterValues("hobby");
    %>

    <h2>회원가입 결과</h2>
    <!-- %=로 선언된 변수 출력 -->
    <div>아이디: <%= id %></div> 
    <div>비밀번호: <%= pwd %></div>
    <div>이름: <%=name %></div>
    <div>성별: <%= gender.equals("M") ? "남자" : "여자" %> </div>
    <p>취미: 
        <%
            if (hobby != null) {
                for (int i = 0; i < hobby.length; i++) {
                    out.print(hobby[i]);
                    if (i < hobby.length - 1) {
                        out.print(", "); // 콤마로 구분
                    }
                }
            } else {
                out.print("선택한 취미가 없습니다.");
            }
        %>
    </p>
</body>
</html>