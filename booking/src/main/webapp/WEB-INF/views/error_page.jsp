<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR</title>
</head>
<body>
	<h1>ERROR</h1>
	<h4><c:out value="${exception.getStackTrace()}"></c:out></h4>
	<hr>
	<ul>
		<c:forEach items="exception.getStackTrace()" var="stack">
			<li> 
				<c:out value="${stack }"></c:out>
			</li>
		</c:forEach>
	</ul>
</body>
</html>