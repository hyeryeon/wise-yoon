<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
%>
<c:choose>
	<c:when test="${param.type == 'cafe' }">
		<c:import url="http://search.daum.net/search">
			<c:param name="w" value="cafe"></c:param>
			<c:param name="q" value="보라매공원"></c:param>	
		</c:import>
	</c:when>
	<c:when test="${param.type == 'blog' }">
		<c:import url="http://search.daum.net/search">
			<c:param name="w"  value="blog"></c:param>
			<c:param name="q" value="보라매공원"></c:param>
		</c:import>	
	</c:when>
	<c:otherwise>
		<c:import url="viewMember_help.jsp">
			<c:param name="message" value="선택해주세요"></c:param>
		</c:import>
	</c:otherwise>
</c:choose>
<html>
<head>
<title>회원정보</title>
</head>
<body>
</body>
</html>