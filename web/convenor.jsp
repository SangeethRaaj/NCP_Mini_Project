<%-- 
    Document   : convenor.jsp
    Created on : Oct 4, 2018, 11:29:42 AM
    Author     : Sangeeth
--%>


<%@page import="classes.ClassDAO"%>
<%@page import="classes.ClassBean"%>
<%@page import="loginn.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<html>
    <head>
        <title>
            Attendance manager
        </title>
        <link rel="stylesheet" type="text/css" href="css/main.css"/>
        <link rel="stylesheet" type="text/css" href="css/sidenav.css"/>
        <link rel="stylesheet" type="text/css" href="css/table.css"/>
        <link rel="stylesheet" type="text/css" href="css/radio.css"/>
        <link rel="stylesheet" type="text/css" href="./css/login.css"/>
        <link rel="stylesheet" type="text/css" href="css/newClass.css"/>
        <script src = "http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="js/dist/js/datepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/dist/css/datepicker.min.css"/>
        <script src="js/dist/js/i18n/datepicker.en.js"></script>
    </head>
    <body>
        <div class="header">
            <h2>Attendance Manager</h2>
        </div>

        <%!
            UserBean u = null;
            String un = null;
            ArrayList<ClassBean> a = null;
            ArrayList<UserBean> pp = null;
            String cc = "", una = "";
            Set<String> ss = new HashSet<String>();
        %>
        <%
            if (request.getParameter("status") != null) {
                out.print("<script type=\"text/javascript\">alert(\"" + request.getParameter("status") + "\");document.getElementById(\"lbt\").click();</script>");
            }
            if (session.getAttribute("User") == null) {
        %>

        <div id="loginn" class="modal">
            <div class="modal-content">
                <div class="form">
                    <ul class="tab-group">
                        <li class="tab active"><a href="#login">Log In</a></li>
                        <li class="tab"><a href="#signup">Sign Up</a></li>
                    </ul>

                    <div class="tab-content">
                        <div id="login">   
                            <h1>Welcome Back!</h1>

                            <form id='logina' name='logina' action="login" method="post" onsubmit="validateLoginForm()">

                                <div class="field-wrap">
                                    <label>
                                        Email Address<span class="req">*</span>
                                    </label>
                                    <input name = 'emailid' type="email"required autocomplete="off"/>
                                </div>

                                <div class="field-wrap">
                                    <label>
                                        Password<span class="req">*</span>
                                    </label>
                                    <input name='pwd' type="password"required autocomplete="off"/>
                                </div>

                                <p class="forgot"><a href="#">Forgot Password?</a></p>

                                <button name = 'loginButton' class="button button-block"/>Log In</button>

                            </form>

                        </div>

                        <div id="signup">   
                            <h1>Sign Up for Free</h1>
                            <form id='signupf' name = 'signupf' action="signup" method="post">
                                <div class="top-row">
                                    <div class="field-wrap">
                                        <label>
                                            First Name<span class="req">*</span>
                                        </label>
                                        <input id='' name ='fname' type="text" required autocomplete="off" />
                                    </div>

                                    <div class="field-wrap">
                                        <label>
                                            Last Name<span class="req">*</span>
                                        </label>
                                        <input name='lname' type="text"required autocomplete="off"/>
                                    </div>
                                </div>

                                <div class="field-wrap">
                                    <label>
                                        Email Address<span class="req">*</span>
                                    </label>
                                    <input name ='emailid' type="email" required autocomplete="off"/>
                                </div>

                                <div class="field-wrap">
                                    <label>
                                        Roll No.<span class="req">*</span>
                                    </label>
                                    <input name='rno' type="text" required autocomplete="off"/>
                                </div>

                                <div class="field-wrap">
                                    <label>
                                        Set A Password<span class="req">*</span>
                                    </label>
                                    <input name='pwd' type="password"required autocomplete="off"/>
                                </div>

                                <button name = 'signUpButton' type="submit" class="button button-block"/>Get Started</button>

                            </form>

                        </div>

                    </div>
                </div> 
            </div>
        </div>

        <% }

        %>
        <div id="navbar">
            <a  href="index.jsp">ATTMan</a>
            <a href="participant.jsp">Participant</a>
            <a class="active" href="convenor.jsp">Convenor</a>
            <a href="about_us.jsp">About Us</a>
            <div class="topnav-right">

                <%                    if (session.getAttribute("User") == null) {
                %>
                <a><button id="lbt">Login</button></a>
                <% } else {
                    u = (UserBean) session.getAttribute("User");
                    un = u.getUserName();
                    a = ClassDAO.getClasses(u);
                %>
                <a><button id="logout" onclick="location.href = 'logout'" >Logout as <%=u.getName()%></button></a>
                <%}
                %>
            </div>
        </div>
        <div class="content">
            <div id = "sidenav">
                <button class="tablink" onclick="opentab('clas', this)" id="defaultOpen">Classes</button>
                <button class="tablink" onclick="opentab('attendance', this)">Attendance</button>
                <button class="tablink" onclick="opentab('report', this)">Report</button>
            </div>
            <div class="main">
                <div id="clas" class="tabcontent">
                    <button id = "newClassbtn">New Class</button>
                    <div id="newClassForm">
                        <form action="newClass" method="post">
                            <div class="field-wrap">
                                <label>
                                    Class Name<span class="req">*</span>
                                </label>
                                <input name='className' type="text" required />
                            </div>
                            <button name = 'newClass' type="submit" class="button button-block"/>Create</button>
                        </form>
                    </div>

                    <table class="tabula">
                        <thead>
                            <tr>
                                <th>ClassID</th>
                                <th>Course</th>
                                <th>No. of Students</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <td colspan="4">
                                    <div class="links"><a href="#">&laquo;</a> <a class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">&raquo;</a></div>
                                </td>
                            </tr>
                        </tfoot>
                        <tbody>

                            <%
                                for (ClassBean cla : a) {

                                    ss.add(cla.getClassId());
                            %>
                            <tr>
                                <td><%=cla.getClassId()%></td>
                                <td><%=cla.getName()%></td>
                                <td>-</td>
                                <td><button onclick="javascript:void(0)">View/Modify</button><button onclick="javascript:void(0)">Delete</button></td>
                            </tr>
                            <%
                                }

                            %>

                            <c:forEach var="cla" items="${a}">
                                <tr>
                                    <td>${cla.getClassId()}</td>
                                    <td>${cla.getName()}</td>
                                    <td>-</td>
                                    <td><button onclick="javascript:void(0)">View/Modify</button><button onclick="javascript:void(0)">Delete</button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div id="attendance" class="tabcontent">

                    <%                            
                        if (request.getParameter("classId") == null) {
                            cc = "";
                        } else {
                    
                            cc = request.getParameter("classId");
                            if (ss.contains(cc)) {
                                pp = ClassDAO.getParticipants(cc);
                                
                            } else {
                                cc = "";
                            }
                        }
                    %>

                    <form id = "ff1" method="GET" action="convenor.jsp">
                        <label for='classId'>
                            Class : 
                        </label>
                        <select name='classId' onchange="document.getElementById('ff1')">
                            <% for (ClassBean aa : a) {
                            %>
                            <option title='<%=aa.getName()%>' value='<%=aa.getClassId()%>'<% if (cc.equals(aa.getName())) {
                                        out.print("selected=\"true\"");
                                    }%>><%=aa.getName()%></option>
                            <%}
                            %>
                        </select>
                        <input name = 'selectClass' type = 'submit' value = 'Select Class'/>
                        <br>
                    </form>

                    <form method="POST" action="addAttendance">
                        <input name = 'classId' type = 'text' value = '<%=cc%>' hidden="true"/>
                        <label for='sTime'>
                            From : 
                        </label>
                        <input name='sTime' type='text'  class="datepicker-here" data-timepicker="true" data-position="right top" />

                        <label for='eTime'>
                            to : 
                        </label>
                        <input name='eTime' type='text' class="datepicker-here" data-timepicker="true" data-position="right top" />

                        <table class="tabula">
                            <thead>
                                <tr>
                                    <th>Student R.no</th>
                                    <th>Name</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <td colspan="3">
                                        <div class="links"><a href="#">&laquo;</a> <a class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">&raquo;</a></div>
                                    </td>
                                </tr>
                            </tfoot>
                            <tbody>

                                <% if (!cc.equals("")) {
                                        for (UserBean ub : pp) {
                                            una = ub.getUserName();

                                %>
                                <tr>
                                    <td><%=ub.getRollNo()%></td>
                                    <td><%=ub.getName()%></td>
                                    <td> 
                                        <div class='vertical-align'>
                                            <div class='btns'>
                                                <label>
                                                    <input checked='' name='<%= una%>' type='radio' value='present'>
                                                    <span class='btn first'>Present</span>
                                                    </input>
                                                </label>
                                                <label>
                                                    <input name='<%= una%>' type='radio' value='onduty'>
                                                    <span class='btn'>On-Duty</span>
                                                    </input>
                                                </label>
                                                <label>
                                                    <input name='<%= una%>' type='radio' value='absent'>
                                                    <span class='btn last'>Absent</span>
                                                    </input>
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>    
                                <%
                                        }
                                    }
                                %>


                            </tbody>
                        </table>
                        <input name='attsubmit' type="submit" value='submit'>
                    </form>
                </div>
                <div id="report" class="tabcontent">
                        <label for='classId'>
                            Class : 
                        </label>
                        <select name='classId' onchange="ChangeStud()">
                            <option title='ML' value='15CSE401'>ML</option>
                            <option title='NCP' value='15CSE402'>NCP</option>
                            <option title='IOT' value='15CSE403'>IOT</option>
                        </select><br>

                    <label for='from_time'>
                        From : 
                    </label>
                    <input name='from_time' type='text'  class="datepicker-here" data-timepicker="true" data-position="right top" />

                    <label for='to_time'>
                        to : 
                    </label>
                    <input name='to_time' type='text' class="datepicker-here" data-timepicker="true" data-position="right top" />

                    <table class="tabula">
                        <thead>
                            <tr>
                                <th>Student R.no</th>
                                <th>Name</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <td colspan="3">
                                    <div class="links"><a href="#">&laquo;</a> <a class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">&raquo;</a></div>
                                </td>
                            </tr>
                        </tfoot>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>PersonA</td>
                                <td> 
                                    <div class='vertical-align'>
                                        <div class='btns'>
                                            <label>
                                                <input checked='' name='att1' type='radio' value='present'>
                                                <span class='btn first'>Present</span>
                                                </input>
                                            </label>
                                            <label>
                                                <input name='att1' type='radio' value='onduty'>
                                                <span class='btn'>On-Duty</span>
                                                </input>
                                            </label>
                                            <label>
                                                <input name='att1' type='radio' value='absent'>
                                                <span class='btn last'>Absent</span>
                                                </input>
                                            </label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>PersonB</td>
                                <td> 
                                    <div class='vertical-align'>
                                        <div class='btns'>
                                            <label>
                                                <input checked='' name='att2' type='radio' value='present'>
                                                <span class='btn first'>Present</span>
                                                </input>
                                            </label>
                                            <label>
                                                <input name='att2' type='radio' value='onduty'>
                                                <span class='btn'>On-Duty</span>
                                                </input>
                                            </label>
                                            <label>
                                                <input name='att2' type='radio' value='absent'>
                                                <span class='btn last'>Absent</span>
                                                </input>
                                            </label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>PersonC</td>
                                <td> 
                                    <div class='vertical-align'>
                                        <div class='btns'>
                                            <label>
                                                <input checked='' name='att3' type='radio' value='present'>
                                                <span class='btn first'>Present</span>
                                                </input>
                                            </label>
                                            <label>
                                                <input name='att3' type='radio' value='onduty'>
                                                <span class='btn'>On-Duty</span>
                                                </input>
                                            </label>
                                            <label>
                                                <input name='att3' type='radio' value='absent'>
                                                <span class='btn last'>Absent</span>
                                                </input>
                                            </label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <input name='cancel' type="reset" value='Cancel'>
                    <input name='attsubmit' type="submit" value='Modiffy'>
                    <input name='GenerateReport' type='submit' value="Generate Report">
                    </form>    
                </div>
            </div>
        </div>
        
        <script  type="text/javascript" src="js/convenor_tabs.js"></script>
        <script type="text/javascript" src="js/login-pop.js"></script>
        <script type="text/javascript" src="js/newclass.js"></script>
        <script src = "js/signup_or_login.js"></script>
        
        <% 
            if(cc!=""){
        out.println("<script type='text/javascript'>opentab('attendance', this);</script>");
            }
        %>
    </body>
</html>