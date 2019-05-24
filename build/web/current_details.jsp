<%-- 
    Document   : student_form.jsp
    Created on : Nov 24, 2018, 2:18:37 PM
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
    
    <%@include file="student_nav.jsp"%>

    <div class="container">
        <div class="col-12 col-sm-8 offset-sm-2" style="padding-top: 20px; padding-bottom: 50px;">            
            <center><h2 class="ml-3 col-autos"><b>Enter Internship Details!!!</b></h2></center>

            <form action="studentController" method="post" class="was-validation" enctype="multipart/form-data">
                <div class="row form-group">
                        <label for="Year" class="col-12 col-sm-4 align-self-center">Year :</label>
                            <select id="Year" class="form-control col-12 col-sm-6">
                                <option>Select Year</option>
                                <option>I Year</option>
                                <option>II Year</option>
                                <option>III Year</option>
                                <option>IV Year</option>
                            </select>
                </div>
                <div class="row form-group">
                            <label for="Semester" class="col-12 col-sm-4 align-self-center">Semester :</label>
                            <select id="Semester" class="form-control col-12 col-sm-6">
                                <option>Select Semester</option>
                                <option>Even</option>
                                <option>Odd</option>
                            </select>
                </div>
                <div class="row form-group">
                            <label for="CGPA" class="col-12 col-sm-4 align-self-center">CGPA :</label>
                            <input class="form-control col-12 col-sm-6" type="text" placeholder="Enter CGPA">
                </div>
                <div class="row form-group">
                            <label for="SGPA" class="col-12 col-sm-4 align-self-center">SGPA :</label>
                            <input class="form-control col-12 col-sm-6" type="text" placeholder="Enter SGPA">
                </div>
                <div class="row form-group">
                            <label for="Technical Skills" class="col-12 col-sm-4 align-self-center">Technical Skills :</label>
                            <select id="Technical Skills" class="form-control col-12 col-sm-6">
                                <option>Select your skills</option>
                                <option>C</option>
                                <option>C++</option>
                                <option>Auto CAD</option>
                                <option>Robotics</option>
                                <option>Coding</option>
                            </select>
                </div>
                <div class="row form-group">
                            <label for="Area of intrest" class="col-12 col-sm-4 align-self-center">Area of Intrest :</label>
                            <select id="Area of intrest" class="form-control col-12 col-sm-6">
                                <option>Select your skills</option>
                                <option>Web Development</option>
                                <option>Processing</option>
                                <option>Telecom</option>
                                <option>Transmission & Distribution</option>
                                <option>Construction</option>
                                <option>R&D</option>
                            </select>
                        <div class="invalid-feedback">Example invalid custom select feedback</div>
                </div>
                <div class="row form-group">
                            <label for="Company Name" class="col-12 col-sm-4 align-self-center">Applied to :</label>
                            <input class="form-control col-12 col-sm-6" type="text" placeholder="Enter Company Name ">
                </div>
                <div class="row form-group">
                            <label for="Name of Resource Person" class="col-12 col-sm-4 align-self-center">Name of Resource Person :</label>
                            <input class="form-control col-12 col-sm-6" type="text" placeholder="Enter Name of Resource Person ">
                </div>
                <div class="row form-group">
                            <label for="Contact of resource person" class="col-12 col-sm-4 align-self-center">Contact no. of Resource Person :</label>
                            <input class="form-control col-12 col-sm-6" type="text" placeholder="Enter Contact of Resource Person ">
                </div>
                <div class="row form-group">
                            <label for="Email of Resource Person" class="col-12 col-sm-4 align-self-center">Email of Resource Person :</label>
                            <input class="form-control col-12 col-sm-6" type="email" placeholder="Enter Email of Resource Person ">
                </div>
                <div class="row form-group">
                            <label for="CompanyAddress" class="col-12 col-sm-4 align-self-center">Company Address :</label>
                            <textarea class="form-control col-12 col-sm-6" id="CompanyAddress" rows="3" placeholder="Enter Address of Company"></textarea>
                </div>
                <div class="row form-group">
                            <label for="Duration of internship" class="col-12 col-sm-4 align-self-center">Duration of Internship :</label>
                            <input class="form-control col-12 col-sm-6" type="text" placeholder="Enter Duration of Internship">
                </div>
                <div class="row form-group">
                            <label for="Internship Session" class="col-12 col-sm-4 align-self-center">Internship Session</label>
                            <select id="Internship Session" class="form-control col-12 col-sm-6">
                                <option selected>Select Session</option>
                                <option>January 2019</option>
                                <option>June-August 2019</option>
                            </select>
                </div>
                <div class="row justify-content-center">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-warning">Reset</button>
                </div>
            </form>
        </div>
    </div>

    <%@include file="footer.jsp" %>%>