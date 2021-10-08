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
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MSI
 */
public class CreateController extends HttpServlet {

    private static final String ERROR = "createUser.jsp";
    private static final String SUCCESS = "login.html";

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
            String Certificate = request.getParameter("Certificate");
            boolean check = true;
            if (UserID.length() > 20 || UserID.length() < 2) {
                userError.setUserIDError("UserID must from [2,10]!!");
                check = false;
            }
            if (CheckValidation.isValidEmailAddress(Email) != true) {

                userError.setEmailError("Email must have domain @123xxx.com");
                check = false;
            }

            if (CheckValidation.isValidPassword(Password) != true) {
                userError.setPasswordError("Password must [8,...],1 Upper char,not contain space and at least 1 speacial chars");
                check = false;
            }
            if (!Password.equals(confirm)) {
                userError.setConfirmPasswordError("Two password is not match");
                check = false;
            }
            if (check) {
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO(UserID, Email, Email, "US", "", "", Password, Certificate, "1", "");
                boolean checkInsert = dao.insertUseNew(user);
                if (checkInsert) {
                    url = SUCCESS;
                }
                if (RoleID.equals("MT")) {
                    dao.RequestMentor(user);
                }
                
            } else {
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
