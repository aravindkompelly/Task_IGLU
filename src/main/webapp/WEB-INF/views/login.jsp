<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css"></link>
<link rel='stylesheet' href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="assets/css/style.css"></link>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/js/gijgo.js" type="text/javascript"></script>
<link href="assets/css/gijgo.css" rel="stylesheet" type="text/css" />
<script src="assets/js/custom.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function () {
    $('#datepicker,#datepicker1').datepicker({
      uiLibrary: 'bootstrap'
    });
});
</script>
<script type="text/javascript">
$(function() {

    $('#login-form-link').click(function(e) {
      $("#login-form").delay(100).fadeIn(100);
    $("#register-form").fadeOut(100);
    $('#register-form-link').removeClass('active');
    $(this).addClass('active');
    e.preventDefault();
  });
  $('#register-form-link').click(function(e) {
    $("#register-form").delay(100).fadeIn(100);
    $("#login-form").fadeOut(100);
    $('#login-form-link').removeClass('active');
    $(this).addClass('active');
    e.preventDefault();
  });

});

function validate(){
	var user_name=document.forms["register-form"]["username"].value;
	var password=document.forms["register-form"]["password"].value;
	var cpassword=document.forms["register-form"]["confirm-password"].value;
	if(user_name==""||password=="")
	{
		//alert("all fields are mandatory");
		document.getElementById("demo").innerHTML ="All fields are mandatory";
		return false;
	 }
	if(cpassword!=password){
		document.getElementById("demo").innerHTML ="passwords does not match";
		//alert("passwords does not match");
		return false;
	}
}

function validate1(){
	var user_name=document.forms["login-form"]["username"].value;
	var password=document.forms["login-form"]["password"].value;
	
	if(user_name==""||password=="")
	{
		document.getElementById("demo").innerHTML ="All fields are mandatory";
		
		return false;
	 }
	
}

</script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login" style="border: 1px solid #eee;">
					<div class="panel-heading">
						<div class="row">
							<p id="demo"></p>
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Sign Up</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="/Taskeria/user/validateUser"
									method="post" role="form" style="display: block;"
									onsubmit="validate1()">
									<div class="form-group">
										<input type="text" name="userName" id="userName" tabindex="1"
											class="form-control" placeholder="Username">
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password"
											tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group text-center">
										<input type="checkbox" tabindex="3" class="" name="remember"
											id="remember"> <label for="remember">
											Remember Me</label>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit"
													tabindex="4" class="form-control btn btn-login"
													value="Log In">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="" tabindex="5" class="forgot-password">Forgot
														Password?</a>
												</div>
											</div>
										</div>
									</div>
								</form>
								<form id="register-form" action="/Taskeria/user/addUser"
									method="post" role="form" style="display: none;"
									onsubmit="validate()">
									<div class="form-group">
										<input type="text" name="username" id="username" tabindex="1"
											class="form-control" placeholder="Username">
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password"
											tabindex="1" class="form-control" placeholder="Password"
											value="">
									</div>

									<div class="form-group">
										<input type="password" name="confirm-password"
											id="confirm-password" tabindex="2" class="form-control"
											placeholder="Confirm Password">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit"
													id="register-submit" tabindex="4"
													class="form-control btn btn-register" value="Sign Up">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
