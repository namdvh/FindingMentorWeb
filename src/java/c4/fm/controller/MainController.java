/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MSI
 */
public class MainController extends HttpServlet {

    private static final String LOGIN = "LoginController";
    private static final String LOGIN_PAGE = "login.html";
    private static final String ERROR = "error.jsp";
    private static final String LOGOUT = "LogoutController";
    private static final String CREATE = "CreateController";
    private static final String CREATE_PAGE = "createUser.jsp";
    private static final String UPDATE_USER_PAGE = "UpdateUserController";

    //==============BEGIN OF ADMIN===================
    private static final String LOAD_ADMIN_PAGE_SERVLET = "LoadAdminServlet";
    private static final String ADDSUBJECT_ADMIN_SERVLET = "AddSubjectAdminServlet";
    private static final String SEARCHSUBJECT_ADMIN_SERVLET = "SearchSubjectAdminServlet";
    private static final String UPDATESUBJECTPAGE_ADMIN_SERVLET = "UpdateSubjectPageAdminServlet";
    private static final String UPDATESUBJECT_ADMIN_SERVLET = "UpdateSubjectAdminServlet";
    private static final String LOAD_USER_PAGE_SERVLET = "LoadUserPageServlet";
    private static final String LOAD_MENTOR_PAGE_SERVLET = "LoadMentorPageServlet";
    private static final String SEARCHMENTOR_ADMIN_SERVLET = "SearchMentorAdminServlet";
    private static final String SEARCHUSER_ADMIN_SERVLET = "SearchUserAdminServlet";
    private static final String DELETE_USER_ADMIN_SERVLET = "DeleteUserAdminServlet";
    private static final String ACTIVE_USER_ADMIN_SERVLET = "ActiveUserAdminServlet";
    private static final String DELETE_MENTOR_ADMIN_SERVLET = "DeleteMentorAdminServlet";
    private static final String ACTIVE_MENTOR_ADMIN_SERVLET = "ActiveMentorAdminServlet";
    private static final String LOAD_APPROVE_PAGE = "LoadApprovePageServlet";
    private static final String SEARCHREQUEST_ADMIN_SERVLET = "SearchRequestAdminServlet";
    private static final String APPROVE_REQUEST_ADMIN_SERVLET = "ApproveRequestAdminServlet";
    private static final String DENAIL_REQUEST_ADMIN_SERVLET = "DenailRequestAdminServlet";
    //=======================END OF ADMIN==========================

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action == null) {

            } else if (action.equals("LoginPage")) {
                url = LOGIN_PAGE;
            } else if ("Login".equals(action)) {
                url = LOGIN;
            } else if ("Logout".equals(action)) {
                url = LOGOUT;
            } else if ("Create".equals(action)) {
                url = CREATE;
            } else if ("CreatePage".equals(action)) {
                url = CREATE_PAGE;
            } else if ("UpdateUserPage".equals(action)) {
                url = UPDATE_USER_PAGE;
            } //================BEGIN OF ADMIN============================
            else if (action.equals("AddSubjectAdmin")) {
                url = ADDSUBJECT_ADMIN_SERVLET;
            } else if (action.equals("searchSubjectAdmin")) {
                url = SEARCHSUBJECT_ADMIN_SERVLET;
            } else if (action.equals("updateSubjectPageAdmin")) {
                url = UPDATESUBJECTPAGE_ADMIN_SERVLET;
            } else if (action.equals("LoadAdminPage")) {
                url = LOAD_ADMIN_PAGE_SERVLET;
            } else if (action.equals("LoadUserPage")) {
                url = LOAD_USER_PAGE_SERVLET;
            } else if (action.equals("LoadMentorPage")) {
                url = LOAD_MENTOR_PAGE_SERVLET;
            } else if (action.equals("UpdateSubjectAdmin")) {
                url = UPDATESUBJECT_ADMIN_SERVLET;
            } else if (action.equals("searchMentor")) {
                url = SEARCHMENTOR_ADMIN_SERVLET;
            } else if (action.equals("SearchUser")) {
                url = SEARCHUSER_ADMIN_SERVLET;
            } else if (action.equals("deleteUserAdmin")) {
                url = DELETE_USER_ADMIN_SERVLET;
            } else if (action.equals("ActiveUserAdmin")) {
                url = ACTIVE_USER_ADMIN_SERVLET;
            } else if (action.equals("deleteMentorAdmin")) {
                url = DELETE_MENTOR_ADMIN_SERVLET;
            } else if (action.equals("ActiveMentorAdmin")) {
                url = ACTIVE_MENTOR_ADMIN_SERVLET;
            } else if (action.equals("LoadApprovePage")) {
                url = LOAD_APPROVE_PAGE;
            } else if (action.equals("SearchRequest")) {
                url = SEARCHREQUEST_ADMIN_SERVLET;
            } else if (action.equals("ApproveRequest")) {
                url = APPROVE_REQUEST_ADMIN_SERVLET;
            } else if (action.equals("DenailRequest")) {
                url = DENAIL_REQUEST_ADMIN_SERVLET;
            } //=====================END OF ADMIN==========================
            else {
                HttpSession session = request.getSession();
                session.setAttribute("ERROR_MESSAGE", "function is not available");
            }
        } catch (Exception e) {
            log("Error at MainController" + e.toString());
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
