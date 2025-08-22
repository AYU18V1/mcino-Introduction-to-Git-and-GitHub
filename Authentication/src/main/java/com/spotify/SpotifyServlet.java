package com.spotify;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;

import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SpotifyServlet")
public class SpotifyServlet extends HttpServlet {
    private static final String CLIENT_ID = "17e4058f3d81406c9f143b0163928c2d";
    private static final String CLIENT_SECRET = "ba0732f70168463589e1b80e10306d3d";
    private String accessToken;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
        String query = request.getParameter("query");
        if (query != null && !query.trim().isEmpty()) {
            if (accessToken == null) {
                accessToken = getSpotifyAccessToken();
            }

            String jsonResponse = searchSpotify(query);
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(jsonResponse);
            out.flush();
        }
    }

    private String getSpotifyAccessToken() throws java.io.IOException {
        String url = "https://accounts.spotify.com/api/token";
        String credentials = CLIENT_ID + ":" + CLIENT_SECRET;
        String encodedCredentials = Base64.getEncoder().encodeToString(credentials.getBytes());

        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Authorization", "Basic " + encodedCredentials);
        connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        connection.setDoOutput(true);
        connection.getOutputStream().write("grant_type=client_credentials".getBytes());

        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        StringBuilder response = new StringBuilder();
        String line;

        while ((line = reader.readLine()) != null) {
            response.append(line);
        }
        reader.close();

        JSONObject json = new JSONObject(response.toString());
        return json.getString("access_token");
    }

    private String searchSpotify(String query) throws java.io.IOException {
        String url = "https://api.spotify.com/v1/search?q=" + query + "&type=track&limit=10";

        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Authorization", "Bearer " + accessToken);

        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        StringBuilder response = new StringBuilder();
        String line;

        while ((line = reader.readLine()) != null) {
            response.append(line);
        }
        reader.close();

        JSONObject json = new JSONObject(response.toString());
        JSONArray items = json.getJSONObject("tracks").getJSONArray("items");

        JSONArray results = new JSONArray();
        for (int i = 0; i < items.length(); i++) {
            JSONObject track = items.getJSONObject(i);
            JSONObject artist = track.getJSONArray("artists").getJSONObject(0);
            JSONObject album = track.getJSONObject("album");

            JSONObject result = new JSONObject();
            result.put("name", track.getString("name"));
            result.put("artist", artist.getString("name"));
            result.put("spotifyUrl", track.getJSONObject("external_urls").getString("spotify"));
            result.put("albumImageUrl", album.getJSONArray("images").getJSONObject(0).getString("url"));
            results.put(result);
        }

        return results.toString();
    }
}
