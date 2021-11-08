/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.role;

import c4.fm.utils.DBUtils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HuuToan
 */
public class RoleDAO implements Serializable {

    public RoleDTO loadListRole(String roleID) throws ClassNotFoundException, SQLException {
        RoleDTO role = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " select RoleID, RoleName "
                        + " from tblRole "
                        + "where RoleID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, roleID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String roleName = rs.getString("roleName");
                    role = new RoleDTO(roleID, roleName);
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
        return role;
    }
}
