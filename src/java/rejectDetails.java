/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.FacultyDAO;
import dto.InternshipDetailsBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GAGAN
 */
@WebServlet(urlPatterns = {"/rejectDetails"})
public class rejectDetails extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        response.setContentType("text/html;charset=UTF-8");
     
        
        String eno=request.getParameter("eno");
        String session=request.getParameter("session");
        FacultyDAO fac=new FacultyDAO();
        
        int res=fac.rejectInternshipDetails(eno,session);
        if(res==1)
        {
            int res1=fac.notificationUpdate(eno);
            if(res1==1)
            {
            request.setAttribute("res",(String)"Record Rejected");
            RequestDispatcher rd=request.getRequestDispatcher("faculty_home.jsp");
            rd.forward(request,response);
            }
            else
            {
            RequestDispatcher rd=request.getRequestDispatcher("faculty_home.jsp");
            rd.forward(request,response);
            }
        }
    }
    }




    

