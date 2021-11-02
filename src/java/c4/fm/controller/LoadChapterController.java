/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.controller;

import c4.fm.dao.ChapterDAO;
import c4.fm.dao.ContentDAO;
import c4.fm.subject.ChapterDTO;
import c4.fm.subject.ContentDTO;
import c4.fm.user.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "LoadChapterController", urlPatterns = {"/LoadChapterController"})
public class LoadChapterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String PAGE = "mentor.jsp";
    private static final String PAGELOGIN = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = PAGE;
        try {
            HttpSession session = request.getSession();
            int subjectID = 0;
            if (session.getAttribute("MENTOR_SUBJECT") != null) {
                subjectID = (int) session.getAttribute("MENTOR_SUBJECT");
            } else {
                subjectID = Integer.parseInt(request.getParameter("SubjectID"));
            }
            String subjectName = request.getParameter("SubjectName");
            session.setAttribute("SUBJECT_ID", subjectID);
            session.setAttribute("SUBJECT_NAME", subjectName);
            ChapterDAO chapterDAO = new ChapterDAO();
            List<ChapterDTO> listChapter = chapterDAO.LoadListChapter(subjectID);
            ContentDAO contentDAO = new ContentDAO();
            for (ChapterDTO chapter : listChapter) {
                List<ContentDTO> listContent = contentDAO.LoadListContent(chapter.getChapterID());
                if (listContent != null) {
                    chapter.setList(listContent);
                }
            }
            request.setAttribute("LIST_CHAPTER", listChapter);
        } catch (Exception e) {
            log("Error at load detail subject" + e.toString());
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
