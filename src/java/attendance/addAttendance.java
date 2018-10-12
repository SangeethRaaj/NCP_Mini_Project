/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package attendance;

import classes.ClassBean;
import classes.ClassDAO;
import conn.status;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class addAttendance extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        if(session.getAttribute("User") == null){
            response.sendRedirect("index.jsp");
        }else{
            UserBean ub = (UserBean)  session.getAttribute("User");
            
            ClassBean cb = new ClassBean();
            cb.setClassId(request.getParameter("classId"));
            String sTime = request.getParameter("sTime");
            String eTime = request.getParameter("eTime");
            
            status s = ClassDAO.addSlot(ub, cb, sTime, eTime);
            
            String Slotno; 
            
            if(s.st){
                Slotno = s.Message;
                
                ArrayList<UserBean> u = new ArrayList<UserBean>();
                u = ClassDAO.getParticipants(request.getParameter("ClassId"));
                ArrayList<String> unames = new ArrayList<String>();
                ArrayList<String> statuses = new ArrayList<String>();
                for(UserBean ubu : u){
                    String j = ubu.getUserName();
                    String sj = request.getParameter(j);
                    unames.add(j);
                    statuses.add(sj);
                }
                String iq2 = "INSERT INTO `attendancelist`(`SlotNo`, `StudentId`, `AttendanceStatus`) VALUES ";
                for(int i = 0;i<unames.size();i++){
                    iq2 = iq2 + "(" + Slotno + ",'"+ unames.get(i) + "','"+statuses.get(i)+ "'),";
                }
                iq2 = iq2.substring(0, iq2.length()-1) + ";";
                
                
                
                response.sendRedirect("convenor.jsp?status="+s.Message);
            }
            else{
                response.sendRedirect("convenor.jsp?status="+s.Message);
            }
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
