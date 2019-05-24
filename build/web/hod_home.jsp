<%-- 
    Document   : hod_home
    Created on : Nov 26, 2018, 10:54:51 AM
    Author     : HP
--%>
<%@include file="header.jsp"%>
    <%
        response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
        
        if(session.getAttribute("userid")==null)
        {
            response.sendRedirect("index.jsp");
        }
    %>
    
<%@include file="faculty_nav.jsp"%>
    
    <div class="container-fluid">
        <center><h1 style="padding-top: 10px;"><b>Students and Internship Details</b></h1></center>
        <div class="row row-content">
            <div class="col-12 col-sm-2" style="padding-bottom: 10px;">
                <div class="card">
                    <center><h5 class="card-header bg-warning text-secondary">Filters <span class="fa fa-filter fa-lg"></span></h5></center>
                    <div class="card-body">
                        <form>
                            <div class="form-group">
                                <label for="drop1">Duration :</label>
                                <select class="form-control" name="duration">
                                    <option value="">Select Duration</option>
                                    <option value="1 month">1 month</option>
                                    <option value="2 month">2 month</option>
                                    <option value="3 month">3 month</option>
                                    <option value="4 month">4 month</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="drop1">Domain :</label>
                                <select class="form-control" name="domain">
                                    <option value="">Select Domain</option>
                                    <option value="data_analysis">Data Analysis</option>
                                    <option value="machine_learning">Machine Learning</option>
                                    <option value="web_development">Web Development</option>
                                    <option value="web_designing">Web Designing</option>
                                </select>
                            </div>
                            <div class="form-group" name="tool">
                                <label for="drop1">Tool :</label>
                                <select class="form-control" name="tool">
                                    <option value="">Select Tool</option>
                                    <option value="java">JAVA</option>
                                    <option value="c">C</option>
                                    <option value="c++">C++</option>
                                    <option value=".net">.NET</option>
                                    <option value="mean">MEAN Stack</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="drop1">Status :</label>
                                <select class="form-control" name="status">
                                    <option value="">Select Status</option>
                                    <option value="blocked">Blocked</option>
                                    <option value="unblocked">Unblocked</option>
                                </select>
                            </div>
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
                            <tr>
                                <th>Student Name</th>
                                <th>Student E.No.</th>
                                <th>Company Name</th>
                                <th>Company's Email</th>
                                <th>Company's Contact no</th>
                                <th>Internship duration</th>
                                <th>Domain</th>
                                <th>Tool</th>
                                <th>Certificate Image</th>
                                <th>Change Status</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
            </div>
        </div>
     </div>

<%@include file="footer.jsp"%>