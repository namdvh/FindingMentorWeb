/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.controller;

import c4.fm.dao.UserDAO;
import c4.fm.subject.SubjectDAO;
import c4.fm.subject.SubjectDTO;
import c4.fm.user.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Khang
 */
public class LoadHomeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            UserDAO dao = new UserDAO();
            SubjectDAO subDAO = new SubjectDAO();
            List<UserDTO> Listrank = dao.ShowRank();

            UserDTO rank1 = Listrank.get(0);
            UserDTO rank2 = Listrank.get(1);
            UserDTO rank3 = Listrank.get(2);
            UserDTO rank4 = Listrank.get(3);
            UserDTO rank5 = Listrank.get(4);
            UserDTO rank6 = Listrank.get(5);

            int countSubtject = dao.countSubject();
            int countMentor = dao.countMentor();
            int countStudent = dao.countStudent();

            UserDTO user1 = dao.LoadMentor("");
            request.setAttribute("countSubtject", countSubtject);
            request.setAttribute("countMentor", countMentor);
            request.setAttribute("countStudent", countStudent);
            List<SubjectDTO> list = subDAO.ShowAllSubject();

            request.setAttribute("allSubject", list);

            request.setAttribute("rank1", rank1);
            request.setAttribute("rank2", rank2);
            request.setAttribute("rank3", rank3);
            request.setAttribute("rank4", rank4);
            request.setAttribute("rank5", rank5);
            request.setAttribute("rank6", rank6);
            request.setAttribute("rank", Listrank);
        } catch (Exception e) {
            log("Error at Load controller" + e.getMessage());
        } finally {
            request.getRequestDispatcher("home.jsp").forward(request, response);
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
