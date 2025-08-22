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
    
   /* Styling for the search box to fill the entire header width */
.header {
    width: 100%;
    padding: 0;
    margin: 0;
}

.content-area {
    width: 100%;
    display: flex;
    justify-content: center;
}

.search-bar {
    width: 100%;
    padding: 0 20px; /* Adjust padding for some spacing */
}

.search-box {
    display: flex;
    align-items: center;
    background-color: #2b2b2b;
    border-radius: 30px;
    padding: 10px 15px;
    width: 100%; /* Full width of the container */
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
}

.search-icon {
    color: #b3b3b3;
    font-size: 20px;
    margin-right: 10px;
}

#search-field {
    flex-grow: 1;
    background-color: transparent;
    border: none;
    color: #fff;
    outline: none;
}

#search-field::placeholder {
    color: #b3b3b3;
}

.search-btn {
    background-color: transparent;
    border: none;
    color: #b3b3b3;
    font-size: 18px;
    cursor: pointer;
}

.search-btn:hover {
    color: #fff;
}

/* Spinner styling */
.spinner-border.text-warning {
    color: #f0ad4e;
}

/* Error message styling */
#error-message {
    font-size: 14px;
    margin-top: 5px;
}


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
    
    /* Main container styling for the song results */
#song-container {
    background-color: #121212; /* Black background */
    border-radius: 10px;
    padding: 20px;
    margin-top: 10px; /* 10px gap from the div above */
    color: #fff; /* White text color */
    width: 80%; /* Adjust width as per your requirement */
    max-height: 400px; /* Max height for scrollable area */
    overflow-y: auto; /* Enable vertical scroll */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Optional shadow for effect */
    margin-left: auto; /* Center the container horizontally */
    margin-right: auto;
}

/* Styling individual song items */
.song-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px 0;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1); /* Divider line */
}

.song-item:last-child {
    border-bottom: none; /* Remove border for the last item */
}

/* Styling for song details */
.song-details {
    display: flex;
    align-items: center;
}

.song-cover {
    width: 50px;
    height: 50px;
    margin-right: 15px;
    border-radius: 5px; /* Rounded cover image */
}

.song-info {
    display: flex;
    flex-direction: column;
}

.song-title {
    font-size: 16px;
    font-weight: bold;
    color: #ffffff;
}

.song-artist {
    font-size: 14px;
    color: #b3b3b3; /* Gray color for artist names */
}

