<%-- 
    Document   : apply.jsp
    Created on : Jan 25, 2019, 6:55:07 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%@include file="student_nav.jsp"%>

<div class="container">
    <div class="col-12 col-sm-6 offset-sm-4">
        <h2 class="mt-2">Assessment Questions !!!</h2>
    </div>
    <form class="has-validation">
        <div class="col-12 col-sm-9 offset-sm-3 mb-3">
            <p><b>Why should you be hired for this internship?</b><br>
            Please answer this question carefully. It will increase your chances of getting hired.</p> 
            <textarea class="form-control col-sm-8" name="ques" rows="8" placeholder="Mention in detail what relevant skill or past experience you have for this internship. What excites you about this internship?" required></textarea>
        </div>
        <div class="row form-group">
            <label for="image" class="col-12 col-sm-2 offset-sm-3">Upload Resume :  </label>
            <input class="col-12 col-sm-2 form-control-flie" type="file" name="pic" accept="image/*" required>
        </div>
        <div class="col-12 col-sm-3 offset-sm-4 mb-3">
            <button class="form-control btn btn-primary">Submit</button>
        </div>
    </form>    
</div>
<%@include file="footer.jsp"%>