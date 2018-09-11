<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import = "java.text.*" %>
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
<h3>게시글 내용</h3>
<%

String subject = "", memo = "", name = "", time ="", email = "";
int id = Integer.parseInt(request.getParameter("id"));

//DB 연동
String JDBC_DRIVER = "com.mysql.jdbc.Driver";
String DB_URL = "jdbc:mysql://localhost:3306/board?useUnicode=true&characterEncoding=utf8";

String USERNAME = "root";
String PASSWORD = "root";
Class.forName(JDBC_DRIVER);
Connection conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
Statement stmt = conn.createStatement();
String sql = "select * from message where id=" + id;
ResultSet rs;




/* name = request.getParameter("name");
email = request.getParameter("email");
subject = request.getParameter("subject");
memo = request.getParameter("memo");
time = request.getParameter("time");
 */


int recordUpdated;
stmt = conn.createStatement();
rs = stmt.executeQuery(sql);

while(rs.next()){
	subject = rs.getString("subject");
	memo = rs.getString("memo");
	name = rs.getString("name");
	time = rs.getString("time");
	email = rs.getString("email");
}
%>
<table border = "2">
	<tr>
		<td>id</td>
		<td><%=id %></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><%=subject %></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=name %></td>
	</tr>
	<tr>
		<td>날짜</td>
		<td><%=time %></td>
	</tr>
	<tr>
		<td>메모</td>
		<td><%=memo %></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%=email %></td>
	</tr>
</table>
<form action="" method="post">
        <input type="button" value="수정" name="update"
        onClick="location.href='./write.jsp'">
        
        <input type="button" value="목록보기" name="list"
        onClick="location.href='./list.jsp'">
    </form>
</body>
</html>