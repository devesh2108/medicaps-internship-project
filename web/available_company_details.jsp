<%-- 
    Document   : available_company_details.jsp
    Created on : Jan 5, 2019, 10:04:36 PM
    Author     : HP
--%>

<%@page import="java.util.List"%>
<%@page import="dto.CompanyDetailsBean"%>
<%@include file="header.jsp"%>
<%@include file="student_nav.jsp" %>

<div class="container">
    <div>
        <%
        String userid=(String)session.getAttribute("userid");
        StudentDAO student=new StudentDAO();
        int comp_id=Integer.parseInt(request.getParameter("comp_id"));
        System.out.println("comp_id="+comp_id);
        CompanyDetailsBean comp=student.fetchCompanyDetails(comp_id);
        String comp_name=comp.getComp_name();
         %>
            <div class="col-12 col-sm-10 offset-sm-1" style="padding-bottom: 10px; padding-top: 20px">
                <div class="card">
                    <div class="card-body">
                        
                        <h3><%out.print(comp.getComp_name());%></h3>
                        <p class="mb-0">
                            <span> Location : </span> 
                            <span><%out.print(comp.getComp_address());%></span> 
                        </p>
                        <p>
                            <span> Contact : </span> 
                            <span><%out.print(comp.getCont_no());
                                    out.print("\t"+comp.getEmail());%>
                            </span> 
                        </p>

                        <table class="table table-sm table-borderless">
                                <th>Start Date</th>
                                <th>Duration</th>
                                <th>Domain</th>
                                <tr>
                                    <td><%out.print(comp.getStart_date());%></td>
                                    <td><%out.print(comp.getDuration());%></td>
                                    <td><%out.print(comp.getDomain());%></td>
                                </tr>
                        </table>
                        <p>
                            <span><b>#Number of Vacancies : </b></span>
                            <span><%out.print(comp.getVacancy());%></span>
                        </p>
                        <p>
                            <span><b>#Skills Required : </b></span>
                            <span><%out.print(comp.getSkills());%></span>
                        </p>
                        <form action="InternshipApplication" method="post">
                            <div class="form-group">
                                <input type="hidden" value="<%=userid%>" name="userid">
                                <input type="hidden" value="<%=comp_name%>" name="comp_name">
                                <center><button class="btn btn-sm btn-primary " type="submit">Apply Now</button></center>
                            </div>    
                        </form>
                    </div>
                </div>
            </div>
    </div>
</div>
<%@include file="footer.jsp"%>