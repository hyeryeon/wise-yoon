<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.IOException, java.io.FileReader" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>소스보기</title>
</head>
<body>
<%
	FileReader reader = null;
	try {
		String path = request.getParameter("path");
		reader = new FileReader(getServletContext().getRealPath(path));

%>
<pre>
소스코드 = <%=path %>
<c:out value="<%=reader %>" escapeXml="true" />
</pre>		
<%		
	} catch(IOException ex) {
%>
에러 : <%=ex.getMessage() %>
<%		
	} finally {
		if(reader != null) {
			try {
				reader.close();
			} catch(IOException ex) {
			}
		}
	}
%>
</body>
</html>