/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.controller;

import c4.fm.requestSubject.requestSubjectDAO;
import c4.fm.requestSubject.requestSubjectDTO;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author Khang
 */
@MultipartConfig
public class RequestCreateSubjectController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "ShowAllSubjectController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        boolean check = false;
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String CourseName = request.getParameter("courseName");
            String categoryID = request.getParameter("categoryId");
            String description = request.getParameter("Description");
            Part part = request.getPart("images");

            requestSubjectDAO dao = new requestSubjectDAO();

            check = dao.checkDuplicateRequest(userID, CourseName);

            if (check) {
                String courseName1 = CourseName.replace("#", "a");
                String filename = courseName1 + userID + ".jpg";
                String realPath = request.getServletContext().getRealPath("/") + "IM" + File.separator + filename;
                System.out.println(realPath);
                File file = new File(realPath);
                FileUtils.copyInputStreamToFile(part.getInputStream(), file);
                requestSubjectDTO subject = new requestSubjectDTO(userID, CourseName, categoryID, "IM" + File.separator + filename, description, false);
                check = dao.RequestSubject(subject);
                if (check) {
                    url = SUCCESS;
                    request.setAttribute("ADD", "add");
                }
            }

        } catch (Exception e) {
            log("Error at request subject controller" + e.getMessage());
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
