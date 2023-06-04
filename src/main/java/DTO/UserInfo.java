/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.util.Date;


/**
 *
 * @author 03lin
 */
public class UserInfo {
        private int id;
	private String name;
        private String avatar;
	private Date dob;
        private String gender;
        private String email;
        private String phone;
        private String address;
        private String role;
        private String account_id;

    public UserInfo(int id, String name, String avatar, Date dob, String gender, String email, String phone, String address, String role, String account_id) {
        this.id = id;
        this.name = name;
        this.avatar = avatar;
        this.dob = dob;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.role = role;
        this.account_id = account_id;
    }
        
        

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getAccount_id() {
        return account_id;
    }

    public void setAccount_id(String account_id) {
        this.account_id = account_id;
    }
	
        
    
}
