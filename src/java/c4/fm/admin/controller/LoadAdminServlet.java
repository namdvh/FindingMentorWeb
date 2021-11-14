/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.admin.controller;

import c4.fm.category.CategoryDAO;
import c4.fm.category.CategoryDTO;
import c4.fm.user.UserDAO;
import c4.fm.subject.SubjectDAO;
import c4.fm.subject.SubjectDTO;
import c4.fm.user.UserDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author cunpl
 */
@MultipartConfig
@WebServlet(name = "LoadAdminServlet", urlPatterns = {"/LoadAdminServlet"})
public class LoadAdminServlet extends HttpServlet {

    private static final String ADMIN_PAGE = "admin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ADMIN_PAGE;
        try {
            HttpSession session = request.getSession();

            List<SubjectDTO> listSubject = null;
            SubjectDAO subjectDao = new SubjectDAO();
            listSubject = subjectDao.listSubjectAdmin();
            session.setAttribute("LIST_SUBJECT", listSubject);

            UserDAO userDao = new UserDAO();
            List<UserDTO> listUser = null;
            listUser = userDao.loadListUser();
            session.setAttribute("LIST_USER", listUser);

            CategoryDAO cateDao = new CategoryDAO();
            List<CategoryDTO> listCate = null;
            listCate = cateDao.loadListCate();
            session.setAttribute("LIST_CATE", listCate);
            
            String mess = (String) request.getAttribute("UPDATE_MSG");
            request.setAttribute("UPDATE_MSG", mess);

        } catch (Exception e) {
            log("Error at LoadAdminServlet:" + e.toString());
        } finally {
            response.sendRedirect(url);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
