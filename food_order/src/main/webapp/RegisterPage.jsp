<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register page</title>
<style>

body {
	background: linear-gradient(90deg, #6495ED, #87CEFA);
	font-family: 'Open Sans', sans-serif;
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
	margin: 0;
}

.container {
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	overflow: hidden;
	width: 400px;
	max-width: 100%;
}

.header {
	border-bottom: 1px solid #f0f0f0;
	background-color: #f7f7f7;
	padding: 20px 40px;
}

.header h2 {
	margin: 0;
}

.form {
	padding: 30px 40px;
}

.form-control {
	margin-bottom: 10px;
	padding-bottom: 20px;
	position: relative;
}

.form-control label {
	display: inline-block;
	margin-bottom: 5px;
}

.form-control input {
	border: 2px solid #f0f0f0;
	border-radius: 4px;
	display: block;
	font-family: inherit;
	font-size: 14px;
	padding: 10px;
	width: 100%;
}

.form-control input:focus {
	outline: 0;
	border-color: #777;
}

.form-control.success input {
	border-color: #2ecc71;
}

.form-control.error input {
	border-color: #e74c3c;
}

.form-control i {
	visibility: hidden;
	position: absolute;
	top: 40px;
	right: 10px;
}

.form-control.success i.fa-check-circle {
	color: #2ecc71;
	visibility: visible;
}

.form-control.error i.fa-exclamation-circle {
	color: #e74c3c;
	visibility: visible;
}

.form-control small {
	color: #e74c3c;
	position: absolute;
	bottom: 0;
	left: 0;
	visibility: hidden;
}

.form-control.error small {
	visibility: visible;
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
</style>
</head>
<body>
	<script>
		function validate() {
			const form = document.getElementById('form');
			const username = document.getElementById('username');
			const email = document.getElementById('email');
			const password = document.getElementById('password');
			const phone = document.getElementById('phone');

			form.addEventListener('submit', e => {
				e.preventDefault();
				
				checkInputs();
			});

			function checkInputs() {
				// trim to remove the whitespaces
				const usernameValue = username.value.trim();
				const emailValue = email.value.trim();
				const passwordValue = password.value.trim();
				const phoneValue = phone.value.trim();
				
				var regexName = /^[a-zA-Z ]+$/;
				var regexEmail = /^(.+)@(.+)$/;
				
				if(usernameValue === '') {
					setErrorFor(username, 'Username cannot be blank');
				}
				else if(!regexName.test(usernameValue)){
					setErrorFor(username, 'Invalid Username');
				} else {
					setSuccessFor(username)
				}
				
				if(emailValue === '') {
					setErrorFor(email, 'Email cannot be blank');
				} else if (!regexEmail.test(emailValue)) {
					setErrorFor(email, 'Invalid email');
				} else {
					setSuccessFor(email);
				}
				
				if(passwordValue === '') {
					setErrorFor(password, 'Password cannot be blank');
				} else {
					setSuccessFor(password);
				}
				
				if(phoneValue === '') {
					setErrorFor(phone, 'Phone Number cannot be blank');
				}else if (phoneValue<=0) {
					setErrorFor(phone, 'Invalid Phone Number');
				}else{
					setSuccessFor(phone);
				}
			}

			function setErrorFor(input, message) {
				const formControl = input.parentElement;
				const small = formControl.querySelector('small');
				formControl.className = 'form-control error';
				small.innerText = message;
			}

			function setSuccessFor(input) {
				const formControl = input.parentElement;
				formControl.className = 'form-control success';
			}
			
		}
	</script>
	<div class="container">
		<div class="header">
			<h2>Register Form</h2>
		</div>
		<form action="CustomerRegisterTest" method="get" id="form" class="form">
			<div class="form-control">
				<label for="username">Username</label> <input type="text"
					placeholder="Enter UserName" id="username" /> <i
					class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i> <small>Error message</small>
			</div>
			<div class="form-control">
				<label for="email">Email</label> <input type="email"
					placeholder="Enter Email" id="email" /> <i
					class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i> <small>Error message</small>
			</div>
			<div class="form-control">
				<label for="Phone">Phone Number</label> <input type="number"
					placeholder="Enter Phone Number" id="phone" /> <i
					class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i> <small>Error message</small>
			</div>
			<div class="form-control">
				<label for="password">Password</label> <input type="password"
					placeholder="Enter Password" id="password" /> <i
					class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i> <small>Error message</small>
			</div>

			<input onclick="validate();" type="submit" value="Register">
		</form>
	</div>
</body>
</html>