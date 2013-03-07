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
<title>방명록 메시지 목록</title>
</head>
<body>
	<form action="/YoonView/write.jsp" method="post">
		이름 : <input type="text" name="guestName" style="border-color:yellow"> <br>
		암호 : <input type="password" name="password"> <br>
		메시지 : <textarea name="message" rows="3" cols="30"></textarea> <br>
		<input type="hidden" name="adminName" value="<%="Jessi"%>">
		<input type="submit" value="메시지 남기기" style="background-color:red; border-color:red">
	</form>
	<hr color="blue">
	
	<%
		if(viewData.isEmpty()) {
	%>
		등록된 메시지가 없습니당~~!!
	<%			
		} else {
	%>
			<table border="2" bordercolor="yellow">
			<%
				for(Book book : viewData.getMessageList()) {
			%>					
				<tr>
				<td>
				메시지 번호 :<%=book.getId() %> <br>
				손님 이름 :<%=book.getGuestName() %><br>
				메시지 : <%=book.getMessage() %><br>
				등록일 : <%=book.getRegDate() %><br>
				관리자 이름 : <%=book.getAdminName() %><br>
				<a href="confirmDeletion.jsp?messsgeId=<%=book.getId()%>">[삭제하기]</a>
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