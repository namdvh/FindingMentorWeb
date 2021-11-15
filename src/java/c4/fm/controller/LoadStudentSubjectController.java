/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.controller;

import c4.fm.user.UserDAO;
import c4.fm.subject.SubjectDAO;
import c4.fm.subject.SubjectDTO;
import c4.fm.user.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MSI
 */
@WebServlet(name = "LoadStudentSubjectController", urlPatterns = {"/LoadStudentSubjectController"})
public class LoadStudentSubjectController extends HttpServlet {

    private static final String PAGE = "studentEnroll.jsp";
    private static final String ERROR = "subjectManagement.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String subjectID = request.getParameter("SubjectID");
            SubjectDAO subjectDAO = new SubjectDAO();
            UserDAO studentDAO = new UserDAO();
            List<String> listUser = subjectDAO.loadListStudentEnroll(subjectID);
            List<UserDTO> listInfor = new ArrayList<>();
            if (!listUser.isEmpty()) {
                for (String userID : listUser) {
                    UserDTO student = studentDAO.getUserInfo(userID);
                    if (student.getStatus().equals("1")) {
                        listInfor.add(student);
                    }
                }
                SubjectDTO subjectDTO = subjectDAO.getSubjectAdmin(Integer.parseInt(subjectID));
                subjectDTO.setList(listInfor);
                session.setAttribute("LIST_STUDENT_ENROLL_SUBJECT", subjectDTO);
                url = PAGE;
            } else {
                String msg = "NO STUDENT ENROLLER";
                request.setAttribute("MSG_NO_STUDENT", msg);
            }
        } catch (Exception e) {
            log("Error at LoadStudentSubjectController: " + e.toString());
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
