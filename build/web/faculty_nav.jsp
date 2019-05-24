<%-- 
    Document   : faculty_nav.jsp
    Created on : Dec 31, 2018, 4:35:55 PM
    Author     : HP
--%>

    <nav class="navbar navbar-dark bg-dark navbar-expand-sm">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="#"><img src="./img/index.jpg" height="40" width="50"></a>
                <div class="collapse navbar-collapse" id="Navbar">
                    <ul class="navbar-nav mr-auto">
                            <li class="nav-item "><a class="nav-link" href="faculty_home.jsp"><span class="fa fa-home fa-lg"></span> Home</a></li>
                            <li class="nav-item">
                                    <div class="dropdown">
                                        <a class="nav-link" href="#"><span class="fa fa-list fa-lg"></span> Menu <span class="fa fa-caret-down"></span></a>
                                        <div class="dropdown-content">
                                          <a href="unverified_student.jsp"><span class="fa fa-ban fa-lg"></span> Unverified Student List</a>
                                          <a href="verified_student.jsp"><span class="fa fa-check-circle-o fa-lg"></span> Verified Student List</a>
                                          <a href="hod_home.jsp"><span class="fa fa-cog fa-lg"></span> Setting</a>
                                          <a href="reset_pass.jsp?user=fac"><span class="fa fa-cogs fa-lg"></span> Reset Password</a>
                                        </div>
                                    </div>
                            </li>
                            <li class="nav-item "><a class="nav-link" href="#"><span class="fa fa-users fa-lg"></span> About</a></li>
                    </ul>
                    <form action="logout" method="post"> 
                        <span class="navbar-text">
                            <button class="btn btn-sm btn-primary" type="submit" value="Logout">LogOut <span class="fa fa-sign-out fa-lg"></span></button>
                        </span>
                    </form>
                </div>
            </div>
        </nav>