/* Styling for song duration */
.song-duration {
    font-size: 14px;
    color: #b3b3b3;
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
                

               <main class="content-area">
    <!-- New search bar replacement -->
    <div class="search-bar col-md-6 mx-auto">
        <div class="search-box my-5">
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
   
</main>
</header>
 <!-- Single Lyrics -->
        <h3 id="error-message" class="text-danger"></h3>
        <div id="song-lyrics" class="single-lyrics text-center"></div>

        <div
          id="song-container"
          class="search-result col-md-8 mx-auto py-4"
        ></div>

            

            <div class="playlist" style="display: flex; flex-wrap: wrap; gap: 16px; padding: 20px; justify-content: center;">
    <div class="music-list" style="display: flex; flex-wrap: wrap; gap: 20px; justify-content: space-around; width: 90%;">
        <div class="items">
            <div class="container" style="display: flex; flex-direction: column; align-items: center; gap: 16px;">
                <h1 style="text-align: center; color: #fff; font-size: 24px;">VIBES.....</h1>
                <div class="songItemContainer" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 16px;">

                    <!-- Song Item 1 -->
                    <div class="songItem" onclick="playLocalSong(0)" style="background-color: #1a1a1a; border-radius: 8px; overflow: hidden; color: #fff; text-align: center; padding: 10px;">
                        <img src="img/cover1.jpg" alt="img" style="width: 100%; height: auto; border-radius: 8px 8px 0 0;">
                        <span class="songName" style="display: block; margin-top: 10px; font-weight: bold; font-size: 16px;">Let Me Love You</span>
                        <span class="songListPlay" style="display: block; color: #aaa; margin-top: 5px;">
                            <span class="timeStamp"> <i id="0" class="fa-solid songItemPlay fa-1.5x fa-circle-play" style="color: #1fd6ff; cursor: pointer;"></i></span>
                        </span>
                    </div>

                    <!-- Repeat this structure for other song items -->
                    <div class="songItem" onclick="playLocalSong(1)" style="background-color: #1a1a1a; border-radius: 8px; overflow: hidden; color: #fff; text-align: center; padding: 10px;">
                        <img src="img/cover2.jpg" alt="img" style="width: 100%; height: auto; border-radius: 8px 8px 0 0;">
                        <span class="songName" style="display: block; margin-top: 10px; font-weight: bold; font-size: 16px;">On The Way</span>
                        <span class="songListPlay" style="display: block; color: #aaa; margin-top: 5px;">
                            <span class="timeStamp"> <i id="1" class="fa-solid songItemPlay fa-1.5x fa-circle-play" style="color: #1fd6ff; cursor: pointer;"></i></span>
                        </span>
                    </div>

                    <!-- Add more song items as needed -->
                    <div class="songItem" onclick="playLocalSong(2)" style="background-color: #1a1a1a; border-radius: 8px; overflow: hidden; color: #fff; text-align: center; padding: 10px;">
                        <img src="img/cover3.jpg" alt="img" style="width: 100%; height: auto; border-radius: 8px 8px 0 0;">
                        <span class="songName" style="display: block; margin-top: 10px; font-weight: bold; font-size: 16px;">Shape Of You</span>
                        <span class="songListPlay" style="display: block; color: #aaa; margin-top: 5px;">
                            <span class="timeStamp"> <i id="1" class="fa-solid songItemPlay fa-1.5x fa-circle-play" style="color: #1fd6ff; cursor: pointer;"></i></span>
                        </span>
                    </div>
                    
                    <div class="songItem" onclick="playLocalSong(3)" style="background-color: #1a1a1a; border-radius: 8px; overflow: hidden; color: #fff; text-align: center; padding: 10px;">
                        <img src="img/cover4.jpg" alt="img" style="width: 100%; height: auto; border-radius: 8px 8px 0 0;">
                        <span class="songName" style="display: block; margin-top: 10px; font-weight: bold; font-size: 16px;">Love Me Like you Do</span>
                        <span class="songListPlay" style="display: block; color: #aaa; margin-top: 5px;">
                            <span class="timeStamp"> <i id="1" class="fa-solid songItemPlay fa-1.5x fa-circle-play" style="color: #1fd6ff; cursor: pointer;"></i></span>
                        </span>
                    </div>
                    
                    <div class="songItem" onclick="playLocalSong(4)" style="background-color: #1a1a1a; border-radius: 8px; overflow: hidden; color: #fff; text-align: center; padding: 10px;">
                        <img src="img/cover5.jpg" alt="img" style="width: 100%; height: auto; border-radius: 8px 8px 0 0;">
                        <span class="songName" style="display: block; margin-top: 10px; font-weight: bold; font-size: 16px;">See You Again</span>
                        <span class="songListPlay" style="display: block; color: #aaa; margin-top: 5px;">
                            <span class="timeStamp"> <i id="1" class="fa-solid songItemPlay fa-1.5x fa-circle-play" style="color: #1fd6ff; cursor: pointer;"></i></span>
                        </span>
                    </div>
                    
                    <div class="songItem"  onclick="playLocalSong(5)" style="background-color: #1a1a1a; border-radius: 8px; overflow: hidden; color: #fff; text-align: center; padding: 10px;">
                        <img src="img/cover6.jpg" alt="img" style="width: 100%; height: auto; border-radius: 8px 8px 0 0;">
                        <span class="songName" style="display: block; margin-top: 10px; font-weight: bold; font-size: 16px;">Stay</span>
                        <span class="songListPlay" style="display: block; color: #aaa; margin-top: 5px;">
                            <span class="timeStamp"> <i id="1" class="fa-solid songItemPlay fa-1.5x fa-circle-play" style="color: #1fd6ff; cursor: pointer;"></i></span>
                        </span>
                    </div>
                    
                    <div class="songItem" onclick="playLocalSong(6)" style="background-color: #1a1a1a; border-radius: 8px; overflow: hidden; color: #fff; text-align: center; padding: 10px;">
                        <img src="img/cover7.jpg" alt="img" style="width: 100%; height: auto; border-radius: 8px 8px 0 0;">
                        <span class="songName" style="display: block; margin-top: 10px; font-weight: bold; font-size: 16px;">Dont you hold Me Down</span>
                        <span class="songListPlay" style="display: block; color: #aaa; margin-top: 5px;">
                            <span class="timeStamp"> <i id="1" class="fa-solid songItemPlay fa-1.5x fa-circle-play" style="color: #1fd6ff; cursor: pointer;"></i></span>
                        </span>
                    </div>
                    
                    <div class="songItem" onclick="playLocalSong(7)" style="background-color: #1a1a1a; border-radius: 8px; overflow: hidden; color: #fff; text-align: center; padding: 10px;">
                        <img src="img/cover8.jpg" alt="img" style="width: 100%; height: auto; border-radius: 8px 8px 0 0;">
                        <span class="songName" style="display: block; margin-top: 10px; font-weight: bold; font-size: 16px;">As I Am</span>
                        <span class="songListPlay" style="display: block; color: #aaa; margin-top: 5px;">
                            <span class="timeStamp"> <i id="1" class="fa-solid songItemPlay fa-1.5x fa-circle-play" style="color: #1fd6ff; cursor: pointer;"></i></span>
                        </span>
                    </div>
                    
                    <div class="songItem" onclick="playLocalSong(8)" style="background-color: #1a1a1a; border-radius: 8px; overflow: hidden; color: #fff; text-align: center; padding: 10px;">
                        <img src="img/cover9.jpg" alt="img" style="width: 100%; height: auto; border-radius: 8px 8px 0 0;">
                        <span class="songName" style="display: block; margin-top: 10px; font-weight: bold; font-size: 16px;">Joker</span>
                        <span class="songListPlay" style="display: block; color: #aaa; margin-top: 5px;">
                            <span class="timeStamp"> <i id="1" class="fa-solid songItemPlay fa-1.5x fa-circle-play" style="color: #1fd6ff; cursor: pointer;"></i></span>
                        </span>
                    </div>
                    
                    
                    

                </div>
            </div>
        </div>
    </div>
</div>

        </main>

        <div class="right-section">
    <div class="profile">
       
        
        <!-- Settings icon with slide bar -->
        
        <div class="settings-sidebar" id="settings-sidebar">
            <a href="index.jsp" class="logout-btn">Logout</a>
        </div>

        <div class="user">
            <div class="left">
                <img src="assets/profile.png">
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

            <div class="playlist" style ="position: fixed;right: 3px; width: 30%;" >
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
        <div class="emoji-container" >
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
    </div>
   

   <script>
    // Toggle sidebar visibility when settings icon is clicked
    document.getElementById('settings-icon').addEventListener('click', function() {
        document.getElementById('settings-sidebar').classList.toggle('show');
    });

    // Close the sidebar if clicked outside
    window.onclick = function(event) {
        if (!event.target.matches('#settings-icon')) {
            var sidebar = document.getElementById("settings-sidebar");
            if (sidebar.classList.contains('show')) {
                sidebar.classList.remove('show');
            }
        }
    };
</script>
 <script src="js/app2.js"></script>
 <script src="js/emoji.js"></script>
 
</body>
</html>