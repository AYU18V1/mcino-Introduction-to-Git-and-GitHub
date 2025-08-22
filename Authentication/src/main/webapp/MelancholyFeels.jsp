
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/dashboard.css">
    <title>MUSICA</title>
    <style>
        /* Adjusted button box size */
        .player-actions .buttons i {
            font-size: 32px;
            cursor: pointer;
            padding: 16px;
            border-radius: 50%;
            background-color: #f0f4ff;
            color: #1e88e5;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: transform 0.2s, background-color 0.2s;
        }

        .player-actions .buttons i:hover {
            transform: scale(1.1);
            background-color: #e0e0e0;
        }

        /* Center music control buttons and adjust hover effect */
        .player-actions .buttons {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 30px;
        }

        /* Thumb styling inside the progress bar */
/* Thumb styling inside the progress bar */
.progress-bar {
    height: 4px;
    background-color: #d3d3d3;
    border-radius: 2px;
    overflow: hidden;
    cursor: pointer;
    position: relative;
    margin-top: 10px;
}

.active-line {
    background-color: #4caf50;
    height: 100%;
    width: 0%;
    transition: width 0.2s;
    position: relative;
}

.thumb {
    width: 12px; /* Adjusted thumb size for visibility */
    height: 12px;
    background-color: #133E87;
    border-radius: 50%;
    position: absolute;
    top: -4px; /* Center the thumb on the progress line */
    transform: translateX(-50%);
    transition: left 0.2s;
    display: none; /* Initially hidden; will display when audio plays */
}


        /* General Styling */
        .emoji-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 10px;
        }

        /* 3D Emoji Styling */
        .emoji {
            font-size: 38px;
            cursor: pointer;
            transition: transform 0.3s;
            position: relative;
            display: inline-block;
            perspective: 500px;
        }

        /* 3D Rotation and Hover Effects */
        .emoji:hover {
            transform: rotateX(30deg) rotateY(30deg) scale(1.3);
            filter: drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25));
        }

        /* Tooltip for Emojis */
        .tooltip {
            visibility: hidden;
            position: absolute;
            bottom: 60px;
            background-color: rgba(0, 0, 0, 0.75);
            color: #fff;
            padding: 8px 12px;
            border-radius: 8px;
            font-size: 14px;
            white-space: nowrap;
            opacity: 0;
            transition: opacity 0.3s;
        }

        .emoji:hover .tooltip {
            visibility: visible;
            opacity: 1;
            transform: translateY(-10px);
        }

        /* Individual Emojis Styles */
        .emoji[data-theme="Calm Moments"] {
            color: #1e88e5;
        }

        .emoji[data-theme="Classical Period"] {
            color: #4caf50;
        }

        .emoji[data-theme="Happy Vibes"] {
            color: #ffc107;
        }

        .emoji[data-theme="Love and Romance"] {
            color: #e91e63;
        }

        .emoji[data-theme="Melancholy Feels"] {
            color: #607d8b;
        }

        .emoji[data-theme="Motivational Energy"] {
            color: #ff5722;
        }
        
        /*search music  */
        .form-control {
  background-color: rgba(255, 255, 255, 0.2);
  padding: 22px;
  border: none;
  border-radius: 25px;
}
.btn {
  border-radius: 1.5rem;
  padding: 9px 20px;
}

.btn-privious {
  background: rgba(255, 255, 255, 0.2);
  color: #ffffff;
}
.navbar-toggler {
  border: none;
}
.search-box {
  
  position: relative;
}
.search-btn {
  position: absolute;
  top: 0;
  right: 0;
  height: 100%;
}
.single-result {
  background: rgba(255, 255, 255, 0.2);
  border-radius: 15px;
}
/* Enhanced Search Box Styling */
/* Enhanced Search Box Styling */
.search-box {
    display: flex;
    align-items: center;
    gap: 6px;
    width: 100%;
    margin-top: 20px; /* Added margin to separate from above content */
    background-color: #1d1d1d;
    border: 1px solid #464748;
    padding: 12px 15px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    transition: all 0.3s ease;
}

/* Adding smooth transition for hover */
.search-box:hover {
    border-color: #28a745;
    box-shadow: 0 6px 12px rgba(0, 128, 0, 0.3);
}

/* Input Field Styling */
.search-box #search-field {
    width: 100%;
    background-color: transparent;
    border: none;
    outline: none;
    color: #e0e0e0;
    font-size: 1rem;
    font-weight: 500;
    transition: color 0.3s ease;
}

/* Input focus styling */
.search-box #search-field::placeholder {
    color: #888;
}

.search-box #search-field:focus {
    color: #fff;
}

