<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hello JSP</title>
</head>
<body>
<h1>Hello JSP</h1>

<!-- JSTL 예제 -->
<c:set var="message" value="Welcome to JSP with JSTL!" />
<p>${message}</p>

<fmt:formatDate value="${pageContext.request.time}" pattern="yyyy-MM-dd HH:mm:ss" var="currentTime" />
<p>Current Time: ${currentTime}</p>

<c:set var="str" value="JSP" />
<p>Length of '${str}': ${fn:length(str)}</p>
</body>
</html>
