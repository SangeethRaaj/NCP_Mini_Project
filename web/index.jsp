<%-- 
    Document   : index.jsp
    Created on : Oct 3, 2018, 10:39:46 AM
    Author     : Sangeeth
--%>


<%@page import="loginn.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head
        <title>
            Attendance manager
        </title>
        <link rel="stylesheet" type="text/css" href="css/main.css"/>
        <link rel="stylesheet" type="text/css" href="./css/login.css"/>
        <script src = "http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <div class="header">
            <h2>Attendance Manager</h2>
        </div>
        
        <%!
            UserBean u = null;
        %>
        <%  
            if(request.getParameter("status") != null){
            if(request.getParameter("status").equals("f"))
                out.print("<script type=\"text/javascript\">alert(\"Login Invalid:-)\");document.getElementById(\"lbt\").click();</script>");
        }
            if(session.getAttribute("User") == null){
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
                            <form id='signupf' name = 'signupf' action="" method="post">
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
            <a class="active" href="javascript:void(0)">ATTMan</a>
            <a href="participant.jsp">Participant</a>
            <a href="convenor.jsp">Convenor</a>
            <a href="about_us.jsp">About</a>
           
            <div class="topnav-right">
                
        <%
            if(session.getAttribute("User") == null){
        %>
                <a><button id="lbt">Login</button></a>
        <% }
            else{
                u = (UserBean)session.getAttribute("User");
                u.getUserName();
        %>
        <a><button id="logout" onclick="location.href = 'logout'" >Logout as <%=u.getName()%></button></a>
        <%}
        %>
            </div>
        </div>
        <div class="content">
            
        </div>
            
        <%
        
        %>
        <script  type="text/javascript" src="js/main.js"></script>
        <script type="text/javascript" src="js/login-pop.js"></script>
        <script src = "js/signup_or_login.js"></script>
    </body>
