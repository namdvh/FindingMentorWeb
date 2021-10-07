/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.subject;

import c4.fm.utils.DBUtils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sun.security.pkcs11.Secmod;

/**
 *
 * @author cunpl
 */
public class SubjectDAO implements Serializable {

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

            }

        }
        return listSubject;
    }

}
