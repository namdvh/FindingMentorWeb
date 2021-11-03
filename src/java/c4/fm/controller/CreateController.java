/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.controller;

import c4.fm.dao.UserDAO;
import c4.fm.user.UserDTO;
import c4.fm.user.UserError;
import c4.fm.validation.CheckValidation;
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
 * @author MSI
 */
@MultipartConfig
public class CreateController extends HttpServlet {

    private static final String ERROR = "createUser.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError("", "", "", "", "", "", "", "", "");
        try {
            String UserID = request.getParameter("UserID");
            String Email = request.getParameter("UserID");
            String RoleID = request.getParameter("RoleID");
            String Password = request.getParameter("Password");
            String confirm = request.getParameter("ConfirmPassword");
//            String Certificate = request.getParameter("Certificate");
            Part part = request.getPart("Certificate");
            String filename = UserID+".jpg";
            String realPath = request.getServletContext().getRealPath("/") + "CV" + File.separator + filename;
            System.out.println(realPath);
            File file = new File(realPath);
            FileUtils.copyInputStreamToFile(part.getInputStream(), file);
            boolean check = true;
            if (UserID.length() > 20 || UserID.length() < 2) {
                userError.setUserIDError("UserID must from [2,10]!!");
                check = false;
            }
//            if (CheckValidation.isValidEmailAddress(Email) != true) {
//
//                userError.setEmailError("Email must have domain @123xxx.com");
//                check = false;
//            }

            if (CheckValidation.isValidPassword(Password) != true) {
                userError.setPasswordError("Password at least 8 character. \n "
                        + "1 Uppercase character, at least 1 number, not contain space \n"
                        + " and at least 1 speacial chars");
                check = false;
            }
            if (!Password.equals(confirm)) {
                userError.setConfirmPasswordError("Two password is not match");
                check = false;
            }
            if (check) {
                UserDAO dao = new UserDAO();
//                UserDTO user = new UserDTO(UserID, Email, Email, "US", "", "", Password, Certificate, "1", "");
                UserDTO user=new UserDTO(UserID, Email, Email, "US", "", "", Password, "CV" + File.separator + filename, "1", "", "");
                boolean checkInsert = dao.insertUseNew(user);
                if (checkInsert) {
                    url = SUCCESS;
                }
                if (RoleID.equals("MT")) {
                    dao.RequestMentor(user);
                }
                
            } else {
                request.setAttribute("UserID",UserID);
                request.setAttribute("USER_ERROR", userError);    
            }
        } catch (Exception e) {
            log("Error at CreateController:" + e.toString());
            if (e.toString().contains("duplicate")) {
                userError.setUserIDError("Duplicated UserID!!");
                request.setAttribute("USER_ERROR", userError);
            }
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
