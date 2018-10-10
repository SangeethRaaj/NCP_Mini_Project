/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginn;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sangeeth
 */
public class SignUpServlet extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
           try{
                UserBean user = new UserBean();
                user.setUserName(request.getParameter("emailid"));
                user.setPassword(request.getParameter("pwd"));
                user.setRollNo(request.getParameter("rno"));
                user.setName(request.getParameter("fname")+" "+request.getParameter("lname"));
                user = UserDAO.signup(user);
                if(user.isValid()){
                    HttpSession session = request.getSession(true);
                    session.setMaxInactiveInterval(30*60); // timeout in 30 minutes
                    session.setAttribute("valida", true);
                    session.setAttribute("User",user); 
                    response.sendRedirect("index.jsp?status=signedup");
                }else{
                    response.sendRedirect("index.jsp?status=signupfailed");
                }
           }catch(Exception e){
               System.out.println(e);
           }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
