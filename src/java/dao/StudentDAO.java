

package dao;

import static com.sun.org.apache.xerces.internal.xinclude.XIncludeHandler.BUFFER_SIZE;
import db.MydbConnection;
import dto.CompanyDetailsBean;
import dto.InternshipApplicationBean;
import dto.InternshipDetailsBean;
import dto.NotificationBean;
import dto.StudentBean;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Part;


public class StudentDAO {
     
    public boolean isUserValid(StudentBean ob)
    {   
        boolean b=false;
        String userid=ob.getUserid();
        String pass=ob.getPass();
        {
        try
        {
            Connection con=MydbConnection.getDbConnection();
            PreparedStatement pst=con.prepareStatement("Select * from student where userid=? and pass=?");
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
        }
        return b;
    }
    
   
    
    public int addStudentDetails(InternshipDetailsBean ob)
    {
        InternshipDetailsBean obj=new InternshipDetailsBean();
        int i=0;
        String year=ob.getYear();
        String semester=ob.getSemester();
        String userid=ob.getUserid();
        String comp_name=ob.getComp_name();
        String duration=ob.getDuration();
        String session=ob.getSession();
        String domain=ob.getDomain();
        String skills=ob.getSkills();
        String cont_name=ob.getCont_name();
        String cont_no=ob.getCont_no();
        String cont_email=ob.getCont_email();
        String comp_address=ob.getComp_address();
        Part certificate=ob.getCertificate();
        String sec=null;
        String name=null;
        int vstatus=0;
        InputStream intern_certificate=null;
        try
        {
            
            
            Connection con=MydbConnection.getDbConnection();
            PreparedStatement pst1=con.prepareStatement("Select name, sec from student where userid=?");
            pst1.setString(1,userid);
            ResultSet rs1=pst1.executeQuery();
            while(rs1.next())
            {
                obj.setSec(rs1.getString("sec"));
                sec=rs1.getString("sec");
                name=rs1.getString("name");
            }
            
            PreparedStatement pst=con.prepareStatement("Insert into internship_details values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            
            if(certificate!=null)
            {
            intern_certificate=certificate.getInputStream();    
            }
            
            System.out.println(intern_certificate);

            pst.setString(1,null);
            pst.setString(2,userid);
            pst.setString(3,year);
            pst.setString(4,semester);
            pst.setString(5,sec);
            pst.setString(6,comp_name);
            pst.setString(7,duration);
            pst.setString(8,session);
            if(intern_certificate!=null)
            pst.setBlob(9,intern_certificate);
            pst.setString(10,comp_address);
            pst.setString(11,domain);
            pst.setString(12,skills);
            pst.setString(13,cont_name);
            pst.setString(14,cont_no);
            pst.setString(15,cont_email);
            pst.setInt(16,vstatus);
            pst.setString(17,name);
            int count=pst.executeUpdate();
          
            if(count>0)
            {
                i=1;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        System.out.println(i);
        return i;
    }
    
    public StudentBean displayStudent(String userid)
{
     StudentBean ob=new StudentBean();
     InternshipDetailsBean ib=new InternshipDetailsBean();
    ArrayList <StudentBean> student_list=new ArrayList<>();
    
      try
      {
      Connection con=MydbConnection.getDbConnection();
      PreparedStatement pst=con.prepareStatement("Select * from student where userid=?");
      pst.setString(1,userid);
      ResultSet rs=pst.executeQuery();
      while(rs.next())
      {
          ob.setUserid(userid);
          ob.setPhno(rs.getString("phno"));
          ob.setName(rs.getString("name"));
          ob.setEmail(rs.getString("email"));
          ob.setYear(rs.getString("year"));
          ob.setSec(rs.getString("sec"));
          ob.setDept(rs.getString("dept"));
          student_list.add(ob);
      }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      return ob;
}
    
   public NotificationBean fetchNotification(String userid)
   {
       NotificationBean ob=new NotificationBean();
       try
       {
           Connection con=MydbConnection.getDbConnection();
           PreparedStatement pst=con.prepareStatement("Select * from notification where userid=?");
           pst.setString(1,userid);
           ResultSet rs=pst.executeQuery();
           while(rs.next())
           {
               ob.setUserid(rs.getString("userid"));
               ob.setInfo(rs.getString("info"));
               ob.setStatus(rs.getInt("status"));
           }
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       return ob;
   }
    
  public List fetchCompanyList()
  {
      
      ArrayList<CompanyDetailsBean>comp_list=new ArrayList<CompanyDetailsBean>();
      try
      {
          Connection con=MydbConnection.getDbConnection();
           PreparedStatement pst=con.prepareStatement("Select * from comp_details");
 
           ResultSet rs=pst.executeQuery();
           while(rs.next())
           {
             CompanyDetailsBean comp=new CompanyDetailsBean();
             comp.setComp_id(rs.getInt("comp_id"));
             comp.setComp_name(rs.getString("comp_name"));
             comp.setComp_address(rs.getString("comp_address"));
             comp.setCont_no(rs.getString("cont_no"));
             comp.setDomain(rs.getString("domain"));
             comp.setDuration(rs.getString("duration"));
             comp.setEmail(rs.getString("email"));
             comp.setSkills(rs.getString("skills"));
             comp.setStart_date(rs.getString("start_date"));
             comp.setVacancy(rs.getInt("vacancy"));
             comp_list.add(comp);
           }
           
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      
      return comp_list;
  }
 
 public CompanyDetailsBean fetchCompanyDetails(int comp_id)
 {
     CompanyDetailsBean comp=new CompanyDetailsBean();
     try
      {
           Connection con=MydbConnection.getDbConnection();
           PreparedStatement pst=con.prepareStatement("Select * from comp_details where comp_id=?");
           pst.setInt(1,comp_id);
 
           ResultSet rs=pst.executeQuery();
           while(rs.next())
           {
             comp.setComp_id(rs.getInt("comp_id"));
             comp.setComp_name(rs.getString("comp_name"));
             comp.setComp_address(rs.getString("comp_address"));
             comp.setCont_no(rs.getString("cont_no"));
             comp.setDomain(rs.getString("domain"));
             comp.setDuration(rs.getString("duration"));
             comp.setEmail(rs.getString("email"));
             comp.setSkills(rs.getString("skills"));
             comp.setStart_date(rs.getString("start_date"));
             comp.setVacancy(rs.getInt("vacancy"));
             
           }
           
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
     return comp;
 }
 public List displayRecord(String userid)
{
    int i=0;
    String filepath="C:\\Users\\GAGAN\\Documents\\NetBeansProjects\\Internship_Portal\\web\\img\\uploads"; 
    
     List<InternshipDetailsBean>internship_list=new ArrayList<InternshipDetailsBean>();
      try
      {
      Connection con=MydbConnection.getDbConnection();
      PreparedStatement pst=con.prepareStatement("Select * from internship_details where userid=?");
      pst.setString(1, userid);
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

public int addApplicationDetails(InternshipApplicationBean ob)
{
    int res=0;
    try
    {
        Connection con=MydbConnection.getDbConnection();
        PreparedStatement pst=con.prepareStatement("Insert into internship_application values(?,?,?,?,?,?,?)");    
        pst.setString(1,ob.getUserid());
        pst.setString(2,ob.getName());
        pst.setString(3,ob.getComp_name());
        pst.setString(4,ob.getDept());
        pst.setString(5,ob.getYear());
        pst.setString(6,ob.getSec());
        pst.setString(7,ob.getEmail());
        
        int count=pst.executeUpdate();
        if(count>0)
            res=1;
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    return res;
}
}

    

