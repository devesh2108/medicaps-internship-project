<%-- 
    Document   : view_comp_admin
    Created on : Jan 8, 2019, 12:43:53 PM
    Author     : HP
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="admin_nav.jsp" %>

<div class="container">
    <div class="col-12 col-sm-8 offset-sm-2" style="padding-top: 20px; padding-bottom: 10px;">            
        <center><h2 class="ml-3 col-autos"><b>Companies for Internships !!!</b></h2></center>
    </div>
    
      <div class="col-sm-7 offset-sm-2">
        <div class="card" id="student_view_internship">
                 <a href="view_comp_details_admin.jsp?comp_id="> <h3 class="card-header text-dark" style="background-color: skyblue">
                        Company <span class="fa fa-info-circle fa-lg"></span></h3></a>
            <div class="card-body">
                <div class="row">
                    <div class="col-6 col-sm-2 row-content justify-content-center">
                        <a href="view_comp_details_admin.jsp"><img src="img/company.png" height="110px" width="125px"></a>
                    </div>
                    <div class="col-6 col-sm-6 row-content justify-content-center">
                        <table class="table table-borderless table-sm text-center mt-2">
                            <tr>
                                <th>Domain : </th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>Start date : </th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>Duration : </th>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-12 col-sm-3 offset-sm-1 row-content" style="padding-top: 30px">
                        <form action="" method="">
                            <button class="btn btn-danger" type="submit">Remove</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<br>


<%@include file = "footer.jsp"%>