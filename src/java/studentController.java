/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.StudentDAO;
import dto.InternshipDetailsBean;
import dto.StudentBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig(maxFileSize = 16177215)
/**
 *
 * @author GAGAN
 */
@WebServlet(urlPatterns = {"/studentController"})
public class studentController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        HttpSession session_obj=request.getSession();
        String year=request.getParameter("year");
        String semester=request.getParameter("semester");
        String duration=request.getParameter("duration");
        String session=request.getParameter("session");
        String domain=request.getParameter("domain");
        String skills=request.getParameter("skills");
        Part certificate=request.getPart("certificate");
        String comp_name=request.getParameter("comp_name");
        String cont_name=request.getParameter("cont_name");
        String comp_no=request.getParameter("cont_no");
        String cont_email=request.getParameter("cont_email");
        String comp_address=request.getParameter("comp_address");
        
        
        InternshipDetailsBean obj=new InternshipDetailsBean();
        StudentBean s=new StudentBean();
        obj.setUserid((String)session_obj.getAttribute("userid"));
        obj.setYear(year);
        obj.setSemester(semester);
        obj.setDuration(duration);
        obj.setSession(session);
        obj.setDomain(domain);
        obj.setSkills(skills);
        obj.setComp_name(comp_name);
        obj.setCont_name(cont_name);
        obj.setCont_no(comp_no);
        obj.setCont_email(cont_email);
        obj.setComp_address(comp_address);
        obj.setSec(s.getSec());
        if(certificate!=null)
        {
         obj.setCertificate(certificate);  
        }
        
        
        StudentDAO stu=new StudentDAO();
        int res=stu.addStudentDetails(obj);
        if(res==1)
        {
            request.setAttribute("res",(String)"Records Added Successfully");
            RequestDispatcher rd=request.getRequestDispatcher("student_home.jsp");
            rd.forward(request,response);
        }
    }
}
