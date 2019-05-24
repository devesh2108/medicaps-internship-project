/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Blob;
import javax.servlet.http.Part;

/**
 *
 * @author GAGAN
 */
public class InternshipDetailsBean implements java.io.Serializable{
    
      private  String userid;  
      private String sec;
      private String year;
      private String semester;
      private String skills;
      private  String comp_name;
      private  String duration;
      private  String session;
      private  String comp_address;
      private  String domain;
      private  Part certificate;
      private String cont_name;
      private String cont_no;
      private String cont_email;
      private  Blob certificateimg;
      private  int vstatus;
      private String name;

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getCont_name() {
        return cont_name;
    }

    public void setCont_name(String cont_name) {
        this.cont_name = cont_name;
    }

    public String getCont_no() {
        return cont_no;
    }

    public void setCont_no(String cont_no) {
        this.cont_no = cont_no;
    }

    public String getCont_email() {
        return cont_email;
    }

    public void setCont_email(String cont_email) {
        this.cont_email = cont_email;
    }
      
      

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
      
    public int getVstatus() {
        return vstatus;
    }

    public String getSec() {
        return sec;
    }

    public void setSec(String sec) {
        this.sec = sec;
    }

    public void setVstatus(int vstatus) {
        this.vstatus = vstatus;
    }
      
    public InternshipDetailsBean() {
    }

      
    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getComp_name() {
        return comp_name;
    }

    public void setComp_name(String comp_name) {
        this.comp_name = comp_name;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getSession() {
        return session;
    }

    public void setSession(String session) {
        this.session = session;
    }

    public String getComp_address() {
        return comp_address;
    }

    public void setComp_address(String comp_address) {
        this.comp_address = comp_address;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public Part getCertificate() {
        return certificate;
    }

    public void setCertificate(Part certificate) {
        this.certificate = certificate;
    }
      
    public void setImage(Blob certificateimg)
    {
      this.certificateimg=certificateimg;
    }
    
    public Blob getImage()
    {
        return certificateimg;
    }
    
}
