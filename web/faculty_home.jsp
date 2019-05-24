<%-- 
    Document   : faculty_home
    Created on : 24 Nov, 2018, 4:43:51 PM
    Author     : GAGAN
--%>

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
                           String sec=faculty.getSec();
                           faculty=ob.displayFaculty((String)session.getAttribute("userid"));
                           List<InternshipDetailsBean> intern_list=ob.displayRecord(sec);
                        %>
    <div class="container">
        <center><h1 style="padding-top: 10px;"><b>Faculty Profile</b></h1>
        <% String res=(String)request.getAttribute("res");
                      
                       if(res!=null)
                        {
                            %><font color="green">
                            <%out.print(res);}%>
                              </font>
                        </center>
        <div class="row row-content">
            <div class="col-12 col-sm-8 justify-content-center" style="padding-bottom: 100px; padding-top:20px;">
                <table style="font-size: 20px">
                    <tr>
                        <td><b>Id. Number : </b><%out.print(faculty.getUserid());%></td>
                    </tr>
                    <tr>
                        <td><b>Name : </b><%out.print(faculty.getName());%></td>
                    </tr>
                    <tr>
                        <td><b>Phone number : </b><%out.print(faculty.getPhno());%></td>
                    </tr>
                    <tr>
                        <td><b>Section Alotted: </b><%out.print(faculty.getSec());%></td>
                    </tr>
                    <tr>
                        <td><b>Department : </b><%out.print(faculty.getDept());%></td>
                    </tr>
                </table>
            </div>
        </div>

    </div>
<%@include file="footer.jsp"%>