package c4.fm.subject;

import c4.fm.user.UserDTO;
import c4.fm.utils.DBUtils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SubjectDAO implements Serializable {

    public List<SubjectDTO> listSubjectAdmin() throws SQLException, ClassNotFoundException {
        List<SubjectDTO> listSubject = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select SubjectID, SubjectName, Images, UserId, CategoryID, Description, Status \n"
                        + "from tblSubject ";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int subjectId = Integer.parseInt(rs.getString("SubjectID"));
                    String subjectName = rs.getString("SubjectName");
                    String images = rs.getString("Images");
                    String userId = rs.getString("UserId");
                    String categoryId = rs.getString("CategoryID");
                    String description = rs.getString("Description");
                    boolean status = rs.getBoolean("Status");
                    SubjectDTO subject = new SubjectDTO(subjectId, subjectName, images, userId, categoryId, description, status);
                    listSubject.add(subject);
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

            }

        }
        return listSubject;
    }

    public boolean insertSubjectAdmin(SubjectDTO subject) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "insert into tblSubject values(?,?,?,?,?,?);";
                pst = con.prepareStatement(sql);
                pst.setString(1, subject.getSubjectName());
                pst.setString(2, subject.getImages());
                pst.setString(3, subject.getUserId());
                pst.setString(4, subject.getCategoryId());
                pst.setString(5, subject.getDescription());
                pst.setBoolean(6, subject.isStatus());
                if (pst.executeUpdate() > 0) {
                    return true;
                }
            }

        } finally {

            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return false;
    }

    public List<SubjectDTO> searchSubjectAdmin(String searchValue) throws SQLException, ClassNotFoundException {
        List<SubjectDTO> listSubject = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select SubjectID, SubjectName, Images, UserId, CategoryID, Description, Status \n"
                        + "from tblSubject \n"
                        + "Where SubjectName like ? ";
                pst = con.prepareStatement(sql);
                pst.setString(1, "%" + searchValue + "%");
                rs = pst.executeQuery();
                while (rs.next()) {
                    int subjectId = Integer.parseInt(rs.getString("SubjectID"));
                    String subjectName = rs.getString("SubjectName");
                    String images = rs.getString("Images");
                    String userId = rs.getString("UserId");
                    String categoryId = rs.getString("CategoryID");
                    String description = rs.getString("Description");
                    boolean status = rs.getBoolean("Status");
                    SubjectDTO subject = new SubjectDTO(subjectId, subjectName, images, userId, categoryId, description, status);
                    listSubject.add(subject);
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

            }

        }
        return listSubject;
    }

    public SubjectDTO getSubjectAdmin(int SubjectID) throws SQLException, ClassNotFoundException {
        SubjectDTO subject = null;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select SubjectID, SubjectName, Images, UserId, CategoryID, Description, Status \n"
                        + "from tblSubject \n"
                        + "Where SubjectID = ?";
                pst = con.prepareStatement(sql);
                pst.setInt(1, SubjectID);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int subjectId = Integer.parseInt(rs.getString("SubjectID"));
                    String subjectName = rs.getString("SubjectName");
                    String images = rs.getString("Images");
                    String userId = rs.getString("UserId");
                    String categoryId = rs.getString("CategoryID");
                    String description = rs.getString("Description");
                    boolean status = rs.getBoolean("Status");
                    subject = new SubjectDTO(subjectId, subjectName, images, userId, categoryId, description, status);
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

            }

        }
        return subject;
    }

    public boolean updateSubjectAdmin(SubjectDTO subject) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Update tblSubject\n"
                        + "set SubjectName = ?, Images = ?, UserID = ?, CategoryID = ?,\n"
                        + "Description = ?, Status = ?\n"
                        + "Where SubjectID = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, subject.getSubjectName());
                pst.setString(2, subject.getImages());
                pst.setString(3, subject.getUserId());
                pst.setString(4, subject.getCategoryId());
                pst.setString(5, subject.getDescription());
                pst.setBoolean(6, subject.isStatus());
                pst.setInt(7, subject.getSubjectId());
                if (pst.executeUpdate() > 0) {
                    return true;
                }
            }

        } finally {

            if (pst != null) {
                pst.close();
            }
            if (con != null) {

            }

        }
        return false;
    }

    public SubjectDTO CourseDetail(int SubjectID) throws SQLException, ClassNotFoundException {
        SubjectDTO dto = null;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select  SubjectName, Images, Description "
                        + "from tblSubject "
                        + " where SubjectID = ? ";
                pst = con.prepareStatement(sql);
                pst.setInt(1, SubjectID);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String subjectName = rs.getString("SubjectName");
                    String images = rs.getString("Images");
                    String description = rs.getString("Description");
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
                con.close();
            }
        }
        return dto;
    }

    public SubjectDTO loadSubject(int subjectID) throws SQLException, ClassNotFoundException {
        SubjectDTO subject = null;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select SubjectID, SubjectName, Images, UserID, CategoryID, Description, Status \n"
                        + " from tblSubject "
                        + " where SubjectID = ? AND Status = '1' ";
                pst = con.prepareStatement(sql);
                pst.setInt(1, subjectID);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int subjectId = Integer.parseInt(rs.getString("SubjectID"));
                    String subjectName = rs.getString("SubjectName");
                    String images = rs.getString("Images");
                    String userId = rs.getString("UserID");
                    String categoryId = rs.getString("CategoryID");
                    String description = rs.getString("Description");
                    boolean status = rs.getBoolean("Status");
                    subject = new SubjectDTO(subjectId, subjectName, images, userId, categoryId, description, status);
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
                con.close();
            }

        }
        return subject;
    }
    ///////////////////////////////////

    public List<SubjectDTO> ShowAllSubject() throws ClassNotFoundException, SQLException {
        List<SubjectDTO> listSubject = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select SubjectID,SubjectName,Images,UserID,CategoryID,Description,Status \n"
                        + "from tblSubject \n "
                        + "Where Status = '1' ";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int subjectId = Integer.parseInt(rs.getString("SubjectID"));
                    String subjectName = rs.getString("SubjectName");
                    String images = rs.getString("Images");
                    String userId = rs.getString("UserID");
                    String categoryId = rs.getString("CategoryID");
                    String description = rs.getString("Description");
                    boolean status = rs.getBoolean("Status");
                    SubjectDTO subject = new SubjectDTO(subjectId, subjectName, images, userId, categoryId, description, status);
                    listSubject.add(subject);
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
        return listSubject;
    }

    public List<SubjectDTO> SearchSubject(String searchValue) throws ClassNotFoundException, SQLException {
        List<SubjectDTO> listSubject = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select SubjectID,SubjectName,Images,UserID,CategoryID,Description,Status \n"
                        + " from tblSubject \n "
                        + " Where SubjectName like ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, "%" + searchValue + "%");
                rs = pst.executeQuery();
                while (rs.next()) {
                    int subjectId = Integer.parseInt(rs.getString("SubjectID"));
                    String subjectName = rs.getString("SubjectName");
                    String images = rs.getString("Images");
                    String userId = rs.getString("UserID");
                    String categoryId = rs.getString("CategoryID");
                    String description = rs.getString("Description");
                    boolean status = rs.getBoolean("Status");
                    SubjectDTO subject = new SubjectDTO(subjectId, subjectName, images, userId, categoryId, description, status);
                    listSubject.add(subject);
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
        return listSubject;
    }

    public List<SubjectDTO> ShowEnrollSubject(String searchValue, String userID) throws ClassNotFoundException, SQLException {
        List<SubjectDTO> listSubject = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select SubjectID,SubjectName,Images,UserID,CategoryID,Description,Status \n"
                        + " from tblSubject \n "
                        + " SubjectName like  ? and UserID = ? ";
                pst = con.prepareStatement(sql);
                pst.setString(1, "%" + searchValue + "%");
                pst.setString(2, userID);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int subjectId = Integer.parseInt(rs.getString("SubjectID"));
                    String subjectName = rs.getString("SubjectName");
                    String images = rs.getString("Images");
                    String userId = rs.getString("UserID");
                    String categoryId = rs.getString("CategoryID");
                    String description = rs.getString("Description");
                    boolean status = rs.getBoolean("Status");
                    SubjectDTO subject = new SubjectDTO(subjectId, subjectName, images, userId, categoryId, description, status);
                    listSubject.add(subject);
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
        return listSubject;
    }

    public List<SubjectDTO> listSubjectMentor(String userID) throws SQLException, ClassNotFoundException {
        List<SubjectDTO> listSubject = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select SubjectID, SubjectName, Images, CategoryID, Description, Status \n"
                        + "from tblSubject \n"
                        + "Where UserID = ? ";
                pst = con.prepareStatement(sql);
                pst.setString(1, userID);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int subjectId = Integer.parseInt(rs.getString("SubjectID"));
                    String subjectName = rs.getString("SubjectName");
                    String images = rs.getString("Images");
                    String categoryId = rs.getString("CategoryID");
                    String description = rs.getString("Description");
                    boolean status = rs.getBoolean("Status");
                    SubjectDTO subject = new SubjectDTO(subjectId, subjectName, images, userID, categoryId, description, status);
                    listSubject.add(subject);
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

            }

        }
        return listSubject;
    }

    public List<SubjectDTO> ShowEnrollSubject(String userID) throws ClassNotFoundException, SQLException {
        List<SubjectDTO> listSubject = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select tblSubject.SubjectID, SubjectName, Images, tblSubject.UserID, CategoryID, [Description], tblSubject.Status \n"
                        + " from tblSubject,tblRegister  \n "
                        + " where tblRegister.SubjectID = tblSubject.SubjectID and tblRegister.UserID = ? ";
                pst = con.prepareStatement(sql);
                pst.setString(1, userID);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int subjectId = Integer.parseInt(rs.getString("SubjectID"));
                    String subjectName = rs.getString("SubjectName");
                    String images = rs.getString("Images");
                    String userId = rs.getString("UserID");
                    String categoryId = rs.getString("CategoryID");
                    String description = rs.getString("Description");
                    boolean status = rs.getBoolean("Status");
                    SubjectDTO subject = new SubjectDTO(subjectId, subjectName, images, userId, categoryId, description, status);
                    listSubject.add(subject);
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
        return listSubject;
    }

    //ham load mentor
    public SubjectDTO loadMentor(int subjectID) throws SQLException, ClassNotFoundException {
        SubjectDTO subject = null;
        UserDTO user = null;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT   s.SubjectID, s.UserID, u.Name, u.Images "
                        + " FROM tblSubject s "
                        + " INNER JOIN tblUser u ON s.UserID = u.UserID "
                        + " WHERE s.SubjectID = ? ";
                pst = con.prepareStatement(sql);
                pst.setInt(1, subjectID);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int subjectId = Integer.parseInt(rs.getString("SubjectID"));
                    String UserID = rs.getString("UserID");
                    String images = rs.getString("Images");
                    String Name = rs.getString("Name");
                    subject = new SubjectDTO(subjectId, UserID);
                    user = new UserDTO(Name, images);
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
                con.close();
            }
        }
        return subject;
    }

    public List<String> loadListStudentEnroll(String subjectID) throws SQLException, ClassNotFoundException {
        List<String> listStudent = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select UserID \n"
                        + "from tblRegister \n"
                        + "Where SubjectID = ?";
                pst = con.prepareStatement(sql);
                pst.setInt(1, Integer.parseInt(subjectID));
                rs = pst.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    listStudent.add(userID);
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

            }
        }
        return listStudent;
    }

    public boolean checkMentorSubject(String userID, int subjectID) throws ClassNotFoundException, SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select UserID, SubjectID \n"
                        + "from tblSubject \n"
                        + "Where UserID = ? and SubjectID = ? ";
                pst = con.prepareStatement(sql);
                pst.setString(1, userID);
                pst.setInt(2, subjectID);
                rs = pst.executeQuery();
                if (rs.next()) {
                    check = true;
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

            }
        }
        return check;
    }

    public boolean deleteSubject(String subjectId) throws ClassNotFoundException, SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Update tblSubject \n"
                        + "set Status = ? \n"
                        + "Where SubjectID = ?";
                pst = con.prepareStatement(sql);
                pst.setInt(1, 0);
                pst.setString(2, subjectId);
                rs = pst.executeQuery();
                if (pst.executeUpdate() > 0) {
                    check = true;
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
                con.close();
            }
        }
        return check;
    }
}
