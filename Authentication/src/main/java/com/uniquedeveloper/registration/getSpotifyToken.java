package com.uniquedeveloper.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;

/**
 * Servlet implementation class getSpotifyToken
 */
@WebServlet("/getSpotifyToken")
public class getSpotifyToken extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private final String clientId = "17e4058f3d81406c9f143b0163928c2d";
    private final String clientSecret = "ba0732f70168463589e1b80e10306d3d";
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getSpotifyToken() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = fetchSpotifyToken();
        if (token != null) {
            response.setContentType("application/json");
            response.getWriter().write("{\"access_token\": \"" + token + "\"}");
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to retrieve access token.");
        }
    }

    /**
     * Fetches the Spotify access token using Client Credentials
     */
    private String fetchSpotifyToken() throws IOException {
        URL url = new URL("https://accounts.spotify.com/api/token");
        String auth = Base64.getEncoder().encodeToString((clientId + ":" + clientSecret).getBytes());

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "Basic " + auth);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.setDoOutput(true);

        try (OutputStream os = conn.getOutputStream()) {
            os.write("grant_type=client_credentials".getBytes());
        }

        if (conn.getResponseCode() == 200) {
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuilder content = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }

            in.close();
            
            // Extract token from JSON response
            String response = content.toString();
            int tokenStartIndex = response.indexOf("access_token\":\"") + 15;
            int tokenEndIndex = response.indexOf("\"", tokenStartIndex);
            return response.substring(tokenStartIndex, tokenEndIndex);
        } else {
            return null;
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
