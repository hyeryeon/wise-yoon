<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>����� �޽��� Ȯ��</title>
</head>
<body>
<form action="delete.jsp" method="post">
<input type="hidden" name="messageId" value="<%=request.getParameter("messageId")%>">
�޽����� �����Ϸ��� ��ȣ�� �Է��ϼ���.<br>
��ȣ : <input type="password" name="password"/>
<input type="submit" value="�޽��� �����ϱ�" />
</form>
</body>
</html>