<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="test.service.WriteMessageService" %>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="message" class="test.model.Message">
<jsp:setProperty name="message" property="*"/>
</jsp:useBean>

<%
	WriteMessageService writeService = WriteMessageService.getInstance();
	writeService.write(message);
%>
<html>
<head>
<title>방명록 메시지 남김</title>
</head>
<body>
방명록에 메시지를 남겼습니다.<br>
<a href="list.jsp">[목록보기]</a>
</body>
</html>