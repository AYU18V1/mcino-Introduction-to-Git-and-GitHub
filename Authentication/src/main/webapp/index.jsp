

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listen Musica</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<style>
html {
  scroll-behavior: smooth;
}
</style>
</head>
<body>




<!-- Navigation -->
<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><img src="img/logo6.jpg" alt="Musica Logo"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active">
					<a class="nav-link" href="#">Home</a>
				</li>
				
			</ul>
		</div>
	</div>
</nav>


<!--- Image Slider -->
<div id="slides" class="carousel slide" data-ride="carousel" data-aos="fade-up" data-aos-offset="200" data-aos-delay="50" data-aos-duration="1000">
	
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img class="image" src="img/background.png" alt="Music Background">
			<div class="carousel-caption">
				<h1 class="display-2">Musica</h1>
				<h3>Your Emotion-Based Music Player</h3>
				<button type="button" class="btn btn-outline-light btn-lg"><a href="login.jsp" style = "color: inherit; text-decoration: none">LOG IN</a></button>
				<button type="button" class="btn btn-primary btn-lg"><a href="signup.jsp" style = "color: inherit; text-decoration: none">SIGN UP</a></button>
			</div>
		</div>
		
	</div>
</div>

<!--- Jumbotron -->
<div class="container-fluid" data-aos="fade-up" data-aos-offset="200" data-aos-delay="50" data-aos-duration="1000">
	<div class="row jumbotron">
		<div class="col-md-9">
			<p class="lead">Discover music that matches your emotions with Musica, the music player that curates playlists based on how you feel.</p>
		</div>
		<div class="col-md-3">
			<a href="#"><button type="button" class="btn btn-outline-secondary btn-lg">Explore Playlists</button></a>
		</div>
	</div>
</div>

<!--- Welcome Section -->
<div class="container-fluid padding" data-aos="fade-up" data-aos-offset="200" data-aos-delay="50" data-aos-duration="1000">
	<div class="row welcome text-center">
		<div class="col-12">
			<h1 class="display-4">Listen to What You Feel</h1>
		</div>
		<hr>
		<div class="col-12">
			<p class="lead">Musica offers handpicked playlists that match your emotions, whether you're feeling joyful, calm, nostalgic, or energetic.</p>
		</div>
	</div>
</div>

<!--- Three Column Section -->
<div class="container-fluid padding" data-aos="fade-up" data-aos-offset="200" data-aos-delay="50" data-aos-duration="1000">
	<div class="row text-center padding">
		<div class="col-md-4">
			<i class="fas fa-smile" style="font-size:2em;"> 😊</i>
			<h3>Joyful</h3>
			<p>Uplifting and happy tunes for when you're feeling great.</p>
		</div>
		<div class="col-md-4">
			<i class="fas fa-brain" style="font-size:2em;"> 😌</i>
			<h3>Calm</h3>
			<p>Relaxing melodies to help you unwind and find peace.</p>
		</div>
		<div class="col-md-4">
			<i class="fas fa-heart" style="font-size:2em;"> 💖</i>
			<h3>Love</h3>
			<p>Feel the romance with our curated love song playlists.</p>
		</div>
	</div>
	<hr class="my-4">
</div>

<!--- Meet the Team -->
<div class="container-fluid padding">
	<div class="row welcome text-center">
		<div class="col-12">
			<h1 class="display-4">Meet the Team</h1>
		</div>
	</div>
</div>

<!--- Cards -->

<!--- Footer -->
<footer>
	<div class="container-fluid padding" data-aos="fade-up" data-aos-offset="200" data-aos-delay="50" data-aos-duration="1000">
		<div class="row text-center">
			<div class="col-md-4">
				<img src="img/logo6.jpg" alt="Musica Logo">
				<hr class="light">
				<p>Contact us: musica@musicplayer.com</p>
				<p>123 Music Lane</p>
				<p>City, State, 10001</p>
			</div>
			<div class="col-md-4">
				<hr class="light">
				<h5>Our hours</h5>
				<hr class="light">
				<p>Mon-Fri: 9am - 6pm</p>
				<p>Sat: 10am - 4pm</p>
			</div>
			<div class="col-md-4">
				<hr class="light">
				<h5>Service Area</h5>
				<hr class="light">
				<p>Online streaming worldwide</p>
			</div>
			<div class="col-12">
				<hr class="light-100">
				<h5>&copy; Musica - Emotion-Based Music Player</h5>
			</div>
		</div>
	</div>
</footer>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
  $(document).ready(function(){
    // Add smooth scrolling to all links
    $("a").on('click', function(event) {

      // Make sure this.hash has a value before overriding default behavior
      if (this.hash !== "") {
        // Prevent default anchor click behavior
        event.preventDefault();

        // Store hash
        var hash = this.hash;

        // Using jQuery's animate() method to add smooth page scroll
        $('html, body').animate({
          scrollTop: $(hash).offset().top
        }, 800, function(){
     
          // Add hash (#) to URL when done scrolling (default click behavior)
          window.location.hash = hash;
        });
      } // End if
    });
  });
</script>








<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>