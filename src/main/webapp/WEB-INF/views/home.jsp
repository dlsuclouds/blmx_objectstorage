<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bluemix - Object Storage</title>
</head>
<body>
	<h1>Document Manager</h1>

	<form action="home" method="POST" enctype="multipart/form-data">
		<input type="file" name="file">
		<input type="submit" value="Submit">
	</form>

	<hr>
	<ul>
	<c:forEach items="${documents}" var="doc">
		<li><a href="file?action=download&fn=${doc}">${doc}</a> &nbsp; [<a href="file?action=delete&fn=${doc}">delete</a>]</li> 
	</c:forEach>
	</ul>
</body>
</html>