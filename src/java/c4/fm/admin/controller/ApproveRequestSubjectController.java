/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.admin.controller;

import c4.fm.category.CategoryDAO;
import c4.fm.category.CategoryDTO;
import c4.fm.requestSubject.requestSubjectDAO;
import c4.fm.requestSubject.requestSubjectDTO;
import c4.fm.subject.SubjectDAO;
import c4.fm.subject.SubjectDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Khang
 */
public class ApproveRequestSubjectController extends HttpServlet {

    private static final String REQUEST_SUBJECT_MANAGER_PAGE = "LoadRequestSubjectPage";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = REQUEST_SUBJECT_MANAGER_PAGE;
        boolean check = false;
        try {
            String requestID = request.getParameter("requestId");
            
            requestSubjectDAO dao = new requestSubjectDAO();
            SubjectDAO subDAO = new SubjectDAO();
            CategoryDAO cateDAO = new CategoryDAO();
            requestSubjectDTO dto = (requestSubjectDTO) dao.LoadRequestByRequestID(requestID);
            
            
            String courseName = dto.getCourseName();
            String images = dto.getImages();
            String userID = dto.getUserID();
            String categoryName = dto.getCategoryName();
            CategoryDTO cate = cateDAO.LoadCateName(categoryName);
            String cateID = cate.getCategoryId();
            String description = dto.getDescription();

            check = dao.UpdateRequest(requestID);
            if (check) {
                SubjectDTO sub = new SubjectDTO(courseName, images, userID, cateID, description, true);
                subDAO.insertSubjectAdmin(sub);
            }
        } catch (Exception e) {
            log("Error at approve subject managerment" + e.getMessage());
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
