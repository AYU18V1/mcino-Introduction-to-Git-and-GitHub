// Variables for Local Songs
const localSongs = [
    { path: 'assets/Songs/Calm Moments/Kabira.mp3', title: 'Kabira', artist: 'Pritam' },
    { path: 'assets/Songs/Calm Moments/MaanMeriJaan.mp3', title: 'Maan Meri Jaan', artist: 'King' },
    { path: 'assets/Songs/Happy Vibes/Ghungroo.mp3', title: 'Ghungroo', artist: 'Arjit Singh,Shilpa_Vishal' },
	{ path: 'assets/Songs/Calm Moments/TumHiHo.mp3', title: 'tum Hi Ho', artist: 'Arjit Singh' }
];
let currentLocalIndex = 0;
let audioPlayer = new Audio();
let isPlaying = false;
let isLocalPlaying = true; // Track if a local song is playing

// Play Local Song by Index
function playLocalSong(index) {
    stopApiSong(); // Stop any API song before playing a local song

    currentLocalIndex = index >= 0 && index < localSongs.length ? index : currentLocalIndex;
    const song = localSongs[currentLocalIndex];
    playSongByDetails(song.path, song.title, song.artist);
    isLocalPlaying = true;
}

function playSongByDetails(songPath, title, artist) {
    audioPlayer.src = songPath;
    audioPlayer.load();
    document.getElementById("song-title").textContent = title;
    document.getElementById("artist-name").textContent = artist;
    audioPlayer.play();
    isPlaying = true;
    updatePlayPauseIcon();
    updateProgressBar();
}

function playPreviousSong() {
    if (isLocalPlaying) {
        playLocalSong(currentLocalIndex - 1 >= 0 ? currentLocalIndex - 1 : localSongs.length - 1);
    } else {
        playPreviousApiSong();
    }
}

function playNextSong() {
    if (isLocalPlaying) {
        playLocalSong((currentLocalIndex + 1) % localSongs.length);
    } else {
        playNextApiSong();
    }
}

function togglePlayPause() {
    if (isPlaying) {
        audioPlayer.pause();
    } else {
        audioPlayer.play();
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
    audioPlayer.ontimeupdate = function() {
        const progressPercent = (audioPlayer.currentTime / audioPlayer.duration) * 100;
        document.getElementById("active-line").style.width = `${progressPercent}%`;

        // Update thumb position and display
        const thumb = document.getElementById("thumb");
        thumb.style.left = `${progressPercent}%`;
        thumb.style.display = 'block';
    };
}

audioPlayer.onended = function() {
    document.getElementById("thumb").style.display = 'none';
};

// Stop local song playback
function stopLocalSong() {
    audioPlayer.pause();
    isPlaying = false;
    updatePlayPauseIcon();
}

// Stop API song playback
function stopApiSong() {
    audioPlayer.pause();
    isPlaying = false;
    updatePlayPauseIcon();
}

// Variables and Functions for API Songs
let apiSongs = [];
let currentApiIndex = 0;

// Fetch and Display API Songs
const searchSongs = async () => {
    const searchText = document.getElementById("search-field").value;
    const url = `https://api.lyrics.ovh/suggest/${searchText}`;
    toggleSpinner();
    try {
        const res = await fetch(url);
        const data = await res.json();
        displaySongs(data.data);
    } catch (error) {
        displayError("Something went wrong. Please try again.");
    }
};

document.getElementById("search-field").addEventListener("keypress", function (event) {
    if (event.key === "Enter") {
        document.getElementById("search-button").click();
    }
});

const displayError = (error) => {
    const errorTag = document.getElementById("error-message");
    errorTag.innerText = error;
};

const toggleSpinner = () => {
    const spinner = document.getElementById("loading-spinner");
    const songsContainer = document.getElementById("song-container");
    spinner.classList.toggle("d-none");
    songsContainer.classList.toggle("d-none");
};

const displaySongs = (songsList) => {
    apiSongs = songsList;
    const songContainer = document.getElementById("song-container");
    songContainer.innerHTML = "";
    apiSongs.forEach((song, index) => {
        const songDiv = document.createElement("div");
        songDiv.className = "single-result row align-items-center my-3 p-3";
        songDiv.innerHTML = `
		<div class="scrollable-song-container">
            <div class="col-md-3">
                <img src="${song.album.cover}" class="img-fluid rounded">
            </div>
            <div class="col-md-6">
                <h3 class="lyrics-name">${song.title}</h3>
                <p class="author lead">${song.artist.name}</p>
            </div>
            <div class="col-md-3 text-md-right text-center">
                <button class="btn btn-primary" onclick="playApiSong(${index})">Play</button>
            </div>
			</div>
        `;
        songContainer.appendChild(songDiv);
    });
    toggleSpinner();
};

// Play API Song by Index
const playApiSong = (index) => {
    stopLocalSong(); // Stop any local song before playing an API song

    currentApiIndex = index >= 0 && index < apiSongs.length ? index : currentApiIndex;
    const song = apiSongs[currentApiIndex];
    playSongByDetails(song.preview, song.title, song.artist.name);
    document.querySelector(".song-info img").src = song.album.cover;
    isLocalPlaying = false;
};

const playNextApiSong = () => {
    currentApiIndex = (currentApiIndex + 1) % apiSongs.length;
    playApiSong(currentApiIndex);
};

const playPreviousApiSong = () => {
    currentApiIndex = (currentApiIndex - 1 + apiSongs.length) % apiSongs.length;
    playApiSong(currentApiIndex);
};

// PLAY EMOJI 
// Array to store references to each emoji
const emojis = document.querySelectorAll('.emoji');

// Function to stop the currently playing song
function stopCurrentSong() {
    const audioPlayer = document.getElementById('audio-player'); // Assuming this is your audio player element
    if (audioPlayer) {
        audioPlayer.pause();
        audioPlayer.currentTime = 0;
    }
}

// Function to play an emotion-based song based on emoji theme
async function playEmotionSong(theme) {
    stopCurrentSong(); // Stop any currently playing song

    try {
        // Fetch song data based on theme (update with actual API endpoint)
        const response = await fetch(`https://your-music-api.com/songs?emotion=${theme}`);
        const data = await response.json();
        
        if (data && data.songUrl) {
            const audioPlayer = document.getElementById('audio-player');
            audioPlayer.src = data.songUrl; // Set the song URL
            document.getElementById('song-title').textContent = data.songTitle; // Update song title
            document.getElementById('artist-name').textContent = data.artistName; // Update artist name
            audioPlayer.play(); // Play the new song
        }
    } catch (error) {
        console.error('Error fetching emotion-based song:', error);
    }
}

// Attach event listeners to each emoji for click functionality
emojis.forEach(emoji => {
    emoji.addEventListener('click', () => {
        const theme = emoji.getAttribute('data-theme'); // Get the theme from the data attribute
        playEmotionSong(theme); // Play the song based on the selected emoji theme
    });
});

