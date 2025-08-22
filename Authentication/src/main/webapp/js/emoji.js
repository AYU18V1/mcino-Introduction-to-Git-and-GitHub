const EsongFolders = {
    "Calm Moments": [
        { path: 'assets/Songs/Calm Moments/Kabira.mp3', title: 'Kabira', artist: 'Tochi Raina, Rekha Bhardwaj' },
        { path: 'assets/Songs/Calm Moments/MaanMeriJaan.mp3', title: 'Maan Meri Jaan', artist: 'King' },
        { path: 'assets/Songs/Calm Moments/TumHiHo.mp3', title: 'Tum Hi Ho', artist: 'Arijit Singh' }
    ],
    "Classical Period": [
        { path: 'assets/Songs/Classical Period/bollywood_HDDCS 1999 - Albela Sajan.mp3', title: 'Albela Sajan', artist: 'HDDCS 1999' },
        { path: 'assets/Songs/Classical Period/Laal Ishq.mp3', title: 'Laal Ishq', artist: 'Arijit Singh' },
        { path: 'assets/Songs/Classical Period/Mohe Rang Do Laal.mp3', title: 'Mohe Rang Do Laal', artist: 'Shreya Ghoshal' },
        { path: 'assets/Songs/Classical Period/old_woh_kaun_thi.mp3', title: 'Woh Kaun Thi', artist: 'Lata Mangeshkar' },
        { path: 'assets/Songs/Classical Period/Piya_Tose_Naina_Lage_Re.mp3', title: 'Piya Tose Naina Lage Re', artist: 'Lata Mangeshkar' }
    ],
    "Happy Vibes": [
        { path: 'assets/Songs/Happy Vibes/AankhMarey.mp3', title: 'Aankh Marey', artist: 'Tanishk Bagchi, Mika Singh' },
        { path: 'assets/Songs/Happy Vibes/Bom Diggy Diggy.mp3', title: 'Bom Diggy Diggy', artist: 'Guru Randhwa' },
        { path: 'assets/Songs/Happy Vibes/Ghungroo.mp3', title: 'Ghungroo', artist: 'Arijit Singh, Shilpa Rao' },
        { path: 'assets/Songs/Happy Vibes/LOVER .mp3', title: 'Lover', artist: 'Diljit Dosanjh' },
        { path: 'assets/Songs/Happy Vibes/DilChori.mp3', title: 'Dil Chori', artist: 'Yo Yo Honey Singh, Simar Kaur, Ishers, Hans Raj Hans' }
    ],
    "Love & Romance": [
        { path: 'assets/Songs/LoveAndRomance/JeeneLagaHoon.mp3', title: 'Jeene Laga Hoon', artist: 'Atif Aslam, Shreya Ghoshal' },
        { path: 'assets/Songs/Love & Romance/PeeLoon.mp3', title: 'Pee Loon', artist: 'Mohit Chauhan' },
        { path: 'assets/Songs/Love & Romance/Pal.mp3', title: 'Pal', artist: 'Arijit Singh' },
        { path: 'assets/Songs/Love & Romance/Raabta.mp3', title: 'Raabta', artist: 'Arijit Singh' },
        { path: 'assets/Songs/Love & Romance/Ter BanJaungaKabirSingh.mp3', title: 'Tera Ban Jaunga', artist: 'Akhil Sachdeva, Tulsi Kumar' }
    ],
    "Melancholy Feels": [
        { path: 'assets/Songs/Melancholy Feels/AgarTumSaathHo.mp3', title: 'Agar Tum Saath Ho', artist: 'Arijit Singh, Alka Yagnik' },
        { path: 'assets/Songs/Melancholy Feels/ChannaMereya.mp3', title: 'Channa Mereya', artist: 'Arijit Singh' },
        { path: 'assets/Songs/Melancholy Feels/Duaa.mp3', title: 'Duaa', artist: 'Nandini Srikar, Arijit Singh' },
        { path: 'assets/Songs/Melancholy Feels/PhirBhiTumkoChahunga.mp3', title: 'Phir Bhi Tumko Chaahunga', artist: 'Arijit Singh, Shashaa Tirupati' },
        { path: 'assets/Songs/Melancholy Feels/TujheKitnaChaheinAurHum.mp3', title: 'Tujhe Kitna Chahein Aur Hum', artist: 'Arijit Singh, Jubin Nautiyal' }
    ],
    "Motivational Energy": [
        { path: 'assets/Songs/Motivational Energy/BrothersAnthem.mp3', title: 'Brothers Anthem', artist: 'Vishal Dadlani' },
        { path: 'assets/Songs/Motivational Energy/Lakshya - Lakshya 128 Kbps.mp3', title: 'Lakshya', artist: 'Shankar Ehsaan Loy' },
        { path: 'assets/Songs/Motivational Energy/RangDe.mp3', title: 'Rang De Basanti', artist: 'A. R. Rahman' },
        { path: 'assets/Songs/Motivational Energy/Time.mp3', title: 'Time', artist: 'Hans Zimmer' },
        { path: 'assets/Songs/Motivational Energy/Zinda Bhaag Milkha Bhaag 128 Kbps.mp3', title: 'Zinda', artist: 'Siddharth Mahadevan' }
    ]
};


