/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author GAGAN
 */
public class AdminBean implements java.io.Serializable{
    
    private String userid;
    private String admin_name;
    private String admin_no;
    private String admin_email;
    private String pass;
    
    

    public AdminBean() {
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public String getAdmin_no() {
        return admin_no;
    }

    public void setAdmin_no(String admin_no) {
        this.admin_no = admin_no;
    }

    public String getAdmin_email() {
        return admin_email;
    }

    public void setAdmin_email(String admin_email) {
        this.admin_email = admin_email;
    }
    
    
    
}
