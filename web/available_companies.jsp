<%-- 
    Document   : student_view_internships
    Created on : 5 Jan, 2019, 7:44:45 PM
    Author     : Dimple Sharma
--%>

<%@page import="java.util.List"%>
<%@page import="dto.CompanyDetailsBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="student_nav.jsp" %>

<div class="container">
    <div class="col-12 col-sm-8 offset-sm-2" style="padding-top: 20px; padding-bottom: 10px;">            
        <center><h2 class="ml-3 col-autos"><b>Available Internships!!!</b></h2></center>
    </div>
        <%StudentDAO student=new StudentDAO();
        List <CompanyDetailsBean>comp_list=student.fetchCompanyList();%>
    <div class="col-sm-7 offset-sm-2" style="padding-bottom: 10px">
        <%     for (CompanyDetailsBean comp : comp_list)
               {   
                if(comp!=null)
                {
        %>
        <div class="card mb-2" id="student_view_internship" >
            <a href="available_company_details.jsp?comp_id=<%=comp.getComp_id()%>"> <h3 class="card-header text-dark" style="background-color: skyblue">
                <span class="fa fa-info-circle fa-lg">
                    <% out.print(comp.getComp_name());%>
                </span></h3>
            </a>
            <div class="card-body">
                <div class="row">
                    <div class="col-6 col-sm-3 row-content justify-content-center">
                        <a href="available_company_details.jsp"><img src="img/company.png" height="100px" width="125px"></a>
                    </div>
                    <div class="col-6 col-sm-7 row-content justify-content-center">
                        <table class="table table-borderless table-sm text-center">
                            <tr>
                                <th>Domain : </th>
                                <td> <%out.print(comp.getDomain());%> </td>
                            </tr>
                            <tr>
                                <th>Start date : </th>
                                <td><%out.print(comp.getStart_date());%></td>
                            </tr>
                            <tr>
                                <th>Duration : </th>
                                <td><%out.print(comp.getDuration());%></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
                            <%}
                            }%>
    </div>
</div>
<br>
<br>


<%@include file = "footer.jsp"%>