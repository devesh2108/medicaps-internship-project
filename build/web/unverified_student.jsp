<%-- 
    Document   : blocked_student
    Created on : Nov 25, 2018, 10:57:15 AM
    Author     : HP
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.List"%>
<%@page import="dto.InternshipDetailsBean"%>
<%@page import="dto.FacultyBean"%>
<%@page import="dao.FacultyDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%@include file="header.jsp"%>
    <%
        response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
        
        if(session.getAttribute("userid")==null)
        {
            response.sendRedirect("index.jsp");
        }
    %>

    <%@include file="faculty_nav.jsp"%>
                        <% FacultyDAO ob=new FacultyDAO();
                           FacultyBean faculty=new FacultyBean();
                           faculty=ob.displayFaculty((String)session.getAttribute("userid"));
                           String sec=faculty.getSec();
                           List<InternshipDetailsBean> intern_list=ob.displayRecord(sec);
                        
                           session.setAttribute("intern_list",intern_list);
                           String no_val=null;
                           if(request.getAttribute("intern_list")!=null)
                           intern_list=(List<InternshipDetailsBean>)request.getAttribute("intern_list");
                       
                        %>
    <div class="container-fluid">
        <center><h1 style="padding-top: 10px;"><b>Unverified Students</b></h1></center>
        <div class="row row-content">
            <div class="col-12 col-sm-2" style="padding-bottom: 10px;">
                <div class="card">
                    <center><h5 class="card-header bg-warning text-secondary">Filters <span class="fa fa-filter fa-lg"></span></h5></center>
                    <div class="card-body">
             
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
                                    
                                <input type="hidden" value="unverified" name="ch">      
                            </div>
                        
                            <div class="form-group">
                                <button class="btn btn-sm btn-primary" type="submit">Search</button>
                            </div>    
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-12 col-sm-10 justify-content-center" style="padding-bottom: 100px;">
                <div class="form-group">
                    <select name="state" id="maxRows" class="form-control" style="width:150px" >
                        <option value="100">show all</option>
                        <option value="1">5</option>
                        <option value="2">10</option>
                        <option value="3">25</option>
                        <option value="4">50</option>
                    </select>
                </div>
                <table class="table table-bordered table-hover table-responsive" id="mytable">
                            <thead class="thead-dark">
                            <tr>
                                <th>Session</th>
                                <th>Student Name</th>
                                <th>Student E.No.</th>
                                <th>Company Name</th>
                                <th>Company's Email</th>
                                <th>Company's Contact no</th>
                                <th>Internship duration</th>
                                <th>Domain</th>
                                <th>Skill</th>
                                <th>Certificate Image</th>
                                <th>Change Status</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody id="loop">
                        <%  System.out.println(intern_list.size());
                        for (InternshipDetailsBean intern : intern_list)
                        {   
                            if(intern!=null)
                            {
                                String userid=intern.getUserid();
                                String ses=intern.getSession();
                        %>
                     <tr class="list">
                            <td><%out.print(intern.getSession());%></td>
                            <td><%out.print(intern.getName());%></td>
                            <td><%out.print(intern.getUserid());%></td>
                            <td><%out.print(intern.getComp_name());%></td>
                            <td><%out.print(intern.getCont_email());%></td>
                            <td><%out.print(intern.getCont_no());%></td>
                            <td><%out.print(intern.getDuration());%></td>
                            <td><%out.print(intern.getDomain());%></td>
                            <td><%out.print(intern.getSkills());%></td>
                            <td><a href="displayImage?userid=<%=userid%>&session=<%=ses%>"><img src="displayImage?userid=<%=userid%>&session=<%=ses%>" height="60" width="60"></a></td>
                            <td><form action="verifyStudent" method="post">
                                    <button class="btn btn-success" type="submit">Verify</button>
                                <input type="hidden" name="eno" value="<%=intern.getUserid()%>">
                                <input type="hidden" name="session" value="<%=intern.getSession()%>">
                                </form></td>
                            <td><form action="rejectDetails" method="post">
                                    <button class="btn btn-danger" type="submit">Reject</button>
                                <input type="hidden" name="eno" value="<%=intern.getUserid()%>">
                                <input type="hidden" name="session" value="<%=intern.getSession()%>">
                                </form></td>   
                                
                     </tr>
                        <%}
                       }%>
                        </tbody>
                    </table>
                    <nav>
                        <ul class="pagination">
                            <li id="previous" class="page-item disabled">
                                <a class="page-link" href="javascript:void(0)" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                        </ul>
                    </nav>            
            </div>
        </div>
     </div>
    <script src="js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="js/style.js" type="text/javascript"></script>
<%@include file="footer.jsp"%>