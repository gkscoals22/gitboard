<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String name, email, subject, memo, time;
	name = request.getParameter("name").trim();
	email = request.getParameter("email").trim();
	subject = request.getParameter("subject");
	memo = request.getParameter("memo");
	time = request.getParameter("time");
	
	//DB 연동
	String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	String DB_URL = "jdbc:mysql://localhost:3306/board?useUnicode=true&characterEncoding=utf8";

	String USERNAME = "root";
	String PASSWORD = "root";
	Class.forName(JDBC_DRIVER);
	Connection conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
	Statement stmt = conn.createStatement();
	String sql = "insert into message (subject, name, time, email)";
	sql += "values('" + subject + "','" + name + "','" + time + "','" + email + "')";
	//ResultSet rs = stmt.executeQuery(sql);

	stmt.executeUpdate(sql);
%>
<h3>게시글이 등록 되었습니다</h3>
<a href ="list.jsp" >게시글 리스트 보기</a>
</body>
</html>