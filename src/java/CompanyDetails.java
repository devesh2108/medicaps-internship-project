/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import dao.AdminDAO;
import dto.CompanyDetailsBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
@WebServlet(urlPatterns = {"/CompanyDetails"})

public class CompanyDetails extends HttpServlet {

        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
           AdminDAO admin=new AdminDAO();
           
            String comp_name=request.getParameter("comp_name");
            String comp_address=request.getParameter("comp_address");
            String cont_no=request.getParameter("cont_no");
            String email=request.getParameter("email");
            String domain=request.getParameter("domain");
            int vacancy=Integer.parseInt(request.getParameter("vacancy"));
            String duration=request.getParameter("duration");
            String start_date=request.getParameter("start_date");
            String skills=request.getParameter("skills");
            
            CompanyDetailsBean ob=new CompanyDetailsBean();
            ob.setComp_name(comp_name);
            ob.setComp_address(comp_address);
            ob.setCont_no(cont_no);
            ob.setEmail(email);
            ob.setDomain(domain);
            ob.setVacancy(vacancy);
            ob.setDuration(duration);
            ob.setStart_date(start_date);
            ob.setSkills(skills);
            
           int res=admin.addCompanyDetails(ob);
           if(res==1)
           {
            request.setAttribute("res",(String)"Company Details inserted Successfully");
            RequestDispatcher rd=request.getRequestDispatcher("admin_home.jsp");
            rd.forward(request,response);
           }
    }
}

    




