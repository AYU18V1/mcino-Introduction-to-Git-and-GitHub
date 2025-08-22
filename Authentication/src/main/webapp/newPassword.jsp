<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Snippet - BBBootstrap</title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
	rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
 <style>
        body {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: #fff;
            font-family: 'Arial', sans-serif;
            overflow: hidden;
        }
        .placeicon {
            font-family: fontawesome;
        }
        .container {
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.2);
        }
        .bg-white {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 30px;
        }
        h1 {
            color: #0072ff;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
        }
        .form-control {
            border: 2px solid #0072ff;
            border-radius: 10px;
            transition: border-color 0.3s ease;
            background: #f8f9fa;
        }
        .form-control:focus {
            border-color: #00c6ff;
            box-shadow: 0 0 5px rgba(0, 198, 255, 0.5);
        }
        .btn-info {
            background-color: #00c6ff;
            border: none;
            border-radius: 10px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .btn-info:hover {
            background-color: #0072ff;
            transform: scale(1.05);
        }
        .bg-light {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 15px;
        }
        .text-danger {
            color: #ff4757;
        }
        .text-danger:hover {
            text-decoration: underline;
        }
        .divider {
            border-top: 1px solid #0072ff;
            margin: 20px 0;
        }
    </style>
</head>
<body oncontextmenu='return false' class='snippet-body bg-info'>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
	<div>
		<!-- Container containing all contents -->
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
					<!-- White Container -->
					<div class="container bg-white rounded mt-2 mb-2 px-0">
						<!-- Main Heading -->
						<div class="row justify-content-center align-items-center pt-3">
							<h1>
								<strong>Reset Password</strong>
							</h1>
						</div>
						<div class="pt-3 pb-3">
							<form class="form-horizontal" action="newPassword" method="POST">
								<!-- User Name Input -->
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="text" name="password1" placeholder="&#xf084; &nbsp; New Password"
											class="form-control border-info placeicon">
									</div>
								</div>
								<!-- Password Input -->
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="password" name="confPassword"
											placeholder="&#xf084; &nbsp; Confirm New Password"
											class="form-control border-info placeicon">
									</div>
								</div>
							
								<!-- Log in Button -->
								<div class="form-group row justify-content-center">
									<div class="col-3 px-3 mt-3">
										<input type="submit" value="Reset"
											class="btn btn-block btn-info">
									</div>
								</div>
							</form>
						</div>
						<!-- Alternative Login -->
						<div class="mx-0 px-0 bg-light">
							
							<!-- Horizontal Line -->
							<div class="px-4 pt-5">
								<hr>
							</div>
							<!-- Register Now -->
							<div class="pt-2">
								<div class="row justify-content-center">
									<h5 style="color : #3B1C32">
										Don't have an Account?<span><a href="signup.jsp"
											class="text-danger"> Register Now!</a></span>
									</h5>
								</div>
								<div
									class="row justify-content-center align-items-center pt-4 pb-5">
									<div class="col-4">
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
	
</body>
</html>