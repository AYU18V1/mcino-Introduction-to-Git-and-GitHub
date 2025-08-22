package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		if(name == null || name.equals("")) {
			request.setAttribute("status", "invalidname");
			dispatcher = request.getRequestDispatcher("signup.jsp");
			dispatcher.forward(request, response);
		}
		if(email == null || email.equals("")) {
			request.setAttribute("status", "invalidemail");
			dispatcher = request.getRequestDispatcher("signup.jsp");
			dispatcher.forward(request, response);
		}
		if(password == null || password.equals("")) {
			request.setAttribute("status", "invalidpassword");
			dispatcher = request.getRequestDispatcher("signup.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginpage","root","Pass@955234245");
			PreparedStatement pst = con.prepareStatement("insert into user(name,email,password) values(?,?,?) ");
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, password);
	
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("signup.jsp");
			if(rowCount > 0 ) {
				request.setAttribute("status", "success");
				
			} else {
				request.setAttribute("status", "failed");
			}
			
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		 
	}

}
