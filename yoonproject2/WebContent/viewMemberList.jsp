<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ȸ�����</title>
</head>
<body>
MEMBER ���̺��� ����
<table width="100%" border="1">
<tr>
	<td>�̸�</td><td>���̵�</td><td>�̸���</td>
</tr>
<%
//1. JDBC����̹� �ε�
Class.forName("com.mysql.jdbc.Driver");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
	String jdbcDriver = "jdbc:mysql://localhost:3306/chap12?" + "useUnicode=true&characterEncoding=euckr";
	String dbUser = "jspexam";
	String dbPass = "jspex";
	
	String query = "select*from MEMBER";
	
	//2. �����ͺ��̽� Ŀ�ؼ� ����
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	//3. Statement ����
	stmt = conn.createStatement();
	
	//4. ��������
	rs = stmt.executeQuery(query);
	
	//5. ���� ���� ��� ���
	while(rs.next()) {
%>
<tr>
	<td><%=rs.getString("NAME") %></td>
	<td><%=rs.getString("MEMBERID") %></td>
	<td><%=rs.getString("EMAIL") %></td>
</tr>
<%		
	}
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	//6. ����� Statement ����
	if(rs != null) {
		try {
			rs.close();
		} catch(SQLException ex) {
		}
	}
	if(stmt != null) {
		try {
			stmt.close();
		} catch(SQLException ex) {
		}
	}
	if(conn != null) {
		try {
			conn.close();
		} catch(SQLException ex) {
		}
	}
 }
%>
</table>
</body>
</html>