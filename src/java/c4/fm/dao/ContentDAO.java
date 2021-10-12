/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.dao;

import c4.fm.subject.ContentDTO;
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
public class ContentDAO {

    public boolean CreateNewContent(String contentName, int chapterID, String videoURL, String blog) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pr = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblContent (ContentName, ChapterID, VideoURL, Blog) "
                        + "VALUES (?, ?, ?, ?)";
                pr = conn.prepareStatement(sql);
                pr.setString(1, contentName);
                pr.setInt(2, chapterID);
                pr.setString(3, videoURL);
                pr.setString(4, blog);
                if (pr.executeUpdate() > 0) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pr != null) {
                pr.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<ContentDTO> LoadListContent(int chapterID) throws SQLException {
        List<ContentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ContentID, ContentName, VideoURL, Blog "
                        + "FROM tblContent "
                        + "WHERE ChapterID = ? ";
                pr = conn.prepareStatement(sql);
                pr.setInt(1, chapterID);
                rs = pr.executeQuery();
                while (rs.next()) {
                    list.add(new ContentDTO(rs.getInt("ContentID"), rs.getString("ContentName"), chapterID, rs.getString("VideoURL"), rs.getString("Blog")));
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

    public boolean RemoveNewContent(int contentID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pr = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblContent "
                        + "WHERE ContentID = ?";
                pr = conn.prepareStatement(sql);
                pr.setInt(1, contentID);
                if (pr.executeUpdate() > 0) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pr != null) {
                pr.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean UpdateNewContent(int contentID, String contentName, String videoURL, String blog) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pr = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblContent "
                        + "SET ContentName = ?, VideoURL = ?, Blog = ? "
                        + "WHERE ContentID = ? ";
                pr = conn.prepareStatement(sql);
                pr.setString(1, contentName);
                pr.setString(2, videoURL);
                pr.setString(3, blog);
                pr.setInt(4, contentID);
                if (pr.executeUpdate() > 0) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
