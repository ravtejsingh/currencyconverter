<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
	<title>Currency Converter</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript"  src="webjars/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="webjars/jquery-validation/1.16.0/jquery.validate.js"></script>
	<script type="text/javascript" src="webjars/jquery-validation/1.16.0/additional-methods.js"></script>
	<script type="text/javascript"  src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
	<c:url value="/css/main.css" var="jstlCss" />
	<link href="${jstlCss}" rel="stylesheet" />
	<script type="text/javascript">
		function logout() {
			var form = document.createElement("form");
			form.method= "POST";
			form.action= "/logout";
			document.body.appendChild(form);
			form.submit();
		}
	</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="navbar navbar-inverse">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Currency Converter</a>
				</div>
				<div class="navbar-collapse collapse">
					<c:choose>
					<c:when test="${pageContext.request.userPrincipal.name == null}">
					<ul class="nav navbar-nav navbar-left">
						<li class="active"><a href="register">Register</a></li>
					</ul>
				</c:when>
				<c:otherwise>
				<ul class="nav navbar-nav navbar-left">
					<li class="active"><a href="getConverter">Converter</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-left">
					<li class="active"><a href="searchHistory">History</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="active">
						<a style="cursor:pointer" onclick='return logout()'>Logout</a>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</div>
<br/><br/>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title text-center">
					<strong>Recent Search History</strong>
				</h3>
			</div>
			<div class="panel-body">
				<div class="row" style="padding-bottom:10px">
					<div style="color: green;font-weight: bold">
						<ul style="list-style-type: none">
							<li><i class="glyphicon glyphicon-user"></i> ${userName}</li>
							<li><i class="glyphicon glyphicon-envelope"></i> ${pageContext.request.userPrincipal.name}</li>
						</ul>
					</div>
				</div>							
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>#</th>
								<th>Date</th>
								<th>Currency From</th>
								<th>Currency To</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${searchHistories}">
							<tr>
								<td>${task.id}</td>
								<td>${task.searchDate}</td>
								<td>${task.currencyFrom}</td>
								<td>${task.currencyTo}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</body>
</html>