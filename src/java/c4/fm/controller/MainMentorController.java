/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hoang
 */
@WebServlet(name = "MainMentorController", urlPatterns = {"/MainMentorController"})
public class MainMentorController extends HttpServlet {

    private static final String CREATE_CHAPTER = "CreateChapterController";
    private static final String LOAD_CHAPTER_CONTENT = "LoadChapterController";
    private static final String LOAD_STUDENT_SUBJECT = "LoadStudentSubjectController";
    private static final String LOAD_SUBJECT = "ShowAllSubjectController";
    private static final String CREATE_CONTENT = "CreateContentController";
    private static final String UPDATE_CHAPTER = "UpdateChapterController";
    private static final String UPDATE_CONTENT = "UpdateContentController";
    private static final String PAGE = "mentor.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = PAGE;
        try {
            String action = request.getParameter("action");
            if (action.equals("CreateChapter")) {
                url = CREATE_CHAPTER;
            } else if (action.equals("UpdateChapter")) {
                url = UPDATE_CHAPTER;
            } else if (action.equals("CreateContent")) {
                url = CREATE_CONTENT;
            } else if (action.equals("UpdateContent")) {
                url = UPDATE_CONTENT;
            } else if (action.equals("EditSubject")) {
                url = LOAD_CHAPTER_CONTENT;
            } else if (action.equals("ViewListStudent")) {
                url = LOAD_STUDENT_SUBJECT;
            } else if (action.equals("ShowAllSubjectController")) {
                url = LOAD_SUBJECT;
            }
        } catch (Exception e) {
            log("Error at main mentor controller" + e.toString());
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
