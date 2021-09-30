/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.dao;

import c4.fm.user.UserDTO;
import c4.fm.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author MSI
 */
public class UserDAO {
    public UserDTO checkLogin(String UserID, String password) throws SQLException, ClassNotFoundException, NamingException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " select Name, Email, RoleID, PhoneNumber, Address, Password, Certificate, Status, BirthDay"
                        + " from tblUser"
                        + " where UserID =? and Password=? and Status='1' ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, UserID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String Name = rs.getString("Name");
                    String Email = rs.getString("Email");
                    String RoleID = rs.getString("RoleID");
                    String PhoneNumber = rs.getString("PhoneNumber");
                    String Address = rs.getString("Address");
                    String Certificate = rs.getString("Certificate");
                    String Status=rs.getString("Status");
                    String BirthDay=rs.getString("BirthDay");
                    user = new UserDTO(UserID, Name, Email, RoleID, PhoneNumber, Address, "", Certificate, Status, BirthDay);
                }
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }
      public boolean insertUseNew(UserDTO user) throws SQLException, NamingException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "insert into tblUser(UserID, Name, Email, RoleID, PhoneNumber, Address, Password, Certificate, Status, BirthDay)"
                        + " values(?,?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, "");
                stm.setString(3, user.getEmail());
                stm.setString(4, user.getRoleID());
                stm.setString(5, "");
                stm.setString(6, "");
                stm.setString(7, user.getPassword());
                stm.setString(8, user.getCertificate());
                stm.setString(9, "1");
                stm.setString(10, "");
                check = stm.executeUpdate() > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
