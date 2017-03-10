<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page import="java.util.Calendar,java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader ("Expires", 0);  
%>
<html lang="en">
<head>
	<title>Currency Converter</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="/js/register.js"></script>
	<script type="text/javascript"  src="webjars/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript"  src="webjars/jquery-ui/1.11.4/jquery-ui.min.js"></script>
	<script type="text/javascript" src="webjars/jquery-validation/1.16.0/jquery.validate.js"></script>
	<script type="text/javascript" src="webjars/jquery-validation/1.16.0/additional-methods.js"></script>
	<script type="text/javascript"  src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="webjars/jquery-ui/1.11.4/jquery-ui.min.css" />
	<c:url value="/css/main.css" var="jstlCss" />
	<link href="${jstlCss}" rel="stylesheet" />
	<%
	//Fetch date object from server-side
	Date dateNow = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(dateNow);
	%>
	<script type="text/javascript">
		var status		= 	"null";
		var res_emailId 	= 	"";	
		var res_pass 		= 	"";
		var res_firstName 	= 	"";
		var res_lastName 	= 	"";
		var res_dob 		= 	"";
		var res_address 	= 	"";
		var res_country 	= 	"";
		
		var registerObj = new register();
		var endYear = <%=cal.get(Calendar.YEAR)%>;
		var startYear = endYear - 110;

		jQuery.validator.addMethod("alphanumericName", function(value, element) {
			return this.optional(element) || /^[a-z0-9\s]+$/i.test(value);
		}, "Letters, numbers or spaces  only please");	

		$(document).ready(function() {	  
			if(status.toUpperCase() != "" && status.toUpperCase() != "NULL" ) {
			//Display entered data
			$("#firstName").val(res_firstName);
			$("#lastName").val(res_lastName);
			$("#emailId").val(res_emailId);
			$("#confEmailId").val(res_emailId);
			$("#password").val(res_pass);
			$("#confPass").val(res_pass);
			$("#dateOfBirth").val(res_dob);
			$("#address").val(res_address);
			$("#country").val(res_country);
		}else{
			//Reset info
			$("#firstName").val("");
			$("#lastName").val("");
			$("#emailId").val("");
			$("#confEmailId").val("");
			$("#password").val("");
			$("#confPass").val("");
			$("#dateOfBirth").val("");
			$("#address").val("");
			$("#country").val("");
		}
		
		//Disable paste in password field
		$('#pass, #confPass').bind("paste",function(e) {
			e.preventDefault();
		});
		registerObj.populateCountries(); 	
		registerObj.dateTimeSetting(startYear, endYear);

		$formObj = $("#register_form");		
		$formObj.validate({
			rules:{
				firstName:{
					required:true,
					alphanumericName: true
				},
				lastName:{
					required:true,
					alphanumericName: true
				},
				emailId:{
					required:true,
					email: true
				},
				confEmailId:{
					required:true,
					equalTo: "#emailId"
				},
				password:{
					required:true
				},
				confPass:{
					required:true,
					equalTo: "#password"
				},
				dateOfBirth:{
					required:true,
					dateITA:true
				},
				address:{
					required:true,
				},
				country:{
					required:true,
				}
			},
			messages:{
				firstName:{
					required:"First Name is required"
				},
				lastName:{
					required:"Last Name is required"
				},
				emailId:{
					required:"Email Id is required",
					email: "Invalid Email ID"
				},
				confEmailId:{
					required:"Confirm Email ID is required",
					equalTo:"Please enter the same email address as above"
				},
				password:{
					required:"Password is required"
				},
				confPass:{
					required:"Confirm password is required",
					equalTo:"Please enter the same password as above"
				},
				dateOfBirth:{
					required:"Date of Birth is required",
					dateITA: "Please enter a correct date."
				},
				address:{
					required:"Address is required"
				},
				country:{
					required:"Country is required"
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
		$("#btnRegister").click(function() {
			$formObj.submit();
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
			<div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title text-center">
							<strong> New User Registration</strong>
						</h3>
					</div>
					<div class="panel-body">
						<div class="row" style="padding-bottom:20px">
							<div class="col-xs-offset-1 col-xs-10 col-sm-offset-1 col-sm-10 col-md-offset-1 col-md-10 col-lg-offset-1 col-lg-10">
								<div class="alert alert-info" style="font-size:large;font-family: 'Open Sans', sans-serif;">Please fill in the form below to register as a user.</div>
								<div class="pull-right"><label>Already a User? <a href="login">Login</a></label></div>
							</div>
						</div>

						<form id="register_form" class="form-horizontal" modelAttribute="user" action="registerUser" method="post">
							<fieldset class="form-group">
								<label class="col-xs-offset-1 col-xs-10 col-sm-4 col-sm-offset-0 control-label" for="firstName">First Name <span style="color: red">*</span></label>
								<div class="col-xs-offset-1 col-xs-10 col-sm-6 col-sm-offset-0 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-user"></i>
										</span>
										<input type="text" id="firstName" name="firstName" class="form-control">
									</div>
								</div>
							</fieldset>
							<fieldset class="form-group">
								<label class="col-xs-offset-1 col-xs-10 col-sm-4 col-sm-offset-0 control-label" for="lastName">Last Name <span style="color: red">*</span></label>
								<div class="col-xs-offset-1 col-xs-10 col-sm-6 col-sm-offset-0 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-user"></i>
										</span>
										<input type="text" id="lastName" name="lastName" class="form-control">
									</div>
								</div>
							</fieldset>
							<fieldset class="form-group">
								<label class="col-xs-offset-1 col-xs-10 col-sm-4 col-sm-offset-0 control-label" for="emailId">Email Id <span style="color: red">*</span></label>
								<div class="col-xs-offset-1 col-xs-10 col-sm-6 col-sm-offset-0 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-envelope"></i>
										</span>
										<input type="text" id="emailId" name="emailId" class="form-control" autofocus="autofocus">
									</div>
								</div>
							</fieldset>
							<fieldset class="form-group">
								<label class="col-xs-offset-1 col-xs-10 col-sm-4 col-sm-offset-0 control-label" for="confEmailId">Confirm Email Id <span style="color: red">*</span></label>
								<div class="col-xs-offset-1 col-xs-10 col-sm-6 col-sm-offset-0 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-envelope"></i>
										</span>
										<input type="text" id="confEmailId" name="confEmailId" class="form-control">
									</div>
								</div>
							</fieldset>
							<fieldset class="form-group">
								<label class="col-xs-offset-1 col-xs-10 col-sm-4 col-sm-offset-0 control-label" for="pass">Password <span style="color: red">*</span></label>
								<div class="col-xs-offset-1 col-xs-10 col-sm-6 col-sm-offset-0 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-lock"></i>
										</span>
										<input type="password" id="password" name="password" class="form-control">
									</div>
								</div>
							</fieldset>
							<fieldset class="form-group">
								<label class="col-xs-offset-1 col-xs-10 col-sm-4 col-sm-offset-0 control-label" for="confPass">Confirm Password <span style="color: red">*</span></label>
								<div class="col-xs-offset-1 col-xs-10 col-sm-6 col-sm-offset-0 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-lock"></i>
										</span>
										<input type="password" id="confPass" name="confPass" class="form-control">
									</div>
								</div>
							</fieldset>
							<fieldset class="form-group">
								<label class="col-xs-offset-1 col-xs-10 col-sm-4 col-sm-offset-0 control-label" for="dob">Date of Birth <span style="color:red">*</span></label>
								<div class="col-xs-offset-1 col-xs-10 col-sm-6 col-sm-offset-0 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-calendar"></i>
										</span> 
										<input type="text" id="dateOfBirth" name="dateOfBirth" class="form-control">
									</div>																		
								</div>
							</fieldset>
							<fieldset class="form-group">
								<label class="col-xs-offset-1 col-xs-10 col-sm-4 col-sm-offset-0 control-label" for="address">Address <span style="color: red">*</span></label>
								<div class="col-xs-offset-1 col-xs-10 col-sm-6 col-sm-offset-0 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-globe"></i>
										</span>
										<input type="text" id="address" name="address" class="form-control">
									</div>
								</div>
							</fieldset>
							<fieldset class="form-group">
								<label class="col-xs-offset-1 col-xs-10 col-sm-4 col-sm-offset-0 control-label" for="country">Country <span style="color:red">*</span></label>
								<div class="col-xs-offset-1 col-xs-10 col-sm-6 col-sm-offset-0 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-globe"></i>
										</span> 
										<select id="country" name="country" class="form-control"></select>
									</div>							
								</div>
							</fieldset>
							<fieldset class="form-group">
								<div class="col-xs-offset-1 col-xs-10 col-sm-10 col-sm-offset-0">
									<div class="text-center">
										<button id="btnRegister" value="Register" class="btn btn-primary btn-lg">Register</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>