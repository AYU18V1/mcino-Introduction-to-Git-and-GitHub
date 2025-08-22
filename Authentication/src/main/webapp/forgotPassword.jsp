<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Musica</title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='' rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>
    body {
        background-color: #1c1c1e;
        font-family: "Rubik", Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #ececec;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .forgot {
        background: linear-gradient(145deg, #2a2a2d, #333336);
        padding: 25px;
        border-radius: 12px;
        box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.5), -5px -5px 15px rgba(0, 0, 0, 0.2);
        color: #ececec;
        transition: transform 0.3s ease;
    }

    .forgot:hover {
        transform: scale(1.05);
    }

    .padding-bottom-3x {
        padding-bottom: 72px !important;
    }

    .card {
        border-radius: 12px;
        background: #252527;
        box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.4), -5px -5px 15px rgba(50, 50, 50, 0.2);
        transition: all 0.3s ease;
    }

    .card:hover {
        box-shadow: 8px 8px 20px rgba(0, 0, 0, 0.6), -8px -8px 20px rgba(50, 50, 50, 0.3);
    }

    .card-footer {
        background-color: transparent;
        border-top: none;
    }

    .btn {
        font-size: 14px;
        border-radius: 20px;
        padding: 10px 20px;
        font-weight: bold;
        transition: background 0.3s ease, box-shadow 0.3s ease;
    }

    .btn-success {
        background: linear-gradient(135deg, #32de84, #28a745);
        color: white;
        border: none;
        box-shadow: 0px 4px 12px rgba(50, 222, 132, 0.3);
    }

    .btn-success:hover {
        background: linear-gradient(135deg, #28a745, #32de84);
        box-shadow: 0px 4px 15px rgba(50, 222, 132, 0.5);
    }

    .btn-danger {
        background: linear-gradient(135deg, #ff5f5f, #ff3131);
        color: white;
        border: none;
        box-shadow: 0px 4px 12px rgba(255, 95, 95, 0.3);
    }

    .btn-danger a {
        color: #ffffff;
        text-decoration: none;
    }

    .btn-danger:hover {
        background: linear-gradient(135deg, #ff3131, #ff5f5f);
        box-shadow: 0px 4px 15px rgba(255, 95, 95, 0.5);
    }

    .form-control {
        border-radius: 12px;
        background: #2a2a2d;
        color: #fff;
        border: 1px solid #4c4c4f;
        transition: all 0.3s ease;
    }

    .form-control:focus {
        border-color: #76b7e9;
        box-shadow: 0 0 8px rgba(118, 183, 233, 0.8);
        background-color: #2a2a2d;
        color: #ececec;
    }

    .form-text {
        color: #b8b8b8;
    }

    h2 {
        color: #ececec;
        font-weight: bold;
    }

    p {
        color: #b8b8b8;
    }

    ol {
        color: #b8b8b8;
    }

    .text-primary {
        color: #76b7e9 !important;
    }
</style>
</head>
<body oncontextmenu='return false' class='snippet-body'>
	<div class="container padding-bottom-3x mb-2 mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				<div class="forgot">
					<h2>Forgot your password?</h2>
					<p>Change your password in three easy steps. This will help you
						to secure your password!</p>
					<ol class="list-unstyled">
						<li><span class="text-primary text-medium">1. </span>Enter
							your email address below.</li>
						<li><span class="text-primary text-medium">2. </span>Our
							system will send you an OTP to your email</li>
						<li><span class="text-primary text-medium">3. </span>Enter the OTP on the 
						next page</li>
					</ol>
				</div>
				<form class="card mt-4" action="forgotPassword" method="POST">
					<div class="card-body">
						<div class="form-group">
							<label for="email-for-pass">Enter your email address</label> <input
								class="form-control" type="text" name="email" id="email-for-pass" required=""><small
								class="form-text text-muted">Enter the registered email address . Then we'll
								email a OTP to this address.</small>
						</div>
					</div>
					<div class="card-footer">
						<button class="btn btn-success" type="submit">Get New
							Password</button>
						<button class="btn btn-danger" type="submit"><a href="login.jsp">Back to
							Login</a></button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
	<script type='text/javascript' src=''></script>
	<script type='text/javascript' src=''></script>
	<script type='text/Javascript'></script>
</body>
</html>