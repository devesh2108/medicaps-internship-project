<%-- 
    Document   : index
    Created on : 21 Nov, 2018, 9:31:25 AM
    Author     : GAGAN
--%>
<%@include file="header.jsp" %>

    <div class="container">
        <div class="col-12 col-sm-6 offset-sm-3" style="padding-bottom: 20px; padding-top: 10px">
            <div class="card">
                <center><h5 class="card-header bg-secondary text-white">Login <i class="fa fa-sign-in"></i> </h5></center>
                <div class="card-body">
                    
                    <form action="login" method="post" class="needs-validation">
                        <div class="form-group row justify-content-center">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="customRadioInline1" name="loginradio" class="custom-control-input" value="student" required>
                                    <label class="custom-control-label" for="customRadioInline1">Student Login</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="customRadioInline2" name="loginradio" class="custom-control-input" value="faculty" required>
                                    <label class="custom-control-label" for="customRadioInline2">Faculty Login/H.O.D. Login</label>
                                </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">User Id</label>
                            <input type="text" class="form-control" id="Inputid" aria-describedby="emailHelp" placeholder="Enter Id" name="userid" required>
                        </div>
                        <div class="form-group">
                            <label for="InputPassword1">Password</label>
                            <input type="password" class="form-control" id="InputPassword" placeholder="Password" name="pass" required>
                        </div>
                            <a href="#">Forgot password ?</a>
                            <center><button type="submit" class="btn btn-primary">Submit</button></center>
                    </form>
                </div>
            </div>
        </div>    
    </div>
    <div class="container">

    </div>
<%@include file="footer.jsp" %>