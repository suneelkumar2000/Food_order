<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Food Details</title>
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
	align-items: center;
	border-bottom: 1px solid #f0f0f0;
	background-color: #f7f7f7;
	padding: 20px 40px;
}

.header h2 {
	align-items: center;
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
			const name = document.getElementById('name');
			const price = document.getElementById('price');
			const category = document.getElementById('category');
			const quantity = document.getElementById('quantity');

			form.addEventListener('submit', e => {
				e.preventDefault();
				
				checkInputs();
			});

			function checkInputs() {
				// trim to remove the whitespaces
				const nameValue = name.value.trim();
				const priceValue = price.value.trim();
				const categoryValue = category.value.trim();
				const quantityValue = quantity.value.trim();
				
				var regexName = /^[a-zA-Z ]+$/;
				
				if(nameValue === '') {
					setErrorFor(name, 'name cannot be blank');
				}
				else if(!regexName.test(nameValue)){
					setErrorFor(name, 'Invalid name');
				} else {
					setSuccessFor(name)
				}
				
				if(priceValue === '') {
					setErrorFor(price, 'price cannot be blank');
				} else if (priceValue<0) {
					setErrorFor(price, 'Invalid price');
				} else {
					setSuccessFor(price);
				}
				
				if(categoryValue === '') {
					setErrorFor(category, 'category cannot be blank');
				} else if(!regexName.test(categoryValue)){
					setErrorFor(category, 'Invalid category');
				} else {
					setSuccessFor(category);
				}
				
				if(quantityValue === '') {
					setErrorFor(quantity, 'quantity cannot be blank');
				}else if (quantityValue<0) {
					setErrorFor(quantity, 'Invalid quantity');
				}else{
					setSuccessFor(quantity);
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
			<h2>Insert Food Details</h2>
		</div>
		<form action="InsertFoodTest" method="get" id="form" class="form">
			<div class="form-control">
				<label for="name">Food Name</label> <input type="text"
					placeholder="Enter Food Name" id="name" /> <i
					class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i> <small>Error message</small>
			</div>
			<div class="form-control">
				<label for="price">Price</label> <input type="number"
					placeholder="Enter price" id="price" /> <i
					class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i> <small>Error message</small>
			</div>
			<div class="form-control">
				<label for="quantity">Food Quantity</label> <input type="number"
					placeholder="Enter quantity" id="quantity" /> <i
					class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i> <small>Error message</small>
			</div>
			<div class="form-control">
				<label for="category">Food category</label> <input type="text"
					placeholder="Enter category" id="category" /> <i
					class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i> <small>Error message</small>
			</div>

			<input onclick="validate();" type="submit" value="ADD">
		</form>
	</div>
</body>
</html>