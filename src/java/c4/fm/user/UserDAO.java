package c4.fm.user;

import c4.fm.user.UserDTO;
import c4.fm.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

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
    public UserDTO getUserInfo(String UserID) throws SQLException, ClassNotFoundException, NamingException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " select Name, Email, RoleID, PhoneNumber, Address, Password, Certificate, Status, BirthDay, Images"
                        + " from tblUser"
                        + " where UserID =? and Status='1' ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, UserID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String Name = rs.getString("Name");
                    String Email = rs.getString("Email");
                    String RoleID = rs.getString("RoleID");
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
                stm.setString(11, "https://i.imgur.com/GwvY1F9.png");
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
                stm.setString(2, "");
                stm.setString(3, user.getEmail());
                stm.setString(4, user.getRoleID());
                stm.setString(5, "");
                stm.setString(6, "");
                stm.setString(7, user.getPassword());
                stm.setString(8, user.getCertificate());
                stm.setString(9, "1");
                stm.setString(10, "");
                stm.setString(11, "https://i.imgur.com/GwvY1F9.png");
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
    public UserDTO loadUser(String UserID) throws ClassNotFoundException, SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " select Name, Email, RoleID, PhoneNumber, Address, BirthDay, Images"
                        + " from tblUser "
                        + " where UserID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, UserID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String Name = rs.getString("Name");
                    String Email = rs.getString("Email");
                    String roleID = rs.getString("RoleID");
                    String PhoneNumber = rs.getString("PhoneNumber");
                    String Address = rs.getString("Address");
                    String BirthDay = rs.getString("BirthDay");
                    String Images = rs.getString("Images");
                    if (roleID.equals("US")) {
                        user = new UserDTO(UserID, Name, Email, "User", PhoneNumber, Address, BirthDay, Images);
                    } else if (roleID.equals("MT")) {
                        user = new UserDTO(UserID, Name, Email, "Mentor", PhoneNumber, Address, BirthDay, Images);
                    } else {
                        user = new UserDTO(UserID, Name, Email, "AD", PhoneNumber, Address, BirthDay, Images);
                    }
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
    public UserDTO LoadMentor(String UserID) throws ClassNotFoundException, SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select Name, Email, RoleID, PhoneNumber, Address, BirthDay, Images,Stars \n"
                        + "from tblUser,tblFeedBack\n"
                        + "where tblFeedBack.UserID = tblUser.UserID AND tblUser.UserID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, UserID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String Name = rs.getString("Name");
                    String Email = rs.getString("Email");
                    String roleID = rs.getString("RoleID");
                    String PhoneNumber = rs.getString("PhoneNumber");
                    String Address = rs.getString("Address");
                    String BirthDay = rs.getString("BirthDay");
                    String Images = rs.getString("Images");
                    int Stars = rs.getInt("Stars");
                    if (roleID.equals("US")) {
                        user = new UserDTO(UserID, Name, Email, "User", PhoneNumber, Address, BirthDay, Images, Stars);
                    } else if (roleID.equals("MT")) {
                        user = new UserDTO(UserID, Name, Email, "Mentor", PhoneNumber, Address, BirthDay, Images, Stars);
                    }
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
    public List<UserDTO> loadListUser() throws ClassNotFoundException, SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " select UserId, Name, Email, PhoneNumber, Address, BirthDay, Images"
                        + " from tblUser"
                        + " where RoleID = 'MT'";
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

    public boolean checkImage(String UserID, String Image) throws SQLException, ClassNotFoundException, NamingException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " select Images"
                        + " from tblUser"
                        + " where UserID = ? and Images = ? and Status= '1' ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, UserID);
                stm.setString(2, Image);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }

    public List<UserDTO> ShowRank() throws ClassNotFoundException, SQLException {
        List<UserDTO> ListUser = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select top 6 tblUser.UserID,Name,Email,RoleID,PhoneNumber,Address,Password,Status,BirthDay,Images,Stars\n"
                        + "from tblFeedBack\n"
                        + "inner join tblUser on tblFeedBack.UserID = tblUser.UserID \n"
                        + "order by tblFeedBack.Stars desc ";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    String name = rs.getString("Name");
                    String email = rs.getString("Email");
                    String roleId = rs.getString("RoleID");
                    String phoneNumber = rs.getString("PhoneNumber");
                    String address = rs.getString("Address");
                    String password = rs.getString("Password");
                    boolean status = rs.getBoolean("Status");
                    String birthday = rs.getString("BirthDay");
                    String image = rs.getString("Images");
                    int stars = rs.getInt("Stars");
                    UserDTO user = new UserDTO(userID, name, email, roleId, phoneNumber, address, password, image, image, birthday, image, stars);
                    ListUser.add(user);
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
        return ListUser;
    }

    public boolean updatePassword(String userId, String password) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblUser "
                        + " SET Password = ? \n"
                        + " WHERE UserID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, password);
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
    public boolean checkOldPassword(String userId, String password) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " Select Password "
                        + " from tblUser \n"
                        + " WHERE UserID = ? AND Password = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userId);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }

    public UserDTO getStar(String userID) throws ClassNotFoundException, SQLException {
        UserDTO user = null;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select Stars from tblFeedBack where UserID = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, userID);
                rs = pst.executeQuery();
                while (rs.next()) {
                    user = new UserDTO(rs.getInt("Stars"));
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
        return user;
    }

    public boolean Rating(String userID, int point) throws ClassNotFoundException, SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "update tblFeedBack \n"
                        + "set Stars = ? \n"
                        + "where UserID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, point);
                stm.setString(2, userID);
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
    public List<UserDTO> searchMentor(String searchValue) throws ClassNotFoundException, SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select tblUser.UserID,Name, Email, RoleID, PhoneNumber, Address, BirthDay, Images, Stars \n"
                        + "from tblUser,tblFeedBack \n"
                        + " Where tblUser.UserID = tblFeedBack.UserID AND RoleID like 'MT' and tblUser.Name like ? ";
                pst = con.prepareStatement(sql);
                pst.setString(1, "%" + searchValue + "%");
                rs = pst.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    String name = rs.getString("Name");
                    String email = rs.getString("Email");
                    String roleId = rs.getString("RoleID");
                    String phoneNumber = rs.getString("PhoneNumber");
                    String address = rs.getString("Address");
                    String birthday = rs.getString("BirthDay");
                    String image = rs.getString("Images");
                    int Stars = rs.getInt("Stars");
                    UserDTO user = new UserDTO(userID,name, email, roleId, phoneNumber, address, birthday, image, Stars);
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
    public boolean InsertFeedback(String userID) throws ClassNotFoundException, SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "insert into tblFeedBack \n"
                        + " values (?,?,0) \n";

                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, "");
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
    public int countSubject() throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " select COUNT(SubjectID) from tblSubject ";
                preStm = con.prepareStatement(sql);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (preStm != null) {
                preStm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return count;
    }
    public int countStudent() throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " select COUNT(UserID) from tblUser Where RoleID = 'US' ";
                preStm = con.prepareStatement(sql);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (preStm != null) {
                preStm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return count;
    }

    public int countMentor() throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " select COUNT(UserID) from tblUser Where RoleID = 'MT' ";
                preStm = con.prepareStatement(sql);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (preStm != null) {
                preStm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return count;
    }
}
