/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.registersubject;

import c4.fm.subject.SubjectDTO;
import c4.fm.utils.DBUtils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HuuToan
 */
public class RegisterSubjectDAO implements Serializable{
      public int registerSubjectUser(RegisterSubjectDTO sjdto) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = c4.fm.utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO tblRegister values(?,?,'1',?) ";

                stm.setInt(1, sjdto.getSubjectID());
                stm.setString(2, sjdto.getUserID());
                stm.setString(3, sjdto.getName());
                rs = stm.executeQuery();
                return stm.executeUpdate();
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
        return -1;
    }

    public List<SubjectDTO> listSubject() throws SQLException, ClassNotFoundException {
        List<SubjectDTO> listSubject = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select SubjectID, SubjectName, Images, UserId, CategoryID, Description, Status \n"
                        + "from tblSubject";
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
                con.close();
            }

        }
        return listSubject;
    }

     
    public List<RegisterSubjectDTO> loadJoinnedCourse(String userID) throws SQLException, ClassNotFoundException {
        List<RegisterSubjectDTO> listsubject = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT tblSubject.SubjectName, tblSubject.Images, tblSubject.Description "
                        + " FROM tblRegister INNER JOIN tblSubject on tblRegister.SubjectID = tblSubject.SubjectID "
                        + " WHERE tblRegister.UserID = ? ";
                pst = con.prepareStatement(sql);
                pst.setString(1, userID);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String subjectName = rs.getString("SubjectName");
                    String images = rs.getString("Images");
                    String description = rs.getString("Description");
                    RegisterSubjectDTO dto = new RegisterSubjectDTO(subjectName, images, description);
                    listsubject.add(dto);
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
        return listsubject ;
    }
}
