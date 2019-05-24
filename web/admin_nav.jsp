<%-- 
    Document   : admin_nav
    Created on : Jan 8, 2019, 12:39:50 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <nav class="navbar navbar-dark bg-dark navbar-expand-sm">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="#"><img src="./img/index.jpg" height="40" width="50"></a>
                <div class="collapse navbar-collapse" id="Navbar">
                    <ul class="navbar-nav mr-auto">
                            <li class="nav-item"><a class="nav-link" href="admin_home.jsp"><span class="fa fa-home fa-lg"></span> Home</a></li>
                            <li class="nav-item">
                                    <div class="dropdown">
                                        <a class="nav-link" href="#"><span class="fa fa-list fa-lg"></span> Menu <span class="fa fa-caret-down"></span></a>
                                        <div class="dropdown-content">
                                          <a href="company_details.jsp"><span class="fa fa-building fa-lg"></span> Enter Company Details</a>
                                          <a href="view_comp_details_admin.jsp"><span class="fa fa-check-circle-o fa-lg"></span> View Companies</a>
                                          <a href="applied_student_admin.jsp"><span class="fa fa-file fa-lg"></span> View Appied Students</a>
                                          <a href="reset_pass.jsp"><span class="fa fa-cogs fa-lg"></span> Reset Password</a>
                                        </div>
                                    </div>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="#"><span class="fa fa-group fa-lg"></span> About</a></li>
                    </ul>
                    <form action="logout" method="post"> 
                        <span class="navbar-text">
                            <button class="btn btn-sm btn-primary" type="submit" value="Logout">LogOut <span class="fa fa-sign-out fa-lg"></span></button>
                        </span>
                    </form>
                </div>
            </div>
        </nav>
