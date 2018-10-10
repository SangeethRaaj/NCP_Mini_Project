/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginn;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
        try{
             UserBean user = new UserBean();
             user.setUserName(request.getParameter("emailid"));
             user.setPassword(request.getParameter("pwd"));
             user = UserDAO.login(user);
             if (user.isValid()){
                  HttpSession session = request.getSession(true);
                  session.setMaxInactiveInterval(30*60); // timeout in 30 minutes
                  session.setAttribute("valida", true);
                  session.setAttribute("User",user); 
                  response.sendRedirect("index.jsp"); //logged-in page      		
             }
               else 
                  response.sendRedirect("index.jsp?status=f");
             //error page 
        } 
        catch (Throwable theException){
             System.out.println(theException); 
        }
    }
}