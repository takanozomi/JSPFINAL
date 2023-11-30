<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DatabaseMetaData" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
</head>
<body>
    <h2>FIRST PAGE</h2>
    <form action="userJoinAction.jsp" method="post">
        <label for="userID">아이디:</label>
        <input type="text" name="userID" id="userID" required><br> 

        <label for="userPW">비밀번호:</label>
        <input type="password" name="userPW" id="userPW" required><br> 

        <label for="userEmail">이메일:</label>
        <input type="email" name="userEmail" id="userEmail" required><br> 

        <label for="gender">성별:</label>
        <select name="gender" id="gender" required>
            <option value="male">남성</option>
            <option value="female">여성</option>
        </select><br>

        <input type="submit" value="회원가입">
    </form>

    <hr>

    <h2>VIEW COLUMNS</h2>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DatabaseMetaData" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page import="java.sql.Statement" %>

    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/MYSQL";
            String dbID = "root";
            String dbPW = "marisstella";
            
            Connection conn = DriverManager.getConnection(dbURL, dbID, dbPW);
            DatabaseMetaData metaData = conn.getMetaData();
            ResultSet resultSet = metaData.getColumns(null, null, "user", null);

            out.println("<h3>Columns in the 'user' table:</h3>");
            out.println("<ul>");

            while (resultSet.next()) {
                String columnName = resultSet.getString("COLUMN_NAME");
                String dataType = resultSet.getString("TYPE_NAME");

                out.println("<li>Column Name: " + columnName + ", Data Type: " + dataType + "</li>");
            }

            out.println("</ul>");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>Error retrieving columns.</p>");
        }
    %>
</body>
</html>
