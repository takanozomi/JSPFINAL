<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>

<%
    request.setCharacterEncoding("UTF-8");
    String userID = request.getParameter("userID");
    String userPW = request.getParameter("userPW");
    String userEmail = request.getParameter("userEmail");
    String gender = request.getParameter("gender");

    if (userID == null || userPW == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안된 사항이 있습니다.')");
        script.println("history.back();");
        script.println("</script>");
        script.close();
        // 여기서 return을 하여 이후 코드를 실행하지 않도록 함
        return;
    }

    UserDAO userDAO = new UserDAO();
    int result = userDAO.join(userID, userPW, userEmail, gender);

    if (result == 1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('회원가입 성공')");
        script.println("location.href = 'index.jsp'");
        script.println("</script>");
    } else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('회원가입 실패')");
        script.println("history.back();");
        script.println("</script>");
    }
%>

</body>
</html>