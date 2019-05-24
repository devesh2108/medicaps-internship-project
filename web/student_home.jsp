<%-- 
    Document   : home
    Created on : 21 Nov, 2018, 10:00:08 AM
    Author     : GAGAN
--%>


<%@page import="java.util.Base64"%>
<%@page import="javax.persistence.Convert"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.List"%>
<%@page import="dto.InternshipDetailsBean"%>
<%@page import="dto.StudentBean"%>
<%@page import="dao.StudentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<%@include file="header.jsp" %>

    <%
        response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
        
        if(session.getAttribute("userid")==null)
        {
            response.sendRedirect("index.jsp");
        }
     
    %>

<%@include file="student_nav.jsp" %>

    <div class="container">
        <center><h1><b>Student Profile</b></h1>
        <% String res=(String)request.getAttribute("res");
                      
                       if(res!=null)
                        {%>
            <font color="green"> <%out.print(res);%></font>
                        <%}%>
        </center>
        <% StudentDAO ob=new StudentDAO();
                           StudentBean stu=new StudentBean();
                           stu=ob.displayStudent((String)session.getAttribute("userid"));
                           List<InternshipDetailsBean> intern_list=ob.displayRecord((String)session.getAttribute("userid"));
                        %>
        <div class="col-12 col-sm-8 justify-content-center">
            <table style="font-size: 20px">
            <tr>
                <td><b>Enrollment number : <%out.println(stu.getUserid());%> </b></td>
            </tr>
            <tr>
                <td><b>Name : <%out.print(stu.getName());%> </b></td>
            </tr>
            <tr>
                <td><b>Phone number : <%out.print(stu.getPhno());%> </b></td>
            </tr>
            <tr>
                <td><b>Year of Passing : <%out.print(stu.getYear());%> </b></td>
            </tr>
            <tr>
                <td><b>Department : <%out.print(stu.getDept());%> </b></td>
            </tr>
            <tr>
                <td><b>Section : <%out.print(stu.getSec());%></b></td>
            </tr>
            <tr>
                <td><b>Email ID : <%out.print(stu.getEmail());%></b></td>
            </tr>
        </table>
        </div>
            
        <center><h3><b>Internship Details</b></h3></center>
    </div>
            <div class="container-fluid">
        <div class="col-12 col-auto justify-content-center">
        <table class="table table-bordered table-hover table-responsive">
            <thead class="thead-dark">
                <tr>
                    <th>Year</th>
                    <th>Semester</th>
                    <th>Internship Duration</th>
                    <th>Internship Session</th>    
                    <th>Domain</th>
                    <th>Technical skill</th>
                    <th>Certificate</th>
                    <th>Company Name</th> 
                    <th>Resource Person</th>
                    <th>Company Contact No</th>
                    <th>Email</th>
                    <th>Company Address</th>
                    <th>Verification Status</th>
                    </tr>
            </thead>
            <tbody>
                    <%  System.out.println(intern_list.size());
                        for (InternshipDetailsBean intern : intern_list)
                        {   
                            if(intern!=null)
                            {
                                String ses=intern.getSession();
                        %>
                     <tr>
                            <td><%out.print(intern.getYear());%></td>
                            <td><%out.print(intern.getSemester());%></td>
                             <td><%out.print(intern.getDuration());%></td>
                            <td><%out.print(intern.getSession());%></td>
                            <td><%out.print(intern.getDomain());%></td>
                            <td><%out.print(intern.getSkills());%></td>
                            <td><a href="displayImage?userid=<%=session.getAttribute("userid")%>&session=<%=ses%>"><img src="displayImage?userid=<%=session.getAttribute("userid")%>&session=<%=ses%>" height="60" width="60"></a></td>
                            <td><%out.print(intern.getComp_name());%></td>
                            <td><%out.print(intern.getCont_name());%></td>
                            <td><%out.print(intern.getCont_no());%></td>
                            <td><%out.print(intern.getCont_email());%></td>
                            <td><%out.print(intern.getComp_address());%></td>
                            <td><%int vstatus=intern.getVstatus();
                                    if(vstatus==0){ %>
                                    <center><span class="fa fa-ban fa-lg"> unverified</span></center>
                                    <% } else { %>
                                         <center><span class="fa fa-check-circle-o fa-lg"> verified</span></center>
                                   <% } %></td>     
                     </tr>
                     <%}
                    }%>
            </tbody>
        </table>
        </div>
    </div>

<%@include file = "footer.jsp"%>