<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@page import="test.model.Message"%>
<%@page import="test.model.MessageListView"%>
<%@page import="test.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if(pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	
	GetMessageListService messageListService = GetMessageListService.getInstance();
	MessageListView viewData = messageListService.getMessageList(pageNumber);
%>
<html>
<head>
<title>���� �޽��� ���</title>
</head>
<body>
	<form action="writeMessage.jsp" method="post">
	�̸� : <input type="text" name="guestName" /> <br>
	��ȣ : <input type="password" name="password" /> <br>
	�޽��� : <textarea name="message" rows="3" cols="30"></textarea> <br>
	<input type="submit" value="�޽��� �����"/>
	</form>
<hr>
<hr>
<%
if(viewData.isEmpty()) {
%>
��ϵ� �޽����� �����ϴ�.
<%
} else {
	//�޽����� �ִ� ����� ó�� ����
%>
<table border="2">
<%
	for(Message message : viewData.getMessageList()){
%>

<tr>
	<td>
	�޽��� ��ȣ : <%=message.getId() %><br>
	�մ� �̸� : <%=message.getGuestName() %> <br>
	�޽��� : <%=message.getMessage() %><br>
	<a href="confirmDeletion.jsp?messageId=<%=message.getId() %>">
	[�����ϱ�]</a>
	</td>
</tr>
<%
	}
%>
</table>	
<% for(int i = 1; i <= viewData.getPageTotalCount(); i++) {
%>	
	<a href="list.jsp?page=<%= i %>">[<%=i %>]</a>
<%	}
%>
<%
} //�޽����� �ִ� ��� ó�� ��
%>
</body>
</html>