/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.admin.controller;

import c4.fm.dao.UserDAO;
import c4.fm.requestmentor.RequestMentorDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cunpl
 */
@WebServlet(name = "ApproveRequestAdminServlet", urlPatterns = {"/ApproveRequestAdminServlet"})
public class ApproveRequestAdminServlet extends HttpServlet {

    private static final String REQUESTMANAGE_PAGE = "requestMentorPage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = REQUESTMANAGE_PAGE;
        try {
            String requestId = request.getParameter("requestId");
            String userId = request.getParameter("userId");
            UserDAO userDao = new UserDAO();
            RequestMentorDAO RQDao = new RequestMentorDAO();
            String msg = "";
            if (userDao.updateUserRoleAdmin(userId)) {
                userDao.InsertFeedback(userId);
                RQDao.updateRequestStatusAdmin(Integer.parseInt(requestId));
                msg = "Approve Success! View At MentorManagement!";
                url = "MainController?action=SearchRequest&searchValue=";
            }
            request.setAttribute("APPROVE_MSG", msg);
        } catch (Exception e) {
            log("Error at ApproveRequestAdminServlet:" + e.toString());
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
