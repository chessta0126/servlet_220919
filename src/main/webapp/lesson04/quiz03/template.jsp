<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>template</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<style>
#wrap{width:1200px; margin:auto;}

header {height: 100px; background-color: orange;}
a:hover {text-decoration: none;}

nav {height: 50px;  background-color: orange;}
.nav-item{font-weight: bold;}
.nav-link {color: #FFF;}
.nav-link:hover {background-color: yellow; color:#000;}

.selling{height: 800px;}
.emptybox{width:280px; height: 280px;}

footer {height: 50px;}
</style>

</head>
<body>
	<div id="wrap">
		<header class="d-flex justify-content-center align-items-center">
			<jsp:include page="header.jsp" />
		</header>
		<nav class="d-flex align-items-center">
			<jsp:include page="nav.jsp" />
		</nav>
		<section class="selling m-3">
			<jsp:include page="selling.jsp" />
		</section>
		<footer>
			<jsp:include page="footer.jsp" />
		</footer>
	</div>
</body>
</html>