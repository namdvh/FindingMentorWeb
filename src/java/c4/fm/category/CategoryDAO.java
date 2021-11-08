/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.category;

import c4.fm.user.UserDTO;
import c4.fm.utils.DBUtils;
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
public class CategoryDAO {

    public List<CategoryDTO> loadListCate() throws ClassNotFoundException, SQLException {
        List<CategoryDTO> listCate = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select CategoryID, CategoryName\n"
                        + "from tblCategory";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String CategoryId = rs.getString("CategoryID");
                    String CategoryName = rs.getString("CategoryName");
                    CategoryDTO cate = new CategoryDTO(CategoryId, CategoryName);
                    listCate.add(cate);
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
        return listCate;
    }

    public boolean checkDuplicateCategory(String cateID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            String sql = "select CategoryID,CategoryName from tblCategory where CategoryID = ? ";
            con = DBUtils.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, cateID);
            rs = preStm.executeQuery();
            if (rs.next()) {
                check = true;
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
        return check;
    }

    public boolean InsertCategory(CategoryDTO cate) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement preStm = null;
        boolean check = false;
        try {
            String sql = "insert into tblCategory values(?,?)";
            con = DBUtils.getConnection();
            preStm = con.prepareStatement(sql);
            preStm.setString(1, cate.getCategoryId());
            preStm.setString(2, cate.getCategoryName());
            check = preStm.executeUpdate()> 0;
        } finally {
            if (preStm != null) {
                preStm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return check;
    }
}
