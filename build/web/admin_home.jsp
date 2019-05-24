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
        <center><h1 style="padding-top: 10px;"><b>Admin Profile</b></h1>
                              <% String res=(String)request.getAttribute("res");
                      
                       if(res!=null)
                        {
                            %><font color="green">
                            <%out.print(res);}%>
                            </font>
                        </center>
        <div class="row row-content">
            <%
                AdminBean admin=new AdminBean();
                AdminDAO obj=new AdminDAO();
                admin=obj.getAdminDetails();
            %>
            <div class="col-12 col-sm-8 justify-content-center" style="padding-bottom: 50px; padding-top:20px;">
                <table style="font-size: 20px;">
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
                <div class="card">
                    <center><h5 class="card-header bg-warning text-secondary">Filters <span class="fa fa-filter fa-lg"></span></h5></center>
                    <div class="card-body">
                        <% AdminDAO ob=new AdminDAO();
                           List<InternshipDetailsBean> intern_list=ob.displayRecord();
                           session.setAttribute("intern_list",intern_list);
                           String no_val=null;
                           if(request.getAttribute("intern_list")!=null)
                           intern_list=(List<InternshipDetailsBean>)request.getAttribute("intern_list");
                           
                        %>
                       
                        <form action="filter" method="post">
                       
                            <div class="form-group">
                                <label for="drop1">Year</label>
                                <select class="form-control" name="year">
                                    <option value=<%=no_val%>>Select Year</option>
                                    <option>I year</option>
                                    <option>II year</option>
                                    <option>III year</option>
                                    <option>IV year</option>
                                    
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="drop1">Domain :</label>
                                <select class="form-control" name="domain">
                               <option value=<%=no_val%>>Select Domain</option>
                                    <option>Web Development</option>
                                    <option>Processing</option>
                                    <option>Telecom</option>
                                    <option>Transmission & Distribution</option>
                                    <option>Construction</option>
                                    <option>R&D</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="drop1">Company Name</label>
                                <select class="form-control" name="comp_name">
                                    <option value=<%=no_val%>>Select Company Name</option>
                                    <option>TCS</option>
                                    <option>Infosys</option>
                                    <option>Universal Informatics</option>
                                    <option>Systematix Infotech</option>
                                    <option>Pi Technology</option>
                                    <option>TEKPRENUER TECHNOLOGIES</option>

                                </select>
                            </div>
                           <input type="hidden" value="admin" name="ch"> 
                            <div class="form-group">
                                <button class="btn btn-sm btn-primary" type="submit">Search</button>
                            </div>    
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-12 col-sm-10 justify-content-center" style="padding-bottom: 100px;">
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