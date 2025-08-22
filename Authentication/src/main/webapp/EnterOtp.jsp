<html>
<head>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

  <style type="text/css">
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #fff;
            font-family: 'Arial', sans-serif;
        }
        .form-gap {
            padding-top: 70px;
        }
        .panel {
            border-radius: 10px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.1);
        }
        .panel-body {
            padding: 30px;
        }
        h2 {
            margin-bottom: 20px;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.7);
        }
        .input-group-addon {
            background: #ff4081;
            color: #fff;
            border: none;
        }
        .form-control {
            border: none;
            border-radius: 0;
            background: #000; /* Dark black color for input box */
            color: #fff; /* White text in the input box */
            transition: background 0.3s ease;
        }
        .form-control:focus {
            background: #333; /* Slightly lighter black when focused */
            color: #fff;
            box-shadow: 0 0 5px rgba(255, 255, 255, 0.6);
        }
        .btn-primary {
            background-color: #ff4081;
            border: none;
            border-radius: 5px;
            transition: background 0.3s ease, transform 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #ff60a0;
            transform: scale(1.05);
        }
        .text-danger {
            color: #ff7f50; /* Coral color for error messages */
            font-weight: bold;
        }
    </style>
</head>

<body>
	<div class="form-gap"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="text-center">
							<h3>
								<i class="fa fa-lock fa-4x"></i>
							</h3>
							<h2 class="text-center">Enter OTP</h2>
									<%
		  			if(request.getAttribute("message")!=null)
		  			{
		  				out.print("<p class='text-danger ml-1'>"+request.getAttribute("message")+"</p>");
		  			}
		  
		  %>
	
							<div class="panel-body">

								<form id="register-form" action="ValidateOtp" role="form" autocomplete="off"
									class="form" method="post">

									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope color-blue"></i></span> <input
												id="opt" name="otp" placeholder="Enter OTP"
												class="form-control" type="text" required="required">
										</div>
									</div>
									<div class="form-group">
										<input name="recover-submit"
											class="btn btn-lg btn-primary btn-block"
											value="Reset Password" type="submit">
									</div>

									<input type="hidden" class="hide" name="token" id="token"
										value="">
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