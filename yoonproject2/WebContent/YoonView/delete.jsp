<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="yoon.service.DeleteMessageService" %>
<%@ page import="test.InvalidMessagePasswordException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	boolean invalidPassword = false;
	try {
		DeleteMessageService deleteService = DeleteMessageService.getInstance();
		deleteService.deleteMessage(messageId, password);
	} catch(InvalidMessagePasswordException ex) {
		invalidPassword = true;
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �޽��� ������</title>
</head>
<body>
	<%
		if(!invalidPassword) {
	%>
		�޽����� �����Ǿ����ϴ�.		
	<%
		} else {
	%>		
			�Է��� ��ȣ�� �ùٸ��� �ʽ��ϴ�. ��ȣ�� Ȯ�����ּ���.
	<%
		}
	%>
	<a href="list.jsp">[��Ϻ���]</a>
</body>
</html>