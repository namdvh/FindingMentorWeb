/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.admin.controller;

import c4.fm.dao.UserDAO;
import c4.fm.subject.SubjectDAO;
import c4.fm.subject.SubjectDTO;
import c4.fm.user.UserDTO;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author cunpl
 */
@MultipartConfig
@WebServlet(name = "AddSubjectAdminServlet", urlPatterns = {"/AddSubjectAdminServlet"})
public class AddSubjectAdminServlet extends HttpServlet {
    private static final String ADMIN_PAGE = "LoadAdminServlet";
    
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
        String url = ADMIN_PAGE;
        try {
            UserDAO usdao = new UserDAO();
            String SubjectName = request.getParameter("subjectName");
//            String Image = request.getParameter("image");
            Part part = request.getPart("image");
            
            String UserId = request.getParameter("userId");
            String CategoryId = request.getParameter("categoryId");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            String Description = request.getParameter("description");
            
            String filename = SubjectName+".jpg";
            String realPath = request.getServletContext().getRealPath("/") + "SubjectImage" + File.separator + filename;
            System.out.println(realPath);
            File file = new File(realPath);
            FileUtils.copyInputStreamToFile(part.getInputStream(), file);
            
            SubjectDTO subject = new SubjectDTO(SubjectName, "SubjectImage" + File.separator + filename, UserId, CategoryId, Description, status);
            
            SubjectDAO subjectDao = new SubjectDAO();
            String msg = "";
            if(subjectDao.insertSubjectAdmin(subject)){
                msg = "Insert Success!";
            }
            request.setAttribute("ADDSUBJECT_MSG", msg);
            
            
        } catch (Exception e) {
            log("Error at AddSubjectAdminServlet:" + e.toString());
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
