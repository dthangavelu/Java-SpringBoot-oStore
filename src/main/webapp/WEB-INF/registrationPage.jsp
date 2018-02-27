<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="partials/meta.jsp" %>
	<%@ include file="partials/header.jsp" %>  	
</head>
<body>
	<%@ include file="partials/bsNavbar.jsp" %>
			
	<c:if test="${hasErrors == 'hasErrors'}">	
		<div class="alert alert-danger" role="alert">
			<span class="fa fa-exclamation-triangle" aria-hidden="true"></span>	  		  
			<form:errors path="user.*"/>
		</div>
	</c:if>

	<div class="container center_div">		
		<h1 class="display-4">Register</h1>		 
		<form:form action="/registration" method="POST" modelAttribute="user">
		  <div class="form-group col-5">
		    <form:label path="username">Username</form:label>
		    <form:input path="username" type="text" class="form-control" id="username" name="username" aria-describedby="usernameHelp" placeholder="Enter username"></form:input>
		    <small id="usernameHelp" class="form-text text-muted">Username should be 8-10 char long.</small>
		  </div>
		  <div class="form-group col-5">
		    <form:label path="password" for="password">Password</form:label>
		    <form:input path="password" type="password" class="form-control" id="password" name="password" placeholder="Enter Password"></form:input>
		  </div>
		  <div class="form-group col-5">
		    <form:label path="passwordConfirmation" for="passwordConfirmation">Password Confirmation</form:label>
		    <form:input path="passwordConfirmation" type="password" class="form-control" id="passwordConfirmation" name="passwordConfirmation" placeholder="Confirm Password"></form:input>
		  </div>
		  
		  <button type="submit" class="btn btn-primary btn-sm btn_size">Register</button>  		  
		</form:form>
	</div>
	
	<%@ include file="partials/footer.jsp" %>
	
</body>
</html>