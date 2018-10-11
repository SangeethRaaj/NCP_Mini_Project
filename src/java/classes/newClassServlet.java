/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import conn.status;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import loginn.UserBean;

/**
 *
 * @author Sangeeth
 */
public class newClassServlet extends HttpServlet {

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("User") == null){
            response.sendRedirect("index.jsp");
        }else{
            UserBean ub = (UserBean)  session.getAttribute("User");
            
            ClassBean cb = new ClassBean();
            cb.setName(request.getParameter("className"));
            cb.setUserName(ub.getUserName());
            
            status s = ClassDAO.addClass(ub, cb);
            
            if(s.st){
                response.sendRedirect("convenor.jsp?status="+s.Message);
            }
            else{
                response.sendRedirect("convenor.jsp?status="+s.Message);
            }
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
