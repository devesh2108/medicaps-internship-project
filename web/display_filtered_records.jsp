<%-- 
    Document   : display_filtered_records
    Created on : 10 Jan, 2019, 10:40:35 AM
    Author     : GAGAN
--%>

<%-- 
    Document   : admin_home.jsp
    Created on : Jan 8, 2019, 12:36:52 PM
    Author     : HP
--%>

<%@page import="java.util.List"%>
<%@page import="dto.InternshipDetailsBean"%>
<%@page import="dao.AdminDAO"%>
<%@page import="dto.AdminBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <%@include file="header.jsp"%>
 <%
        response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
        
        if(session.getAttribute("userid")==null)
        {
            response.sendRedirect("index.jsp");
        }
    %>
    
    <%@include file="admin_nav.jsp"%>
    
    <div class="container">
        <center><h1 style="padding-top: 10px;"><b>Filtered Records</b></h1>
                            <font color="green">
                              </font>
                        </center>
        <div class="row row-content">
            <%
                AdminBean admin=new AdminBean();
                AdminDAO obj=new AdminDAO();
                admin=obj.getAdminDetails();
            %>
            <div class="col-12 col-sm-8 justify-content-center" style="padding-bottom: 50px; padding-top:20px;">
                <table style="font-size: 20px">
                    <tr>
                        <td><b>User id:</b></td>
                        <td><%out.print(admin.getUserid());%></td>
                    </tr>
                    <tr>
                        <td><b>Name: </b></td>
                        <td><%out.print(admin.getAdmin_name());%></td>
                    </tr>
                    <tr>
                        <td><b>Phone No: </b></td>
                        <td><%out.print(admin.getAdmin_no());%></td>
                    </tr>
                    <tr>
                        <td><b>Email: </b></td>
                        <td><%out.print(admin.getAdmin_email());%></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
        <div class="container-fluid">
                <div class="row row-content">
            <div class="col-12 col-sm-2" style="padding-bottom: 10px;">
              
                        <% AdminDAO ob=new AdminDAO();
                           List<InternshipDetailsBean> intern_list=ob.displayRecord();
                           intern_list=(List<InternshipDetailsBean>)session.getAttribute("internship_list");
                           String no_val=null;
                        %>
                         
                           
            </div>

            <div class="col-12 col-sm-9 justify-content-center" style="padding-bottom: 100px;">
                        <table class="table table-bordered table-hover table-responsive">
                            <thead class="thead-dark">
                            <tr>   <th>Session</th>
                                <th>Student Name</th>
                                <th>Student E.No.</th>
                                <th>Company Name</th>
                                <th>Company's Email</th>
                                <th>Company's Contact no</th>
                                <th>Internship duration</th>
                                <th>Domain</th>
                                <th>Skill</th>
                                <th>Certificate Image</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                                                <%  
                        for (InternshipDetailsBean intern : intern_list)
                        {   
                            if(intern!=null)
                            {
                                String userid=intern.getUserid();
                                String ses=intern.getSession();
                        %>
                            <tr>  <td><%out.print(intern.getSession());%></td>
                            <td><%out.print(intern.getName());%></td>
                            <td><%out.print(intern.getUserid());%></td>
                            <td><%out.print(intern.getComp_name());%></td>
                            <td><%out.print(intern.getCont_email());%></td>
                            <td><%out.print(intern.getCont_no());%></td>
                            <td><%out.print(intern.getDuration());%></td>
                            <td><%out.print(intern.getDomain());%></td>
                            <td><%out.print(intern.getSkills());%></td>
                            <td><a href="displayImage?userid=<%=userid%>&session=<%=ses%>"><img src="displayImage?userid=<%=userid%>&session=<%=ses%>" height="60" width="60"></a></td>
                            <td><form action="rejectDetails" method="post">
                                    <button class="btn btn-danger" type="submit">Remove</button>
                                <input type="hidden" name="eno" value="<%=intern.getUserid()%>">
                                <input type="hidden" name="session" value="<%=intern.getSession()%>">
                                </form></td>
                            </tr>
                             <%}
                       }%>
                        </tbody>
                    </table>
            </div>
        </div>
  
    </div>
<%@include file="footer.jsp"%>