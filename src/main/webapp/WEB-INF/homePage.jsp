<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
	<%@ include file="partials/meta.jsp" %>
	<%@ include file="partials/header.jsp" %>  	
</head>
<body>
	<%@ include file="partials/bsNavbar.jsp" %>
    <h1>Welcome Page <c:out value="${currentUser}"></c:out></h1>

    <%@ include file="partials/footer.jsp" %>
</body>
</html>