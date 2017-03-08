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
	<script ype="text/javascript">
		$(document).ready(function(){		
			$formObj = $("#login_form");
			$formObj.validate({
				rules:{
					emailId:{
						required:true,
						email: true
					},
					password:{
						required:true
					}
				},
				messages:{
					emailId:{
						required:"Email Id is required",
						email: "Invalid Email ID"
					},
					password:{
						required:"Password is required"
					}
				}
			});
			$formObj.submit(function(){
				if($(this).valid())
				{
					return true;
				}
				else
				{
					return false;
				}
				return true;
			});
		});
	</script>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="navbar navbar-inverse">
					<div class="navbar-header">
						<a class="navbar-brand" href="/">Currency Converter</a>
					</div>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-left">
							<li class="active"><a href="register">Register</a></li>
						</ul>
					</div>
				</div>
			</div>
			<br/><br/>
			<div class="row">
				<!-- Login -->
				<div class="col-xs-12 col-sm-12 col-md-offset-3 col-md-6 col-lg-offset-3 col-lg-6">
					<div class="login-box">
						<div class="row" style="padding-top:30px">
							<div class="col-xs-offset-1 col-xs-10 col-sm-offset-1 col-sm-10 col-md-offset-1 col-md-10 col-lg-offset-1 col-lg-10">
								<form id="login_form" class="form-horizontal" novalidate="novalidate" action="login" method="post" autocomplete="off" commandName="USER">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="form-group has-feedback">
										<div class="col-sm-offset-2 col-sm-8">
											<i class="glyphicon glyphicon-envelope form-control-feedback"></i>
											<input type="text" class="form-control text-darken-2" id="emailId" name="emailId" placeholder="Email ID" style="background: #fbf4e9" autofocus="autofocus">
										</div>
									</div>
									<div class="form-group has-feedback">
										<div class="col-sm-offset-2 col-sm-8">
											<i class="glyphicon glyphicon-lock form-control-feedback"></i>
											<input type="password" class="form-control" id="password" name="password" placeholder="Password" style="background: #fbf4e9">
										</div>
									</div>
									<div class="text-center">
										<button type="submit" id="loginBtn" value = "Login" class="btn btn-primary btn-lg" style="font-size:x-medium">Login</button>
									</div>
								</form>
								<c:if test="${not empty error}">
									<p>The email or password you have entered is invalid, please try again.</p>
								</c:if>
							<hr>
							<!-- Error message -->
							<div class="row" id="message_panel" style="display:none">
								<div class="col-sm-10">
									<p class="text-right">
										<label class="label label-danger" >
										</label>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>