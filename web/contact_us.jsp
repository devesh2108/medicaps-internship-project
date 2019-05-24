<%-- 
    Document   : contact_us
    Created on : 21 Jan, 2019, 8:39:37 PM
    Author     : Dimple Sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%@include file="student_nav.jsp"%>

<br>
<div class="container">
    <center><h1><b>Contact Us</b></h1></center>
    <br>
 
    
    <div class="row row-content offset-sm-3">
        <div class="col-12 col-sm-3">
            <img src="img/visit.png" height="90" width="90">
            <br>
            <h5>Visit Us</h5>
            <br>
            Medi-Caps University
            <br>
            A.B. Road,Pigdambar
            <br>
            Indore (M.P.)
            <br>
        </div>
        <div class="col-12 col-sm-3">
            <img src="img/call.png" height="90" width="90">
            <br>
            <h5>Call Us</h5>
            <br>
            0731-4259500
            <br>
            0731-4259555
        </div>
        <div class="col-12 col-sm-3">
            <img src="img/mail.png" height="90" width="90">
            <br>
            <h5>Mail Us</h5>
            <br>
            info@medicaps-institute.ac.in
            <br>
        </div>
        
    </div>
    <hr>
    <hr>
    
     <div class="col-12 col-sm-8 offset-sm-2" style="padding-bottom: 20px; padding-top: 10px">    
            <div class="card">
                <center><h5 class="card-header bg-secondary text-white"><b>Send Us Your Feedback</b></h5></center>
                <div class="card-body">
                    <form action="login" method="post" class="needs-validation">
                        
                        <div class="form-group">
                            <label for="emailid">Email Id</label>
                            <input type="email" class="form-control" id="Emailid" placeholder="Enter your email Id" name="emailid">
                        </div>
                        <div class="form-group">
                            <label for="mno">Contact Number</label>
                            <input type="text" class="form-control" id="mno" placeholder="Enter Contact no" name="mno" >
                        </div>
                        <div class="form-group">
                            <label for="feedback">Feedback</label>
                            <textarea class="form-control" id="feedback" placeholder="Enter Feedback Here" name="feedback" rows="6"></textarea>
                        </div>
                            
                            <center><button type="submit" class="btn btn-primary">Submit</button></center>
                    </form>
                </div>
            </div>
        </div>    
    
    
</div>
<br>
<br>



<%@include file="footer.jsp"%>