/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.controller;

import c4.fm.category.CategoryDAO;
import c4.fm.category.CategoryDTO;
import c4.fm.subject.SubjectDAO;
import c4.fm.subject.SubjectDTO;
import c4.fm.user.UserDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HuuToan
 */
public class ShowAllSubjectController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            SubjectDAO dao = new SubjectDAO();
            CategoryDAO cateDAO = new CategoryDAO();
            List<SubjectDTO> list = dao.ShowAllSubject();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            String userID = user.getUserID();
            
            List<CategoryDTO> listCate = cateDAO.loadListCate();
            List<SubjectDTO> listEnrolled = dao.ShowEnrollSubject(userID);
            List<SubjectDTO> listSubjectMentor = dao.listSubjectMentor(userID);
            if(request.getAttribute("ADD") != null){
                request.setAttribute("MESS_SUCCESS", "ADD");
            }
            if(request.getAttribute("duplicate")!= null){
                request.setAttribute("duplicate", "add");
            } 
            if(request.getAttribute("duplicate_request") != null){
                request.setAttribute("duplicate_request", "aaa");
            }
            
            request.setAttribute("listcate", listCate);
            session.setAttribute("listEnrolled", listEnrolled);
            session.setAttribute("LIST_MENTOR_SUBJECT", listSubjectMentor);
            session.setAttribute("allSubject", list);
            
        } catch (Exception e) {
            log("Error at show all subject" + e.getMessage());
        } finally {
            request.getRequestDispatcher("subjectManagement.jsp").forward(request, response);
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
