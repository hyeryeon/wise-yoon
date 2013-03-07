<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.Date"%>
    
<%@ page import="yoon.service.GetMessageListService" %>
<%@ page import="yoon.model.MessageListView" %>  
<%@ page import="yoon.model.Book" %> 
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
	<form action="/YoonView/write.jsp" method="post">
		�̸� : <input type="text" name="guestName" style="border-color:yellow"> <br>
		��ȣ : <input type="password" name="password"> <br>
		�޽��� : <textarea name="message" rows="3" cols="30"></textarea> <br>
		<input type="hidden" name="adminName" value="<%="Jessi"%>">
		<input type="submit" value="�޽��� �����" style="background-color:red; border-color:red">
	</form>
	<hr color="blue">
	
	<%
		if(viewData.isEmpty()) {
	%>
		��ϵ� �޽����� �����ϴ�~~!!
	<%			
		} else {
	%>
			<table border="2" bordercolor="yellow">
			<%
				for(Book book : viewData.getMessageList()) {
			%>					
				<tr>
				<td>
				�޽��� ��ȣ :<%=book.getId() %> <br>
				�մ� �̸� :<%=book.getGuestName() %><br>
				�޽��� : <%=book.getMessage() %><br>
				����� : <%=book.getRegDate() %><br>
				������ �̸� : <%=book.getAdminName() %><br>
				<a href="confirmDeletion.jsp?messsgeId=<%=book.getId()%>">[�����ϱ�]</a>
				</td>
				</tr>
			<%	
				}
			%>
			</table>
	<%		
		}
	%>	
	
	<%
		for(int i = 1; i <= viewData.getPageTotalCount(); i++) {
	%>
			<a href="list.jsp?page=<%=i%>">[<%=i %>]</a>
	<%
		}
	%>
</body>
</html>