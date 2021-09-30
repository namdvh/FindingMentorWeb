/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.user;

/**
 *
 * @author MSI
 */
public class UserDTO {

    private String userID;
    private String name;
    private String email;
    private String roleID;
    private String phoneNumber;
    private String address;
    private String password;
    private String certificate;
    private String status;
    private String birthday;

    public UserDTO() {
    }

    public UserDTO(String userID, String name, String email, String roleID, String phoneNumber, String address, String password, String certificate, String status, String birthday) {
        this.userID = userID;
        this.name = name;
        this.email = email;
        this.roleID = roleID;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.password = password;
        this.certificate = certificate;
        this.status = status;
        this.birthday = birthday;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }
}
