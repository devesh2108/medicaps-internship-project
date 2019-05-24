/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import db.MydbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
@WebServlet(urlPatterns = {"/ChangePassword"})
public class ChangePassword extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        int count=0;
        String cur_pass=request.getParameter("cur_pass");
        String new_pass=request.getParameter("new_pass");
        String user=request.getParameter("user");
        try
        {
            if(user.equals("stu"))
            {
        Connection con=MydbConnection.getDbConnection();
            PreparedStatement pst = con.prepareStatement("Update student set pass=? where pass=?");
            pst.setString(1,new_pass);
            pst.setString(2,cur_pass);
            
            count=pst.executeUpdate();
            
            if(count>0)
            {
              
            request.setAttribute("res",(String)"Password Updated Sucessfully");
            RequestDispatcher rd=request.getRequestDispatcher("student_home.jsp");
            rd.forward(request,response);
            
            }  
                
            
            }
            else if(user.equals("fac"))
            {
            Connection con=MydbConnection.getDbConnection();
            PreparedStatement pst = con.prepareStatement("Update faculty set pass=? where pass=?");
            pst.setString(1,new_pass);
            pst.setString(2,cur_pass);
            count=pst.executeUpdate();
            if(count>0)
            {
            request.setAttribute("res",(String)"Password Updated Successfully");
            RequestDispatcher rd=request.getRequestDispatcher("faculty_home.jsp");
            rd.forward(request,response);
            }
            }
            else
            {
            Connection con=MydbConnection.getDbConnection();
            PreparedStatement pst = con.prepareStatement("Update admin set pass=? where pass=?");
            pst.setString(1,new_pass);
            pst.setString(2,cur_pass);  
            count=pst.executeUpdate();
            if(count>0)
            {
            request.setAttribute("res",(String)"Password updated Successfully");
            RequestDispatcher rd=request.getRequestDispatcher("admin_home.jsp");
            rd.forward(request,response);
            }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
       
    }

}
