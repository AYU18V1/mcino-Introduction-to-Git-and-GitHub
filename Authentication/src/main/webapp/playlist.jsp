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
    </style>
</head>

<body>
    <div class="container">
        <aside class="sidebar">
            <div class="logo">
                <button class="menu-btn" id="menu-close">
                    <i class='bx bx-log-out-circle'></i>
                </button>
                <i class='bx bx-pulse'></i>
                <a href="#">MUSICA</a>
            </div>

            <div class="playing">
                <div class="top">
                    <img src="assets/current.png" alt="Current Playing">
                    <h4>Apple<br>Homepod</h4>
                </div>
                <div class="bottom">
                    <i class='bx bx-podcast'></i>
                    <p>Playing On Device</p>
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

                <div class="search">
                    <i class='bx bx-search'></i>
                    <input type="text" placeholder="Type here to search">
                </div>
            </header>

            <div class="music-list">
                <div class="playlist">
                    <div class="genres">
                        <div class="header">
                            <h3>Playlist</h3>
                            <br>
                            <h4>Classical Period</h4>
                        </div>

                        <div class="items">
                            <div class="item" onclick="playSongByDetails('assets/Songs/Classical Period/Laal Ishq.mp3', 'Laal Ishq', 'Arijit Singh')">
                                <p>Laal Ishq</p>
                            </div>
                            <div class="item" onclick="playSongByDetails('assets/Songs/Classical Period/Mohe Rang Do Laal.mp3', 'Mohe Rang Do Laal', 'Shreya Ghoshal')">
                                <p>Mohe Rang Do Laal</p>
                            </div>
                            <div class="item" onclick="playSongByDetails('assets/Songs/Classical Period/Piya_Tose_Naina_Lage_Re.mp3', 'Piya Tose Naina Lage Re', 'Lata Mangeshkar')">
                                <p>Piya Tose Naina Lage Re</p>
                            </div>

                            <div class="item">
                                <a href="classicalPeriod.jsp">
                                    <p>Classical<br>Period</p>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <div class="right-section">
            <div class="profile">
                <i id="settings-icon" class="bx bx-cog"></i>

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
                                 <div class="container">
        <div class="emoji-container">
            <div class="emoji" data-theme="Calm Moments">
                🌊
                <span class="tooltip">Calm Moments</span>
            </div>
            <div class="emoji" data-theme="Classical Period">
                🎻
                <span class="tooltip">Classical Period</span>
            </div>
            <div class="emoji" data-theme="Happy Vibes">
                😊
                <span class="tooltip">Happy Vibes</span>
            </div>
            <div class="emoji" data-theme="Love and Romance">
                ❤️
                <span class="tooltip">Love and Romance</span>
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

        <script>
            document.getElementById('settings-icon').addEventListener('click', function() {
                document.getElementById('settings-sidebar').classList.toggle('show');
            });

            window.onclick = function(event) {
                if (!event.target.matches('#settings-icon') && !event.target.closest('#settings-sidebar')) {
                    var sidebar = document.getElementById("settings-sidebar");
                    if (sidebar.classList.contains('show')) {
                        sidebar.classList.remove('show');
                    }
                }
            };

            const songs = [
                { path: 'assets/Songs/Classical Period/Laal Ishq.mp3', title: 'Laal Ishq', artist: 'Arijit Singh' },
                { path: 'assets/Songs/Classical Period/Mohe Rang Do Laal.mp3', title: 'Mohe Rang Do Laal', artist: 'Shreya Ghoshal' },
                { path: 'assets/Songs/Classical Period/Piya_Tose_Naina_Lage_Re.mp3', title: 'Piya Tose Naina Lage Re', artist: 'Lata Mangeshkar' }
            ];
            let currentIndex = 0;
            let audio = new Audio();
            let isPlaying = false;

            function playSong(index) {
                currentIndex = index >= 0 && index < songs.length ? index : currentIndex;
                const song = songs[currentIndex];
                playSongByDetails(song.path, song.title, song.artist);
            }

            function playSongByDetails(songPath, title, artist) {
                audio.src = songPath;
                audio.load();
                document.getElementById("song-title").textContent = title;
                document.getElementById("artist-name").textContent = artist;
                audio.play();
                isPlaying = true;
                updateProgressBar();
                updatePlayPauseIcon();
            }

            function playPreviousSong() {
                playSong(currentIndex - 1 >= 0 ? currentIndex - 1 : songs.length - 1);
            }

            function playNextSong() {
                playSong((currentIndex + 1) % songs.length);
            }

            function togglePlayPause() {
                if (isPlaying) {
                    audio.pause();
                } else {
                    audio.play();
                }
                isPlaying = !isPlaying;
                updatePlayPauseIcon();
            }

            function updatePlayPauseIcon() {
                const playPauseBtn = document.getElementById("play-pause-btn");
                playPauseBtn.classList.toggle('bx-stop', isPlaying);
                playPauseBtn.classList.toggle('bxs-right-arrow', !isPlaying);
            }

            function updateProgressBar() {
                audio.ontimeupdate = function() {
                    const progressPercent = (audio.currentTime / audio.duration) * 100;
                    document.getElementById("active-line").style.width = `${progressPercent}%`;

                    // Update thumb position and display
                    const thumb = document.getElementById("thumb");
                    thumb.style.left = `${progressPercent}%`;
                    thumb.style.display = 'block'; // Ensure the thumb is visible during playback
                };
            }
         // Make sure the thumb hides when playback stops or completes
            audio.onended = function() {
                document.getElementById("thumb").style.display = 'none';
            };


            function formatTime(seconds) {
                let min = Math.floor(seconds / 60);
                let sec = Math.floor(seconds % 60);
                return `${min}:${sec < 10 ? '0' + sec : sec}`;
            }

            document.getElementById("progress-bar").addEventListener("click", function(event) {
                const progressBar = this;
                const width = progressBar.offsetWidth;
                const clickX = event.offsetX;
                const duration = audio.duration;
                audio.currentTime = (clickX / width) * duration;
            });
        </script>
    </div>
</body>

</html>