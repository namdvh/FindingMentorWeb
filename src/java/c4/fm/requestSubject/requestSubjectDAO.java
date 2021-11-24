/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.requestSubject;

import c4.fm.subject.SubjectDTO;
import c4.fm.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Khang
 */
public class requestSubjectDAO {

    public boolean RequestSubject(requestSubjectDTO subject) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "insert into tblRequestSubject(UserID,CategoryName,CourseName,Images,Description, Status) \n"
                        + " values (?,?,?,?,?,?)";
                pst = con.prepareStatement(sql);
                pst.setString(1, subject.getUserID());
                pst.setString(2, subject.getCategoryName());
                pst.setString(3, subject.getCourseName());
                pst.setString(4, subject.getImages());
                pst.setString(5, subject.getDescription());
                pst.setBoolean(6, false);
                check = pst.executeUpdate() > 0;
            }
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public List<requestSubjectDTO> LoadRequest() throws SQLException, ClassNotFoundException {
        List<requestSubjectDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select RequestCourseID, UserID, CategoryName, CourseName, Images, Description, Status \n"
                        + "from tblRequestSubject\n"
                        + "where Status = 0";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int requestCourseID = rs.getInt("RequestCourseID");
                    String userID = rs.getString("UserID");
                    String categoryName = rs.getString("CategoryName");
                    String CourseName = rs.getString("CourseName");
                    String images = rs.getString("Images");
                    String description = rs.getString("Description");
                    boolean status = rs.getBoolean("Status");
                    //String userID, int RequestCourseID, String CourseName, String CategoryName, String Images, String Description, boolean status
                    requestSubjectDTO subject = new requestSubjectDTO(userID, requestCourseID, CourseName, categoryName, images, description, status);
                    list.add(subject);
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
        return list;
    }

    public boolean UpdateRequest(String requestID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "update tblRequestSubject \n"
                        + "set Status = 1 \n"
                        + "where RequestCourseID = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, requestID);
                check = pst.executeUpdate() > 0;
            }
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public boolean DenySubject(String requestID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "delete From tblRequestSubject where RequestCourseID = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, requestID);
                check = pst.executeUpdate() > 0;
            }
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public requestSubjectDTO LoadRequestByRequestID(String requestID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        requestSubjectDTO subject = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select RequestCourseID, UserID, CategoryName, CourseName, Images, Description, Status \n"
                        + "from tblRequestSubject\n"
                        + "where Status = 0 AND RequestCourseID= ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, requestID);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int requestCourseID = rs.getInt("RequestCourseID");
                    String userID = rs.getString("UserID");
                    String categoryName = rs.getString("CategoryName");
                    String CourseName = rs.getString("CourseName");
                    String images = rs.getString("Images");
                    String description = rs.getString("Description");
                    boolean status = rs.getBoolean("Status");
                    //String userID, int RequestCourseID, String CourseName, String CategoryName, String Images, String Description, boolean status
                    subject = new requestSubjectDTO(userID, requestCourseID, CourseName, categoryName, images, description, status);
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

    public boolean checkDuplicateRequest(String MentorID, String courseName) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean check = true;
        try {
            con = DBUtils.getConnection();
            String sql = "select UserID \n"
                    + "from tblRequestSubject \n"
                    + "where UserID = ? AND CourseName = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, MentorID);
            pst.setString(2, courseName);
            rs = pst.executeQuery();
            if (rs.next()) {
                check = false;
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

    public boolean checkDupliCourse(String courseName) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            con = DBUtils.getConnection();
            String sql = "select SubjectName \n"
                    + "from tblSubject \n"
                    + "where SubjectName = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, courseName);
            rs = pst.executeQuery();
            if (rs.next()) {
                check = true;
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

    public boolean checkDupliCourseinMentor(String courseName, String userID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean check = true;
        try {
            con = DBUtils.getConnection();
            String sql = "select SubjectName \n"
                    + "from tblSubject \n"
                    + "where SubjectName = ? AND UserID = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, courseName);
            pst.setString(2, userID);
            rs = pst.executeQuery();
            if (rs.next()) {
                check = false;
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

    public static void main(String[] args) {
        try {
            requestSubjectDAO dao = new requestSubjectDAO();
            List<requestSubjectDTO> list = dao.LoadRequest();
            System.out.println(list.get(0).categoryName);
        } catch (Exception e) {
        }
    }
}
