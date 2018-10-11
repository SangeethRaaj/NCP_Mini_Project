/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import classes.ClassBean;
import classes.ClassDAO;
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
public class joinClassServlet extends HttpServlet {

    

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            if(session.getAttribute("User") == null){
                response.sendRedirect("index.jsp");
            }else{
                UserBean ub = (UserBean)  session.getAttribute("User");
                ClassBean cb = new ClassBean();
                cb.setClassId(request.getParameter("ClassId"));
                cb.setUserName(ub.getUserName());
                status s = ClassDAO.joinClass(ub, cb);
                response.sendRedirect("participant.jsp?status="+s.Message);
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
