<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="yoon.service.WriteMessageService"%>

<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="book" class="yoon.model.Book">
<jsp:setProperty name="book" property="*"/>
</jsp:useBean>

<%
	WriteMessageService writeService = WriteMessageService.getInstance();
	writeService.write(book);
%>
<html>
<head>
<title>���� �޽��� ����</title>
</head>
<body>
���Ͽ� �޽����� ������ϴ�.<br>
<a href="/YoonView/list.jsp">[��Ϻ���]</a>
</body>
</html>