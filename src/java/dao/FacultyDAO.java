package dao;

import db.MydbConnection;
import dto.FacultyBean;
import dto.InternshipDetailsBean;
import dto.NotificationBean;
import dto.StudentBean;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class FacultyDAO {
    
    public boolean isUserValid(FacultyBean fb)
    {
        boolean b=false;
        String userid=fb.getUserid();
        String pass=fb.getPass();
        try
        {
            Connection con=MydbConnection.getDbConnection();
            PreparedStatement pst=con.prepareStatement("select * from faculty where userid=? and pass=? ");
            pst.setString(1,userid);
            pst.setString(2,pass);
            ResultSet rs=pst.executeQuery();
            
            if(rs.isBeforeFirst())
            {
                b=true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return b;
    }
    public FacultyBean displayFaculty(String userid)
{
     FacultyBean ob=new FacultyBean();
    
    ArrayList <FacultyBean> faculty_list=new ArrayList<>();
    
      try
      {
      Connection con=MydbConnection.getDbConnection();
      PreparedStatement pst=con.prepareStatement("Select * from faculty where userid=?");
      pst.setString(1,userid);
      ResultSet rs=pst.executeQuery();
      while(rs.next())
      {
          ob.setUserid(userid);
          ob.setName(rs.getString("name"));
          ob.setPhno(rs.getString("phno"));
          ob.setSec(rs.getString("sec_alloted"));
          ob.setDept(rs.getString("dept"));
          
          faculty_list.add(ob);
      }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      return ob;
}   
    
    public List displayRecord(String sec_alloted)
{
    int i=0;
    String filepath="C:\\Users\\GAGAN\\Documents\\NetBeansProjects\\Internship_Portal\\web\\img\\uploads"; 
    
     List<InternshipDetailsBean>internship_list=new ArrayList<InternshipDetailsBean>();
      try
      {
      Connection con=MydbConnection.getDbConnection();
      PreparedStatement pst=con.prepareStatement("Select * from internship_details where sec=? and vstatus=0");
      pst.setString(1,sec_alloted);
      ResultSet rs=pst.executeQuery();
      while(rs.next())
      {

          InternshipDetailsBean ob=new InternshipDetailsBean();
          ob.setUserid(rs.getString("userid"));
          ob.setYear(rs.getString("year"));
          ob.setSemester(rs.getString("semester"));
          ob.setComp_name(rs.getString("comp_name"));
          ob.setDuration(rs.getString("duration"));
          ob.setSession(rs.getString("session"));
          ob.setComp_address(rs.getString("comp_address"));
          Blob certificate= rs.getBlob("certificate");
          ob.setImage(certificate);
          ob.setDomain(rs.getString("domain"));
          ob.setSkills(rs.getString("skills"));
          ob.setCont_name(rs.getString("cont_name"));
          ob.setCont_no(rs.getString("cont_no"));
          ob.setCont_email(rs.getString("cont_email"));
          ob.setVstatus(rs.getInt("vstatus"));
          ob.setName(rs.getString("stu_name"));
          internship_list.add(ob);
       
          i++;
      }
      i=i-1;
      }
        
      catch(Exception e)
      {
          e.printStackTrace();
      }
     
      return internship_list;
}
                
    public int notificationUpdate(String userid)
    { 
       
      int res=0;
        try
        {
        Connection con = MydbConnection.getDbConnection();  
      PreparedStatement pst=con.prepareStatement("update notification set info=?,"
                                                    + "status=? where userid=? ");
      
      pst.setString(1,"Your Details were Rejected, Please submit again.");
      pst.setInt(2,1);
      pst.setString(3,userid);
      
      int count=pst.executeUpdate();
      
      if(count>0)
      {
          res=1;
          
      }
        
      }
       catch(Exception e)
       {
           e.printStackTrace();
       }
        return res;
    }
    
    public int changeStatus(String userid,String session)
 { int res=0;
 
      try
      {
      
      Connection con=MydbConnection.getDbConnection();
      PreparedStatement pst1=con.prepareStatement("Update notification set status=?,info=? where userid=?");
      pst1.setInt(1,0);
      pst1.setString(2,"verified");
      pst1.setString(3,userid);
      pst1.executeUpdate();
      
      PreparedStatement pst=con.prepareStatement("Update internship_details set vstatus=1 where userid=? and session=?");
      pst.setString(1,userid);
      pst.setString(2,session);

      int count=pst.executeUpdate();
      if(count>0)
      {
          res=1;
      }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      return res;
 }
    
    public int rejectInternshipDetails(String userid,String session)
    {
        int res=0;
      try
      {
      Connection con=MydbConnection.getDbConnection();
      PreparedStatement pst=con.prepareStatement("Delete from internship_details where userid=? and session=?");
      pst.setString(1,userid);
      pst.setString(2,session);
      int count=pst.executeUpdate();
      if(count>0)
      {
          res=1;
      }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      return res;       
    }
    
    public List displayVerifiedStudents(String sec)
    {
        List<InternshipDetailsBean>internship_list=new ArrayList<InternshipDetailsBean>();
      try
      {
      Connection con=MydbConnection.getDbConnection();
      PreparedStatement pst=con.prepareStatement("Select * from internship_details where sec=? and vstatus=1");
      pst.setString(1,sec);
      ResultSet rs=pst.executeQuery();
      while(rs.next())
      {

          InternshipDetailsBean ob=new InternshipDetailsBean();
          ob.setUserid(rs.getString("userid"));
          ob.setYear(rs.getString("year"));
          ob.setSemester(rs.getString("semester"));
          ob.setComp_name(rs.getString("comp_name"));
          ob.setDuration(rs.getString("duration"));
          ob.setSession(rs.getString("session"));
          ob.setComp_address(rs.getString("comp_address"));
          Blob certificate= rs.getBlob("certificate");
          ob.setImage(certificate);
          ob.setDomain(rs.getString("domain"));
          ob.setSkills(rs.getString("skills"));
          ob.setCont_name(rs.getString("cont_name"));
          ob.setCont_no(rs.getString("cont_no"));
          ob.setCont_email(rs.getString("cont_email"));
          ob.setVstatus(rs.getInt("vstatus"));
          ob.setName(rs.getString("stu_name"));
          internship_list.add(ob);
       
             }
      }
        
      catch(Exception e)
      {
          e.printStackTrace();
      }
     
      return internship_list;
 
    }
        
}