/* Search Button Styling */
.search-box .search-btn {
    background-color: #28a745;
    border: none;
    color: #fff;
    padding: 10px 20px;
    border-radius: 8px;
    font-weight: 600;
    font-size: 0.95rem;
    transition: all 0.3s ease;
    box-shadow: 0 4px 8px rgba(40, 167, 69, 0.3);
}

/* Hover Effect for Search Button */
.search-box .search-btn:hover {
    background-color: #218838;
    box-shadow: 0 6px 12px rgba(33, 136, 56, 0.4);
    transform: scale(1.05);
}

/* Active Click Effect for Search Button */
.search-box .search-btn:active {
    background-color: #19692c;
    box-shadow: 0 2px 4px rgba(25, 105, 44, 0.2);
    transform: scale(0.98);
}

.single-result {
    display: flex;
    align-items: center;
    background-color: #181818;
    color: #ffffff;
    border-radius: 5px;
    margin-bottom: 10px;
    padding: 10px; /* Add padding to make space around items */
    transition: background-color 0.3s; /* Optional: smooth background transition on hover */
}

/* Album cover styling */
.single-result .col-md-1 img {
    width: 60px;
    height: 60px;
    object-fit: cover;
    border-radius: 5px;
}

/* Title and artist styling */
.single-result .lyrics-name {
    font-size: 1.1rem;
    font-weight: 600;
    margin: 0;
    color: #ffffff;
}

.single-result .author {
    font-size: 0.9rem;
    color: #b3b3b3;
    margin: 0;
}

/* Play button styling */
.single-result .btn-primary {
    font-size: 0.9rem;
    padding: 5px 15px;
    border-radius: 5px;
    margin-right: 0; /* Reset right margin */
    transition: background-color 0.3s, transform 0.3s; /* Smooth transitions */
}

/* Hover effect for button */
.single-result .btn-primary:hover {
    background-color: #1db954; /* Spotify green, adjust color as needed */
    transform: scale(1.1); /* Slightly enlarges button on hover */
}

/* Alignment and spacing */
.single-result .col-md-8 {
    padding-left: 10px;
}

/* Ensure the button stays aligned to the far right */
.single-result .col-md-3 {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    padding-right: 20px; /* Optional: adds spacing from the edge */
}

/* Optional: Hover effect on the entire song item */
.single-result:hover {
    background-color: #282828; /* Darker background on hover */
}

 
   .menu {
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #2b2b2b; /* Dark background color for the menu */
    padding: 20px;
}

.items {
    display: flex;
    flex-direction: column;
    gap: 15px;
    width: 100%;
}

.item {
    background-color: #5a6b8c; /* Default button color */
    color: white;
    font-weight: bold;
    text-align: center;
    padding: 15px;
    border-radius: 8px;
    width: 100%;
    max-width: 200px;
    transition: background-color 0.3s ease;
}

.item:nth-child(1) {
    background-color: #5a6b8c; /* Color for 'Laal Ishq' */
}

.item:nth-child(2) {
    background-color: #b5a48b; /* Color for 'Mohe Rang Do Laal' */
}

.item:nth-child(3) {
    background-color: #b55342; /* Color for 'Piya Tose Naina Lage Re' */
}

.item:nth-child(4) {
    background-color: #204d55; /* Color for 'Classical Period' */
}

.item a {
    color: white;
    text-decoration: none;
}

.item:hover {
    background-color: #4a4a4a; /* Hover effect color */
}
  

    </style>
</head>

