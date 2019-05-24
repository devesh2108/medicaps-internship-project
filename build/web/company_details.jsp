<%-- 
    Document   : company_details
    Created on : Jan 3, 2019, 8:38:05 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%@include file="admin_nav.jsp"%>
        <div class="container" id="company_internship_detail">
            <br>
            <center><h3><b>Company Internship Details !!!</b></h3></center>
            <form action="CompanyDetails" method="post" class="has-validation" id="textform" style="padding-top: 20px;padding-bottom: 20px;">

                <div class="form-group row justify-content-center">
                    <label for="Name" class="col-12 col-sm-3">Name :</label>
                    <input class="form-control col-12 col-sm-6" type="text" placeholder="Enter Company Name" name="comp_name" required>
                </div>  

                <div class="form-group row justify-content-center">
                    <label for="Address" class="col-12 col-sm-3">Address :</label>
                    <textarea class="form-control col-12 col-sm-6" id="Address" rows="3" placeholder="Enter Address of Company" name="comp_address" required></textarea>
                </div>

                <div class="form-group row justify-content-center">
                        <label for="Contact " class="col-12 col-sm-3">Contact Number :</label>
                        <input class="form-control col-12 col-sm-6" type="text" placeholder="Enter Contact Number of Company " name="cont_no" required>
                </div>

                <div class="form-group row justify-content-center">
                        <label for="Email" class="col-12 col-sm-3">Email :</label>
                        <input class="form-control col-12 col-sm-6" type="email" placeholder="Enter Email of Company" name="email" required>
                </div>

                <div class="form-group row justify-content-center">
                        <label for="Domain" class="col-12 col-sm-3">Domain :</label>
                        <select id="Domain" class="form-control col-12 col-sm-6" name="domain" required>
                            <option selected>Select domain</option>
                            <option>Web Development</option>
                            <option>Processing</option>
                            <option>Telecom</option>
                            <option>Transmission & Distribution</option>
                            <option>Construction</option>
                            <option>R&D</option>
                            
                        </select>
                </div>
                <div class="form-group row justify-content-center">
                        <label for="Vacancy" class="col-12 col-sm-3">Number of Vacancies :</label>
                        <input class="form-control col-12 col-sm-6" type="text" placeholder="Enter no. of vacancies" name="vacancy" required>
                </div>

                <div class="form-group row justify-content-center">
                        <label for="Duration" class="col-12 col-sm-3">Duration :</label>
                        <input class="form-control col-12 col-sm-6" type="text" placeholder="Enter Duration of internship" name="duration" required>
                </div>

                <div class="form-group row justify-content-center">
                        <label for="StartDate" class="col-12 col-sm-3">Start Date :</label>
                        <input class="form-control col-12 col-sm-6" type="text" placeholder="Enter Start date of internship" name="start_date" required>
                </div>
                <div class="form-group row justify-content-center" id="textdiv">
                        <label class="col-12 col-sm-3" id="textlabel">Skills Required :</label>
                        <textarea class="form-control col-12 col-sm-6" type="text" placeholder="Enter Required Skills" name="skills" required></textarea>
                     <!--   <input class="form-control col-12 col-sm-6"  type="text" placeholder="Enter Required Skills" name="skills"> -->
                </div>
  <!--              <div class="row offset-sm-10">
                <input type="button" class="btn btn-success" value="Add Skill" id="textbtn" onclick="addfield()">
                </div>
    -->            <div class="row justify-content-center" style="padding-top: 10px">
                        <button type="submit" class="btn btn-primary mr-1">Submit</button>
                        <button type="reset" class="btn btn-warning">Reset</button>
                </div>
            </form>
        </div>
        <!--<script>
            function addfield(){
                var di=document.getElementById("textdiv");
                di.innerHTML+='<input class="form-control col-12 col-sm-6 offset-sm-3" style="padding-top: 5px" id="child" type="text" placeholder="Enter required skills"><input type="button" id="child1" class="btn btn-danger btn-sm" value="-" id="textrbtn" onclick="removefield()">'+"";
                di.append(di);
            }
            function removefield(){
                var ch1=document.getElementById("child1")
                var ch=document.getElementById("child")
                var di=document.getElementById("textdiv");
                di.removeChild(ch);
                di.removeChild(ch1);
            }

        </script>
-->
<%@include file="footer.jsp"%>