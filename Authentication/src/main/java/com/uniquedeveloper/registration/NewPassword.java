package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password1");
		String confPassword = request.getParameter("confPassword");
		RequestDispatcher dispatcher = null;

		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
		    try {
		        Class.forName("com.mysql.jdbc.Driver");
		        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginpage", "root", "Pass@955234245");
		        PreparedStatement pst = con.prepareStatement("update user set password = ? where email = ? ");
		        pst.setString(1, newPassword);
		        pst.setString(2, (String) session.getAttribute("email"));

		        int rowCount = pst.executeUpdate(); // Execute only once
		        
		        if (rowCount > 0) {
		            request.setAttribute("status", "resetSuccess");
		        } else {
		            request.setAttribute("status", "resetFailed");
		        }

		        dispatcher = request.getRequestDispatcher("login.jsp");
		        dispatcher.forward(request, response);

		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		} else {
		    request.setAttribute("status", "passwordMismatch");
		    dispatcher = request.getRequestDispatcher("resetPassword.jsp"); // Redirect to reset if passwords don’t match
		    dispatcher.forward(request, response);
		}
	}
}
