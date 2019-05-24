<%-- 
    Document   : student_nav.jsp
    Created on : Dec 31, 2018, 4:33:06 PM
    Author     : HP
--%>


    <%@page import="dao.StudentDAO"%>
<%@page import="dto.NotificationBean"%>
<nav class="navbar navbar-dark bg-dark navbar-expand-sm">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="student_home.jsp"><img src="./img/index.jpg" height="40" width="50"></a>
                <div class="collapse navbar-collapse" id="Navbar">
                    <ul class="navbar-nav mr-auto">
                            <li class="nav-item "><a class="nav-link" href="student_home.jsp"><span class="fa fa-home fa-lg"></span> Home</a></li>
                            <li class="nav-item ">
                                    <div class="dropdown">
                                        <a class="nav-link" href="#"><span class="fa fa-list fa-lg"></span> Menu <span class="fa fa-caret-down"></span></a>
                                        <div class="dropdown-content">
                                          <a class="nav-item" href="student_form.jsp"><span class="fa fa-info fa-lg"></span> Enter Intership Details</a>
                                          <a class="nav-item" href="available_companies.jsp"><span class="fa fa-file"></span> Apply for Internships</a>
                                          <a href="reset_pass.jsp?user=stu"><span class="fa fa-cogs fa-lg"></span> Reset Password</a>
                                        </div>
                                    </div>
                            </li>
                            <li class="nav-item ">
                                    <div class="dropdown">
                                        <a class="nav-link"><span class="fa fa-globe fa-lg"></span> Notification <span class="badge badge-danger">
                                        <%  StudentDAO stud=new StudentDAO();
                                                    NotificationBean not=stud.fetchNotification((String)session.getAttribute("userid"));
                                                    if(not.getStatus()==1)
                                                    {
                                                       out.print("1"); 
                                                    }
                                                %>
                                            </span> </a>
                                        <div class="dropdown-content">
                                            <div class="row">
                                            <h6 class="row-content" style="padding: 20px">
                                                   <% if(not.getStatus()==1)
                                                    {
                                                       out.print(not.getInfo()); 
                                                    }
                                                %></h6>
                                            </div>
                                        </div>
                                    </div>
                            </li>
                            <li class="nav-item "><a class="nav-link" href="about_us.jsp"><span class="fa fa-users fa-lg"></span> About</a></li>
                            <li class="nav-item "><a class="nav-link" href="contact_us.jsp"><span class="fa fa-address-card fa-lg"></span> Contact</a></li>

                    </ul>
                    <form action="logout" method="post"> 
                        <span class="navbar-text">
                            <button class="btn btn-sm btn-primary" type="submit" value="Logout">LogOut <span class="fa fa-sign-out fa-lg"></span></button>
                        </span>
                    </form>
                </div>
            </div>
    </nav>

