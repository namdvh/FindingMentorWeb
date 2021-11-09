/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.requestmentor;

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
 * @author cunpl
 */
public class RequestMentorDAO implements Serializable {

    public List<RequestMentorDTO> getListRequestMentorAdmin() throws ClassNotFoundException, SQLException {
        List<RequestMentorDTO> listRQMentor = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select RequestID, UserID, Name, Certificate, Description, Status\n"
                        + "from tblRequestMentor \n"
                        + "Where Status = 1";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int requestId = rs.getInt("RequestID");
                    String userId = rs.getString("UserID");
                    String name = rs.getString("Name");
                    String certificate = rs.getString("Certificate");
                    String description = rs.getString("Description");
                    String status = String.valueOf(rs.getBoolean("Status"));
                    RequestMentorDTO rqMentor = new RequestMentorDTO(requestId, userId, name, certificate, description, status);
                    listRQMentor.add(rqMentor);
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
        return listRQMentor;
    }

    public List<RequestMentorDTO> searchListRequestMentorAdmin(String searchValue) throws ClassNotFoundException, SQLException {
        List<RequestMentorDTO> listRQMentor = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select RequestID, UserID, Name, Certificate, Description, Status\n"
                        + "from tblRequestMentor \n"
                        + "Where Status = 1 and UserID like ? ";
                pst = con.prepareStatement(sql);
                pst.setString(1, "%" + searchValue + "%");
                rs = pst.executeQuery();
                while (rs.next()) {
                    int requestId = rs.getInt("RequestID");
                    String userId = rs.getString("UserID");
                    String name = rs.getString("Name");
                    String certificate = rs.getString("Certificate");
                    String description = rs.getString("Description");
                    String status = String.valueOf(rs.getBoolean("Status"));
                    RequestMentorDTO rqMentor = new RequestMentorDTO(requestId, userId, name, certificate, description, status);
                    listRQMentor.add(rqMentor);
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
        return listRQMentor;
    }

    public boolean updateRequestStatusAdmin(int requestId) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Update tblRequestMentor\n"
                        + "set Status = 'False'\n"
                        + "Where RequestID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, requestId);
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

    public boolean denailRequestStatusAdmin(int requestId) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Update tblRequestMentor\n"
                        + "set Status = 'False'\n"
                        + "Where RequestID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, requestId);
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
