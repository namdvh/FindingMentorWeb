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
import java.util.ArrayList;
import java.util.List;
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
                String sql = " select Name, Email, RoleID, PhoneNumber, Address, Password, Certificate, Status, BirthDay, Images"
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
//                    RoleDAO roledao = new RoleDAO();
//                    RoleDTO roledto = roledao.loadListRole(RoleID);
                    String PhoneNumber = rs.getString("PhoneNumber");
                    String Address = rs.getString("Address");
                    String Certificate = rs.getString("Certificate");
                    String Status = rs.getString("Status");
                    String BirthDay = rs.getString("BirthDay");
                    String Images = rs.getString("Images");

                    user = new UserDTO(UserID, Name, Email, RoleID, PhoneNumber, Address, "", Certificate, Status, BirthDay, Images);
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
                String sql = "insert into tblUser(UserID, Name, Email, RoleID, PhoneNumber, Address, Password, Certificate, Status, BirthDay, Images)"
                        + " values(?,?,?,?,?,?,?,?,?,?,?)";
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
                stm.setString(11, "default.jpg");
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

    public boolean insertUserGoogle(UserDTO user) throws SQLException, NamingException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "insert into tblUser(UserID, Name, Email, RoleID, PhoneNumber, Address, Password, Certificate, Status, BirthDay, Images)"
                        + " values(?,?,?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getName());
                stm.setString(3, user.getEmail());
                stm.setString(4, user.getRoleID());
                stm.setString(5, "");
                stm.setString(6, "");
                stm.setString(7, user.getPassword());
                stm.setString(8, user.getCertificate());
                stm.setString(9, "1");
                stm.setString(10, "");
                stm.setString(11, "default.jpg");
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

    public boolean updateUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblUser "
                        + " SET Name = ?, Email = ?, PhoneNumber = ?, Address = ?, BirthDay = ?, Images = ?"
                        + " WHERE UserID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getName());
                stm.setString(2, user.getEmail());
                stm.setString(3, user.getPhoneNumber());
                stm.setString(4, user.getAddress());
                stm.setString(5, user.getBirthday());
                stm.setString(6, user.getImages());
                stm.setString(7, user.getUserID());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public boolean updateUserWithNoImages(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblUser "
                        + " SET Name = ?, Email = ?, PhoneNumber = ?, Address = ?, BirthDay = ? "
                        + " WHERE UserID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getName());
                stm.setString(2, user.getEmail());
                stm.setString(3, user.getPhoneNumber());
                stm.setString(4, user.getAddress());
                stm.setString(5, user.getBirthday());
                stm.setString(6, user.getUserID());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public UserDTO loadUser(String UserID) throws ClassNotFoundException, SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " select Name, Email, PhoneNumber, Address, BirthDay, Images"
                        + " from tblUser "
                        + " where UserID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, UserID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String Name = rs.getString("Name");
                    String Email = rs.getString("Email");
                    String PhoneNumber = rs.getString("PhoneNumber");
                    String Address = rs.getString("Address");
                    String BirthDay = rs.getString("BirthDay");
                    String Images = rs.getString("Images");
                    user = new UserDTO(UserID, Name, Email, PhoneNumber, Address, BirthDay, Images);
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

    public List<UserDTO> loadListUser() throws ClassNotFoundException, SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " select UserId, Name, Email, PhoneNumber, Address, BirthDay, Images"
                        + " from tblUser";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String UserId = rs.getString("UserId");
                    String Name = rs.getString("Name");
                    String Email = rs.getString("Email");
                    String PhoneNumber = rs.getString("PhoneNumber");
                    String Address = rs.getString("Address");
                    String BirthDay = rs.getString("BirthDay");
                    String Images = rs.getString("Images");
                    UserDTO user = new UserDTO(UserId, Name, Email, PhoneNumber, Address, BirthDay, Images);
                    listUser.add(user);
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
        return listUser;
    }

    public boolean RequestMentor(UserDTO user) throws SQLException, NamingException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "insert into tblRequestMentor(UserID, Name, Certificate, Description, Status)"
                        + " values(?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getEmail());
                stm.setString(3, user.getCertificate());
                stm.setString(4, "");
                stm.setString(5, user.getStatus());
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

    public List<UserDTO> listUserAdmin() throws ClassNotFoundException, SQLException {
        List<UserDTO> listUser = new ArrayList<>();

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select UserID, Name, Email, RoleID, PhoneNumber, Address, Password, Status, BirthDay, Images\n"
                        + "from tblUser \n "
                        + "Where RoleID like 'US'";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String userId = rs.getString("UserID");
                    String name = rs.getString("Name");
                    String email = rs.getString("Email");
                    String roleId = rs.getString("RoleID");
                    String phoneNumber = rs.getString("PhoneNumber");
                    String address = rs.getString("Address");
                    String password = rs.getString("Password");
                    boolean status = rs.getBoolean("Status");
                    String birthday = rs.getString("BirthDay");
                    String image = rs.getString("Images");
                    UserDTO user = new UserDTO(userId, name, email, roleId, phoneNumber, address, password, "", String.valueOf(status), birthday, image);
                    listUser.add(user);
                }
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                pst.close();
            }
        }
        return listUser;
    }

    public List<UserDTO> listMentorAdmin() throws ClassNotFoundException, SQLException {
        List<UserDTO> listUser = new ArrayList<>();

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select UserID, Name, Email, RoleID, PhoneNumber, Address, Password, Status, BirthDay, Images\n"
                        + "from tblUser \n "
                        + "Where RoleID like 'MT'";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String userId = rs.getString("UserID");
                    String name = rs.getString("Name");
                    String email = rs.getString("Email");
                    String roleId = rs.getString("RoleID");
                    String phoneNumber = rs.getString("PhoneNumber");
                    String address = rs.getString("Address");
                    String password = rs.getString("Password");
                    boolean status = rs.getBoolean("Status");
                    String birthday = rs.getString("BirthDay");
                    String image = rs.getString("Images");

                    UserDTO user = new UserDTO(userId, name, email, roleId, phoneNumber, address, password, "", String.valueOf(status), birthday, image);
                    listUser.add(user);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                pst.close();
            }
        }
        return listUser;
    }

    public List<UserDTO> searchMentorAdmin(String searchValue) throws ClassNotFoundException, SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select UserID, Name, Email, RoleID, PhoneNumber, Address, Password, Status, BirthDay, Images\n"
                        + "from tblUser \n "
                        + "Where RoleID like 'MT' and UserID like ? ";
                pst = con.prepareStatement(sql);
                pst.setString(1, "%" + searchValue + "%");
                rs = pst.executeQuery();
                while (rs.next()) {
                    String userId = rs.getString("UserID");
                    String name = rs.getString("Name");
                    String email = rs.getString("Email");
                    String roleId = rs.getString("RoleID");
                    String phoneNumber = rs.getString("PhoneNumber");
                    String address = rs.getString("Address");
                    String password = rs.getString("Password");
                    boolean status = rs.getBoolean("Status");
                    String birthday = rs.getString("BirthDay");
                    String image = rs.getString("Images");

                    UserDTO user = new UserDTO(userId, name, email, roleId, phoneNumber, address, password, "", String.valueOf(status), birthday, image);
                    listUser.add(user);
                }

            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                pst.close();
            }
        }
        return listUser;
    }

    public List<UserDTO> searchUserAdmin(String searchValue) throws ClassNotFoundException, SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select UserID, Name, Email, RoleID, PhoneNumber, Address, Password, Status, BirthDay, Images\n"
                        + "from tblUser \n "
                        + "Where RoleID like 'US' and UserID like ? ";
                pst = con.prepareStatement(sql);
                pst.setString(1, "%" + searchValue + "%");
                rs = pst.executeQuery();
                while (rs.next()) {
                    String userId = rs.getString("UserID");
                    String name = rs.getString("Name");
                    String email = rs.getString("Email");
                    String roleId = rs.getString("RoleID");
                    String phoneNumber = rs.getString("PhoneNumber");
                    String address = rs.getString("Address");
                    String password = rs.getString("Password");
                    boolean status = rs.getBoolean("Status");
                    String birthday = rs.getString("BirthDay");
                    String image = rs.getString("Images");

                    UserDTO user = new UserDTO(userId, name, email, roleId, phoneNumber, address, password, "", String.valueOf(status), birthday, image);
                    listUser.add(user);
                }

            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                pst.close();
            }
        }
        return listUser;
    }

    public boolean deleteUserStatusAdmin(String userId) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblUser "
                        + " SET Status = ? \n"
                        + " WHERE UserID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "False");
                stm.setString(2, userId);
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

    public boolean activeUserStatusAdmin(String userId) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblUser "
                        + " SET Status = ? \n"
                        + " WHERE UserID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "True");
                stm.setString(2, userId);
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

    public boolean updateUserRoleAdmin(String userId) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblUser "
                        + " SET RoleID = ? \n"
                        + " WHERE UserID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "MT");
                stm.setString(2, userId);
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
