<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hackathon Finals</title>
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="assets/css/ionicons.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>

	<div id="h">
	      <div class="container">
		<div class="row">
		  <div class="col-md-8 col-md-offset-2 centered">
		    <h1>Convert Text to Speech</h1>
		    <div class="mtb">
		      <form action="ConvertText" method="POST">
			<p class="panel">
			  <textarea name="text" rows="5" cols="100"><c:if
			      test="${!empty text}">${text}</c:if></textarea>
			</p>
			<p class="action">
			  <input type="reset" value="Clear">
			  <input type="submit" value="Convert">
			</p>
		      </form>
		    </div><!--/mt-->
		  </div>
		</div><!--/row-->
	      </div><!--/container-->
	    </div><!-- /H -->
	
	
	<h1>Document Manager</h1>

	<form action="FileUpload" method="POST" enctype="multipart/form-data">
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
