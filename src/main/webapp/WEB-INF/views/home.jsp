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

    <div id="sep">
      <div class="container">
        <div class="row centered">
          <div class="col-md-8 col-md-offset-2">
            <h1>Welcome!</h1>
            <h4>Take a tour of our new app!</h4>
          </div><!--/col-md-8-->
        </div>
      </div>
    </div><!--/sep-->

    <div class="container ptb">
      <div class="row">
        <div class="col-md-6">
          <h2>Inclusive of 2 services!</h2>
          <p class="mt">Powered by IBM Bluemix, this app is connected to the text-to-speech Watson service and the object storage service. You can download your audio file and store them online as well!</p>
          <p class="store">
            <img src="assets/img/textspeech.png" height="50" alt="">
            <img src="assets/img/obj-store.png" height="50" alt="">
          </p>
        </div>
        <div class="col-md-6">
          <img src="assets/img/bluemix.png" class="img-responsive mt" alt="">
        </div>
      </div><!--/row-->
    </div><!--/container-->

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
	

 <div class="container ptb">
      <div class="row centered">
        <h2 class="mb">Document Manager</h2>
		<form action="FileUpload" method="POST" enctype="multipart/form-data">
			<input type="file" name="file">
			<input type="submit" value="Submit">
		</form>

		<ul class="list-group">
		<c:forEach items="${documents}" var="doc">
			<li class="list-group-item"><a href="file?action=download&fn=${doc}">${doc}</a> &nbsp; [<a href="file?action=delete&fn=${doc}">delete</a>]</li> 
		</c:forEach>
		</ul>
      </div><!--/row-->
    </div><!--/container-->
	

</body>
</html>