<body>
    <div class="container">
        <aside class="sidebar" >
        <div class ="sidebarStick" style="position: fixed; ">
            <div class="logo">
                <button class="menu-btn" id="menu-close">
                    <i class='bx bx-log-out-circle'></i>
                </button>
                <i class='bx bx-pulse'></i>
                <a href="#">MUSICA</a>
            </div>

            <div class="menu">
                
                    <div class="items">
                        <div class="item">
                        <a href="HappyVibes.jsp"><p>Happy<br>Vibes</p></a>
                             
                        </div>
                        <div class="item">
                        <a href="CalmMoments.jsp"><p>Calm<br>Moments</p></a>                           
                        </div>
                        <div class="item">
                          <a href="MelancholyFeels.jsp"><p>Melancholy<br>Feels</p></a>                          
                        </div>
                        <div class="item" >
                           <a href="classicalPeriod.jsp"><p>Classical<br>Period</p></a>
                        </div>
                        <div class="item">
                        <a href="MotivationalEnergy.jsp"><p>Motivational<br>Energy</p></a>   
                            
                        </div>
                                              
                    </div>              
            </div>
            <div class="playing">     
            </div>
            </div>
        </aside>

        <main>
            <header>
                <div class="nav-links">
                    <button class="menu-btn" id="menu-open">
                        <i class='bx bx-menu'></i>
                    </button>
                    <a href="dashboard.jsp">Music</a>
                </div>
                

            </header>

            <div class="music-list">
                <div class="playlist"style = "width : 130% ; height : 100%">
                    <div class="genres"  >
                        <div class="header">
                            <h3>Playlist</h3>
                          
                            <h4>Melancholy Feels</h4>
                        </div>

                        <div class="items" >
                            <div class="item"  onclick="playSongByDetails('assets/Songs/Melancholy Feels/AgarTumSaathHo.mp3', 'Agar Tum Saath Ho', 'Alka Yagnik and Arijit Singh')">
                                <p>Agar Tum Saath Ho</p>
                            </div>
                            <div class="item" onclick="playSongByDetails('assets/Songs/Melancholy Feels/ChannaMereya.mp3', 'Channa Mereya', 'Arjit Singh')">
                                <p>Channa Mereya </p>
                            </div>
                            <div class="item" onclick="playSongByDetails('assets/Songs/Melancholy Feels/Duaa.mp3', 'Duaa', 'Shanghai')">
                                <p>Dua</p>
                            </div>
                           
                        </div>
                        
                    </div>
                </div>
                 
    

      <main class="content-area">
        <div class="search-bar col-md-6 mx-auto">
         
          <div class="search-box my-5" >
          <i class="bx bx-search search-icon"></i>
            <input
              id="search-field"
              type="text"
              class="form-control"
              placeholder="Enter your artist song name"
              
            />
            <button
              id="search-button"
              onclick="searchSongs()"
              class="btn btn-success search-btn">
              Search
            </button>
            <h3 id="error-message" class="text-danger"></h3>
          </div>
        </div>

        <!-- Spinner -->
        <div class="d-flex justify-content-center">
          <div id="loading-spinner" class="spinner-border text-warning d-none" role="status">
            
          </div>
        </div>

        <!-- Single Lyrics -->
        <h3 id="error-message" class="text-danger"></h3>
        <div id="song-lyrics" class="single-lyrics text-center"></div>

        <div
          id="song-container"
          class="search-result col-md-8 mx-auto py-4"
        ></div>
      </main>
    </div>
        </main>

        <div class="right-section">
            <div class="profile">
                

                <div class="settings-sidebar" id="settings-sidebar">
                    <a href="index.jsp" class="logout-btn">Logout</a>
                </div>

                <div class="user">
                    <div class="left">
                        <img src="assets/profile.png" alt="Profile">
                    </div>
                    <div class="right">
                        <h5>
                            <% 
                                String userName = (String) session.getAttribute("name");
                                if (userName != null) {
                                    out.print(userName);
                                } else {
                                    out.print("Guest");
                                }
                            %>
                        </h5>
                    </div>
                </div>
            </div>

            <div class="playlist">
                <div class="genres">
                    <div class="music-player">
                        <div class="top-section">
                            <div class="header">
                                <h5>Player</h5>
                                <i class='bx bxs-playlist'></i>
                            </div>
                            <div class="song-info">
                                <img src="assets/player.png" alt="Song Art" width="100">
                                <div class="description">
                                    <h3 id="song-title">Select a Song</h3>
                                    <h5 id="artist-name">Artist</h5>
                                </div>
                                <div class="progress">
                                   
                                    <!-- Updated Progress Bar -->
                                    <div class="progress-bar" id="progress-bar">
                                    <div class="active-line" id="active-line">
                                    <div class="thumb" id="thumb"></div> <!-- New thumb for progress indicator -->
                                       </div>
                                   </div>

                                   
                                </div>
                                <!-- Emoji container positioned below the progress bar -->
                                 <div class="container" style = "width :75%;">
        <div class="emoji-container">
            <div class="emoji" data-theme="Calm Moments">
                🌊
                <span class="tooltip">Calm Moments</span>
            </div>
            <div class="emoji" data-theme="Classical Period">
                🎻
                <span class="tooltip"><a href="dashboard.jsp">Classical Vibes</a></span>
            </div>
            <div class="emoji" data-theme="Happy Vibes">
                😊
                <span class="tooltip">Happy Vibes</span>
            </div>
            
            <div class="emoji" data-theme="Melancholy Feels">
                😢
                <span class="tooltip">Melancholy Feels</span>
            </div>
            <div class="emoji" data-theme="Motivational Energy">
                💪
                <span class="tooltip">Motivational Energy</span>
            </div>
        </div>
        
    </div>
                            </div>
                        </div>

                        <div class="player-actions">
                            <div class="buttons">
                                <i class='bx bx-first-page' onclick="playPreviousSong()"></i>
                                <i class='bx bxs-right-arrow play-button' id="play-pause-btn" onclick="togglePlayPause()"></i>
                                <i class='bx bx-last-page' onclick="playNextSong()"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Custom Script Here -->
    
    <script src="js/app5.js"></script>
     <script src="js/emoji.js"></script>
    </div>
</body>

</html>