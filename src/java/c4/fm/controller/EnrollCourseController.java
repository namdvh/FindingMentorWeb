/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.controller;

import c4.fm.registersubject.RegisterSubjectDAO;
import c4.fm.registersubject.RegisterSubjectDTO;
import c4.fm.user.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HuuToan
 */
public class EnrollCourseController extends HttpServlet {

   
    private static final String SUCCESS = "studentStudyPage.jsp";
    private static final String ERROR = "ShowAllSubjectController";

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
          String url = ERROR;
        boolean check = false;
        RegisterSubjectDAO dao = new RegisterSubjectDAO();
        RegisterSubjectDTO dto = new RegisterSubjectDTO();
        int subjectID = Integer.parseInt(request.getParameter("subjectId"));
        String warning = request.getParameter("status");
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
        try {
            if(warning.contains("0")){
                check = dao.checkValidRegister(user.getUserID(), subjectID);
                if(check = false){
                    dao.registerSubjectUser(subjectID, user.getUserID(), user.getName());
                    url = SUCCESS; // sua? cho nay vi code chay tam bay
                }     
            }
            if(warning.contains("1")){
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at EnrollCourseController" + e.toString());

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
