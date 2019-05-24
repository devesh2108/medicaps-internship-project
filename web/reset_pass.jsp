<%-- 
    Document   : reset_pass.jsp
    Created on : Jan 21, 2019, 8:03:48 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<div class="container">
    <div class="col-12 col-sm-6 offset-sm-4">
        <h2 class="mt-2 mb-2">Change Password !!!</h2>
    </div>
    <%String user=request.getParameter("user");%>
    <div class="col-12 col-sm-6 offset-sm-3" style="padding-top:20px">
        <form action="ChangePassword" method="post" class="has-validation mb-5">
            <div class="row form-group">
                <label for="password" class="col-12 col-sm-4">Current Password : </label>
                <input class="form-control col-12 col-sm-5" onkeyup="validate()" id="pass" type="password" placeholder="Enter Current Password" name="cur_pass" required> 
                <span class="col-12 col-sm-3" id="match"></span>
            </div>
            <div class="row form-group">
                <label for="repassword" class="col-12 col-sm-4">Re-Enter Password : </label>
                <input class="form-control col-12 col-sm-5" onkeyup="validate()" id="rpass" type="password" placeholder="Re-enter Current Password" required> 
                <span class="col-12 col-sm-3" id="rmatch"></span>
            </div>
            <div class="row form-group">
                <label for="newpassword" class="col-12 col-sm-4">New Password : </label>
                <input class="form-control col-12 col-sm-5" type="password" onkeyup="validate1()" id="newpass" placeholder="Enter New Password" required> 
                <span class="col-12 col-sm-3" id="newmatch"></span>
            </div>
            <div class="row form-group">
                <label for="newpassword" class="col-12 col-sm-4">Re-Enter New Password : </label>
                <input class="form-control col-12 col-sm-5" type="password" onkeyup="validate1()" id="rnewpass" placeholder="Re-Enter New Password" name="new_pass" required>
                <span class="col-12 col-sm-3" id="rnewmatch"></span>
            </div>
            <input type="hidden" value="<%=user%>" name="user">
            <center><button class="btn btn-primary" type="submit">Submit</button></center>
        </form>
    </div>
</div>

        <script>
        function validate()    
        {
            var pass=document.getElementById("pass");
            var rpass=document.getElementById("rpass");
        if(pass.value==="")
        {
            var match=document.getElementById("match");
            match.innerHTML="Fill Password";
            match.style.color="red";
        }
        else
        {
           var match=document.getElementById("match");
           match.innerHTML="";
        }
         if(rpass.value==="")
        {
            var rmatch=document.getElementById("rmatch");
            rmatch.innerHTML="Re-Fill Password";
            rmatch.style.color="red";
        }
        else
        {
               if(pass.value===rpass.value)
               {
            var rmatch=document.getElementById("rmatch");
            rmatch.innerHTML="Password matched";
            rmatch.style.color="green";
               }
               else
               {
            var rmatch=document.getElementById("rmatch");
            rmatch.innerHTML="Password not matched";
            rmatch.style.color="blue";
               }
        }   
        }
        </script>

        <script>
        function validate1()    
        {
            var pass=document.getElementById("newpass");
            var rpass=document.getElementById("rnewpass");
        if(pass.value==="")
        {
            var match=document.getElementById("newmatch");
            match.innerHTML="Fill Password";
            match.style.color="red";
        }
        else
        {
           var match=document.getElementById("newmatch");
           match.innerHTML="";
        }
         if(rpass.value==="")
        {
            var rmatch=document.getElementById("rnewmatch");
            rmatch.innerHTML="Re-Fill New Password";
            rmatch.style.color="red";
        }
        else
        {
               if(pass.value===rpass.value)
               {
            var rmatch=document.getElementById("rnewmatch");
            rmatch.innerHTML="New Password matched";
            rmatch.style.color="green";
               }
               else
               {
            var rmatch=document.getElementById("rnewmatch");
            rmatch.innerHTML="New Password not matched";
            rmatch.style.color="blue";
               }
        }   
        }
        </script>



<%@include file="footer.jsp"%>