/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import db.MydbConnection;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GAGAN
 */
@WebServlet(urlPatterns = {"/displayImage"})
public class displayImage extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
            String userid=request.getParameter("userid");
            String session=request.getParameter("session");
            
            try
            {
                Connection con=MydbConnection.getDbConnection();
                PreparedStatement pst=con.prepareStatement("Select certificate from internship_details where userid=? and session=?");
                        pst.setString(1,userid);
                        pst.setString(2,session);
                ResultSet rs=pst.executeQuery();
                while(rs.next())
                {
                 Blob cert=rs.getBlob("certificate");
                 byte cert_data[]=cert.getBytes(1,(int)cert.length());   
                 response.setContentType("image/gif");   
                 OutputStream out=response.getOutputStream();
                 out.write(cert_data);
                 out.flush();
                 out.close();
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
    }
}
