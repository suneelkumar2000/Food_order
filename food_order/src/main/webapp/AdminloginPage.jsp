<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login Page</title>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: montserrat;
	background: linear-gradient(90deg, #6495ED, #87CEFA);
	height: 100vh;
	overflow: hidden;
}

.center {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 400px;
	background: white;
	border-radius: 10px;
}

.center h1 {
	text-align: center;
	padding: 0 0 20px 0;
	border-bottom: 1px solid silver;
}

.center form {
	padding: 0 40px;
	box-sizing: border-box;
}

form .txt_field {
	position: relative;
	border-bottom: 2px solid #adadad;
	margin: 30px 0;
}

.txt_field input {
	width: 100%;
	padding: 0 5px;
	height: 40px;
	font-size: 16px;
	border: none;
	background: none;
	outline: none;
}

.txt_field label {
	position: absolute;
	top: 50%;
	left: 5px;
	color: #adadad;
	transform: translateY(-50%);
	font-size: 16px;
	pointer-events: none;
	transition: .5s;
}

.txt_field span::before {
	content: '';
	position: absolute;
	top: 40px;
	left: 0;
	width: 0%;
	height: 2px;
	background: #2691d9;
	transition: .5s;
}

.txt_field input:focus ~ label, .txt_field input:valid ~ label {
	top: -5px;
	color: #2691d9;
}

.txt_field input:focus ~ span::before, .txt_field input:valid ~ span::before
	{
	width: 100%;
}

.txt_field
.pass {
	margin: -5px 0 20px 5px;
	color: #a6a6a6;
	cursor: pointer;
}

.pass:hover {
	text-decoration: underline;
}

input[type="submit"] {
	width: 100%;
	height: 50px;
	border: 1px solid;
	background: #2691d9;
	border-radius: 25px;
	font-size: 18px;
	color: #e9f4fb;
	font-weight: 700;
	cursor: pointer;
	outline: none;
}

input[type="submit"]:hover {
	border-color: #2691d9;
	transition: .5s;
}

.space {
	margin: 30px 0;
}
</style>
</head>
<body>
	<script>
		function validate() {
			var name = document.getElementById("name").value;
			var regexName = /^[a-zA-Z ]+$/;
			var password = document.getElementById("password").value;
			var regexPassword = "admin123";
			if (regexName.test(name) && password.match(regexPassword))
				document.getElementById("login").style.visibility = "visible";
			else {
				document.getElementById("invalid").style.visibility = "visible";
				event.preventDefault()
			}
		}
	</script>
	<div class="center">
		<h1>Login</h1>
		<form action="#" method="Post">
			<div class="txt_field">
				<input type="text" id="name" name="name" required> <span></span>
				<label>user name</label>
			</div>

			<div class="txt_field">
				<input type="password" id="password" name="password" required>
				<span></span> <label>password</label>
			</div>
			<div class="pass">Forgot Password?</div>
			<input onclick="validate();" type="submit" value="Login">
			<div class="space"></div>
		</form>
		<div>
			<center>
				<label id="invalid" style="color: red; visibility: hidden">
					Invalid Details </label>
			</center>
		</div>
		<div>
			<center>
				<label id="login" style="color: green; visibility: hidden">
					valid Details</label>
			</center>
		</div>
	</div>
</body>
</html>