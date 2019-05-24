/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.AdminDAO;
import dao.FacultyDAO;
import dao.StudentDAO;
import dto.AdminBean;
import dto.FacultyBean;
import dto.StudentBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
@WebServlet(urlPatterns = {"/login"})
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        String userid=request.getParameter("userid");
        String pass=request.getParameter("pass");
        String user=request.getParameter("loginradio");
        if(user.equals("student"))
        {
            StudentBean ob=new StudentBean();
            ob.setUserid(userid);
            ob.setPass(pass);
            StudentDAO stu=new StudentDAO();
            
            if(stu.isUserValid(ob)==true)
            {   
                HttpSession session=request.getSession();
                session.setAttribute("userid",userid);
                response.sendRedirect("student_home.jsp");
            }
            else
            {
                response.sendRedirect("index.jsp");
            }
        }
        else if(user.equals("faculty"))
        {
            AdminBean ad=new AdminBean();
            ad.setUserid(userid);
            ad.setPass(pass);
            AdminDAO admin=new AdminDAO();
            
            FacultyBean fb=new FacultyBean();
            fb.setUserid(userid);
            fb.setPass(pass);
            FacultyDAO faculty=new FacultyDAO();
            
            if(admin.isUserValid(ad)==true)
            {   
                HttpSession session=request.getSession();
                session.setAttribute("userid",userid);
                response.sendRedirect("admin_home.jsp");
            }
          else if(faculty.isUserValid(fb)==true)
            {
                HttpSession session=request.getSession();
                session.setAttribute("userid",userid);
                response.sendRedirect("faculty_home.jsp");
            }
            else
            {
                response.sendRedirect("index.jsp");
            }
        }
        else
        {
            response.sendRedirect("index.jsp");
        }
    }
    }