let EaudioPlayer = new Audio();
let EisPlaying = false;
let EcurrentEmotion = ""; // Current emotion folder
let EcurrentSongIndex = 0; // Track the index of the current song

// Play a random song from the selected emotion folder
function playRandomSong(emotion) {
    stopCurrentSong(); // Stop any currently playing song

    const Esongs = EsongFolders[emotion];
    if (Esongs && Esongs.length > 0) {
        const randomIndex = Math.floor(Math.random() * Esongs.length);
        EcurrentEmotion = emotion; // Update the current emotion folder
        EcurrentSongIndex = randomIndex; // Set the index to the random song
        
        const song = Esongs[EcurrentSongIndex];
        playSongByDetails(song.path, song.title, song.artist);
    }
}

function playSongByDetails(songPath, title, artist) {
    audioPlayer.src = songPath;
    audioPlayer.load();
    document.getElementById("song-title").textContent = title;
    document.getElementById("artist-name").textContent = artist;
    audioPlayer.play().then(() => {
        EisPlaying = true;
        updatePlayPauseIcon();
        updateProgressBar();
    }).catch(error => {
        console.error("Error playing audio:", error);
        alert("There was an issue playing the song. Please check the file path.");
    });
}

// Toggle play and pause, and update the icon accordingly
function togglePlayPause() {
    if (EisPlaying) {
        audioPlayer.pause();
    } else {
        audioPlayer.play();
    }
    EisPlaying = !EisPlaying;
    updatePlayPauseIcon();
}

// Play the next song in the current emotion folder
function playNextSong() {
    const songs = EsongFolders[EcurrentEmotion];
    if (songs && songs.length > 0) {
        EcurrentSongIndex = (EcurrentSongIndex + 1) % songs.length;
        const EnextSong = songs[EcurrentSongIndex];
        playSongByDetails(EnextSong.path, EnextSong.title, EnextSong.artist);
    }
}

// Play the previous song in the current emotion folder
function playPreviousSong() {
    const songs = EsongFolders[EcurrentEmotion];
    if (songs && songs.length > 0) {
        EcurrentSongIndex = (EcurrentSongIndex - 1 + songs.length) % songs.length;
        const prevSong = songs[EcurrentSongIndex];
        playSongByDetails(prevSong.path, prevSong.title, prevSong.artist);
    }
}

// Update the play/pause button icon
function updatePlayPauseIcon() {
    const playPauseBtn = document.getElementById("play-pause-btn");
    if (EisPlaying) {
        playPauseBtn.classList.remove('bxs-right-arrow');
        playPauseBtn.classList.add('bxs-pause');
    } else {
        playPauseBtn.classList.remove('bxs-pause');
        playPauseBtn.classList.add('bxs-right-arrow');
    }
}

// Update the progress bar as the song plays
function updateProgressBar() {
    audioPlayer.ontimeupdate = function() {
        const progressPercent = (audioPlayer.currentTime / audioPlayer.duration) * 100;
        document.getElementById("active-line").style.width = `${progressPercent}%`;

        // Update thumb position and display
        const thumb = document.getElementById("thumb");
        thumb.style.left = `${progressPercent}%`;
        thumb.style.display = 'block';
    };
}

// Reset the play button icon when the song ends
audioPlayer.onended = function() {
    EisPlaying = false;
    updatePlayPauseIcon();
    document.getElementById("thumb").style.display = 'none';
};

// Stop the current song
function stopCurrentSong() {
    audioPlayer.pause();
    audioPlayer.currentTime = 0;
    EisPlaying = false;
    updatePlayPauseIcon();
}

// Add click event listeners for each emoji to play a random song from the selected emotion folder
document.querySelectorAll(".emoji").forEach(emoji => {
    emoji.addEventListener("click", function () {
        const theme = this.getAttribute("data-theme");
        playRandomSong(theme);
    });
});

// Add event listeners for the play/pause, next, and previous buttons
document.getElementById("playPauseBtn").addEventListener("click", togglePlayPause);
document.getElementById("next-btn").addEventListener("click", playNextSong);
document.getElementById("prev-btn").addEventListener("click", playPreviousSong);

