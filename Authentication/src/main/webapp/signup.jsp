<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listen Musica</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <style>
        body {
            background: url('https://png.pngtree.com/thumb_back/fh260/background/20230722/pngtree-streaming-music-headphones-atop-a-white-cloud-storage-background-in-3d-image_3765477.jpg') no-repeat center center fixed;
            background-size: cover;
            background-color: rgba(0, 0, 0, 0.5);
            background-blend-mode: darken;
            min-height: 100vh;
        }

        /* Navbar Styling */
        .navbar {
            background-color: #BBBDF6; /* Soft Lavender */
            transition: background-color 0.3s ease-in-out; /* Smooth transition */
        }

        .navbar.scrolled {
            background-color: #797A9E; /* Slate Gray when scrolled */
        }

        .navbar-brand, .nav-link {
            color: #797A9E !important; /* Slate Gray for text */
            transition: color 0.3s ease-in-out;
        }

        .navbar-brand:hover, .nav-link:hover {
            color: #9893DA !important; /* Periwinkle on hover */
            transition: color 0.3s ease-in-out;
        }

        .navbar-toggler {
            background-color: #9893DA; /* Soft Periwinkle for toggler */
            border-color: #797A9E;
        }

        .navbar-toggler:hover {
            background-color: #72727E;
        }

        .dropdown-menu {
            background-color: #72727E;
            transition: opacity 0.3s ease-in-out;
            opacity: 0;
            visibility: hidden;
        }

        .dropdown-menu.show {
            opacity: 1;
            visibility: visible;
            transition: opacity 0.3s ease-in-out;
        }

        .dropdown-item {
            color: #BBBDF6 !important;
        }

        .dropdown-item:hover {
            background-color: #9893DA;
            transition: background-color 0.3s ease-in-out;
        }

        .form-control {
            background-color: #625F63;
            color: #BBBDF6;
            border-color: #797A9E;
            transition: border-color 0.3s ease-in-out;
        }

        .form-control::placeholder {
            color: #BBBDF6;
        }


        .card-header {
            background-color: #6d90c5; /* From color palette */
            color: white;
        }

        .btn-primary {
            background-color: #f51476;
            border-color: #f51476;
        }

        .btn-primary:hover {
            background-color: #ff70cd;
            border-color: #ff70cd;
        }

       /* Sign-Up Container */
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: calc(100vh - 80px); /* Account for navbar height */
    padding-top: 50px;
    width: 100%;
}

/* Card Width and Height */
.card {
    width: 400px;  /* Specific width for the sign-up form */
    height: auto;  /* Adjust height automatically based on content */
    background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white */
    border-radius: 15px;
}

/* For mobile responsiveness */
@media (max-width: 768px) {
    .card {
        width: 100%;  /* Full width for smaller devices */
        margin: 10px;
    }
}


        .navbar.scrolled {
            background-color: #625F63; /* Change to Deep Gray when scrolling */
            transition: background-color 0.5s ease-in-out;
        }
    </style>
</head>
<body>

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>" >

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
  <a class="navbar-brand" href="#">
    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-earbuds" viewBox="0 0 16 16">
      <path fill-rule="evenodd" d="M6.825 4.138c.596 2.141-.36 3.593-2.389 4.117a4.4 4.4 0 0 1-2.018.054c-.048-.01.9 2.778 1.522 4.61l.41 1.205a.52.52 0 0 1-.346.659l-.593.19a.55.55 0 0 1-.69-.34L.184 6.99c-.696-2.137.662-4.309 2.564-4.8 2.029-.523 3.402 0 4.076 1.948zm-.868 2.221c.43-.112.561-.993.292-1.969-.269-.975-.836-1.675-1.266-1.563s-.561.994-.292 1.969.836 1.675 1.266 1.563m3.218-2.221c-.596 2.141.36 3.593 2.389 4.117a4.4 4.4 0 0 0 2.018.054c.048-.01-.9 2.778-1.522 4.61l-.41 1.205a.52.52 0 0 0 .346.659l.593.19c.289.092.6-.06.69-.34l2.536-7.643c.696-2.137-.662-4.309-2.564-4.8-2.029-.523-3.402 0-4.076 1.948m.868 2.221c-.43-.112-.561-.993-.292-1.969.269-.975.836-1.675 1.266-1.563s.561.994.292 1.969-.836 1.675-1.266 1.563"/>
    </svg> LISTEN MUSICA
  </a>

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.jsp">Music</a>
      </li>
      
    </ul>
    
   

    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="login.jsp">Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="signup.jsp">Sign Up</a>
      </li>
    </ul>
  </div>
</nav>

<!-- Sign-Up Form -->
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header text-center">
                    <i class="fas fa-user fa-2x"></i>
                    <h5>Sign Up</h5>
                </div>
                <div class="card-body">
                    <form action="RegistrationServlet" method="post">
                        <div class="form-group">
                            <label for="fullName">Enter Full Name</label>
                            <input type="text" class="form-control" id="fullName" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Enter Email Address</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Enter Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                  
                        <button type="submit" class="btn btn-primary btn-block">Create Account</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script>
    // Change navbar background on scroll
    $(window).scroll(function() {
        if ($(document).scrollTop() > 50) {
            $('.navbar').addClass('scrolled');
        } else {
            $('.navbar').removeClass('scrolled');
        }
    });
    
    var status = document.getElementById("status").value;
    if(status == "success"){
    	swal("Congrats" , "Account Created Successfully","success");
    }
    else if(status == "invalidname"){
    	swal("Sorry" , "please enter name","failed");
    }
    else if(status == "invalidemail"){
    	swal("Sorry" , "please enter email","failed");
    }
    else if(status == "invalidpassword"){
    	swal("Sorry" , "please enter password","failed");
    }
    
</script>

</body>
</html>