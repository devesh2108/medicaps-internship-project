/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.AdminDAO;
import dto.FilterBean;
import dto.InternshipApplicationBean;
import dto.InternshipDetailsBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author GAGAN
 */
@WebServlet(urlPatterns = {"/filter"})
public class filter extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            HttpSession session=request.getSession();
            String domain=request.getParameter("domain");
            
            String year=request.getParameter("year");
            
            String comp_name=request.getParameter("comp_name");
            
            String ch=request.getParameter("ch");
            
            List<InternshipDetailsBean>intern_list=(List<InternshipDetailsBean>)session.getAttribute("intern_list");
            AdminDAO admin=new AdminDAO();
            FilterBean filter=new FilterBean();
            
            filter.setDomain(domain);
            filter.setYear(year);
            filter.setComp_name(comp_name);
            List<InternshipDetailsBean>internship_list=admin.filterRecords(intern_list,filter);
            request.setAttribute("intern_list",internship_list);
            if(ch.equals("admin"))
            {
            RequestDispatcher rd=request.getRequestDispatcher("admin_home.jsp");
            rd.forward(request, response);
            }
            else if(ch.equals("unverified"))
            {
            RequestDispatcher rd=request.getRequestDispatcher("unverified_student.jsp");
            rd.forward(request, response);
            }
            else if(ch.equals("verified"))
            {
             RequestDispatcher rd=request.getRequestDispatcher("verified_student.jsp");
            rd.forward(request, response);   
            }
            }
}
