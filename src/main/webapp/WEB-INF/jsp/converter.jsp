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
					<strong>Currency Converter</strong>
				</h3>
			</div>
			<div class="panel-body">
				<div class="row" style="padding-bottom:20px">
					<div class="col-xs-offset-1 col-xs-10 col-sm-offset-1 col-sm-10 col-md-offset-1 col-md-10 col-lg-offset-1 col-lg-10">
						<div class="alert alert-info" style="font-size:large;font-family: 'Open Sans', sans-serif;">Select the currencies to view exchange rates.</div>
					</div>
				</div>

				<form id="currency_form" class="form-horizontal" modelAttribute="user" action="getExchangeRate" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<fieldset class="form-group">
						<label class="col-xs-offset-1 col-xs-10 col-sm-4 col-sm-offset-0 control-label" for="currencyFrom">Currency From <span style="color: red">*</span></label>
						<div class="col-xs-offset-1 col-xs-10 col-sm-6 col-sm-offset-0 inputGroupContainer">
							<div class="input-group">
								<select id="currencyFrom" name="currencyFrom" class="form-control">
									<option value="EUR" ${exchangeRate.from == 'EUR'?'selected':''}>EUR</option>
									<option value="USD" ${exchangeRate.from == 'USD'?'selected':''}>USD</option>
									<option value="GBP" ${exchangeRate.from == 'GBP'?'selected':''}>GBP</option>
									<option value="NZD" ${exchangeRate.from == 'NZD'?'selected':''}>NZD</option>
									<option value="AUD" ${exchangeRate.from == 'AUD'?'selected':''}>AUD</option>
									<option value="JPY" ${exchangeRate.from == 'JPY'?'selected':''}>JPY</option>
									<option value="HUF" ${exchangeRate.from == 'HUF'?'selected':''}>HUF</option>
								</select>
							</div>
						</div>
					</fieldset>
					<fieldset class="form-group">
						<label class="col-xs-offset-1 col-xs-10 col-sm-4 col-sm-offset-0 control-label" for="currencyTo">Currency TO <span style="color: red">*</span></label>
						<div class="col-xs-offset-1 col-xs-10 col-sm-6 col-sm-offset-0 inputGroupContainer">
							<div class="input-group">
								<select id="currencyTo" name="currencyTo" class="form-control">
									<option value="USD" ${exchangeRate.to == 'USD'?'selected':''}>USD</option>
									<option value="EUR" ${exchangeRate.to == 'EUR'?'selected':''}>EUR</option>
									<option value="GBP" ${exchangeRate.to == 'GBP'?'selected':''}>GBP</option>
									<option value="NZD" ${exchangeRate.to == 'NZD'?'selected':''}>NZD</option>
									<option value="AUD" ${exchangeRate.to == 'AUD'?'selected':''}>AUD</option>
									<option value="JPY" ${exchangeRate.to == 'JPY'?'selected':''}>JPY</option>
									<option value="HUF" ${exchangeRate.to == 'HUF'?'selected':''}>HUF</option>
								</select>
							</div>
						</div>
					</fieldset>
					<fieldset class="form-group">
						<div class="col-xs-offset-1 col-xs-10 col-sm-8 col-sm-offset-0">
							<div class="text-center">
								<button id="btnRegister" value="Get Rate" class="btn btn-primary btn-lg">Get Rate</button>
							</div>
						</div>
					</fieldset>
				</form>
				<hr>
				<div class="col-md-offset-1">
					<c:if test="${exchangeRate.rate != null}">
					<h3><span class="label label-success text-center">Exchange Rate (${exchangeRate.from} - ${exchangeRate.to}) = ${exchangeRate.rate}</span></h3>
				</c:if>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</body>
</html>