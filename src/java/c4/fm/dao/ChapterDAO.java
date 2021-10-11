/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.dao;

import c4.fm.subject.ChapterDTO;
import c4.fm.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hoang
 */
public class ChapterDAO {

    public boolean CreateNewChapter(String chapterName, String description, int subjectID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblChapter (SubjectID, ChapterName, Description) "
                        + "VALUES (?, ?, ?)";
                pr = conn.prepareStatement(sql);
                pr.setInt(1, subjectID);
                pr.setString(2, chapterName);
                pr.setString(3, description);
                if (pr.executeUpdate() > 0) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pr != null) {
                pr.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<ChapterDTO> LoadListChapter(int subjectID) throws SQLException {
        List<ChapterDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ChapterID, ChapterName, Description "
                        + "FROM tblChapter "
                        + "WHERE SubjectID = ? ";
                pr = conn.prepareStatement(sql);
                pr.setInt(1, subjectID);
                rs = pr.executeQuery();
                while (rs.next()) {
                    list.add(new ChapterDTO(rs.getInt("ChapterID"), subjectID, rs.getString("ChapterName"), rs.getString("Description")));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pr != null) {
                pr.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean RemoveNewChapter(int chapterID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblChapter "
                        + "WHERE ChapterID = ?";
                pr = conn.prepareStatement(sql);
                pr.setInt(1, chapterID);
                if (pr.executeUpdate() > 0) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pr != null) {
                pr.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean UpdateNewChapter(int chapterID, String chapterName, String description) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblChapter "
                        + "SET ChapterName = ?, Description = ? "
                        + "WHERE ChapterID = ? ";
                pr = conn.prepareStatement(sql);
                pr.setString(1, chapterName);
                pr.setString(2, description);
                pr.setInt(3, chapterID);
                if (pr.executeUpdate() > 0) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pr != null) {
                pr.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

}
