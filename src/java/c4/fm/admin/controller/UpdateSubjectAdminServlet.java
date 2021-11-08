/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.admin.controller;

import c4.fm.subject.SubjectDAO;
import c4.fm.subject.SubjectDTO;
import c4.fm.user.UserDTO;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author cunpl
 */
@WebServlet(name = "UpdateSubjectAdminServlet", urlPatterns = {"/UpdateSubjectAdminServlet"})
@MultipartConfig
public class UpdateSubjectAdminServlet extends HttpServlet {

    private static final String ADMIN_PAGE = "MainController?action=LoadAdminPage";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ADMIN_PAGE;
        try {
            int subjectId = Integer.parseInt(request.getParameter("subjectId"));
            String subjectName = request.getParameter("subjectName");

            Part newPart = request.getPart("image");
            Part oldPart = request.getPart("oldImage");
            String userId = request.getParameter("userId");
            String categoryId = request.getParameter("categoryId");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            String description = request.getParameter("description");

            HttpSession session = request.getSession();
            SubjectDTO sj = (SubjectDTO) session.getAttribute("SUB");
            SubjectDAO sjdao = new SubjectDAO();
            String pathImage = "";

            SubjectDTO subjectDTO = sjdao.LoadSubjectInactive(subjectId);

            if (!newPart.getSubmittedFileName().isEmpty()) {
                String filename = subjectId + ".jpg";
                pathImage = "SubjectImage" + File.separator + filename;
                String realPath = request.getServletContext().getRealPath("/") + pathImage;
                File file = new File(realPath);
                FileUtils.copyInputStreamToFile(newPart.getInputStream(), file);
            } else {
                pathImage = subjectDTO.getImages();
            }
            SubjectDTO subject = new SubjectDTO(subjectId, subjectName, pathImage, userId, categoryId, description, status);
            SubjectDAO subjectDao = new SubjectDAO();
            String msg = "";
            if (subjectDao.updateSubjectAdmin(subject)) {
                msg = "Update Success!";
            }
            request.setAttribute("UPDATE_MSG", msg);

        } catch (Exception e) {
            log("Error at UpdateSubjectAdminServlet:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
