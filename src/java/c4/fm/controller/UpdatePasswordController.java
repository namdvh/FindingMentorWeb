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
import java.io.PrintWriter;
import static java.util.stream.Collectors.mapping;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HuuToan
 */
public class UpdatePasswordController extends HttpServlet {

    private static final String ERROR = "updateUser.jsp";
    private static final String SUCCESS = "updateUser.jsp";

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
        UserError userError = new UserError("", "", "", "", "", "", "", "", "");
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String UserID = loginUser.getUserID();
            String oldPassword = request.getParameter("OldPassword");
            String Password = request.getParameter("Password");
            String confirm = request.getParameter("ConfirmPassword");
            UserDAO dao = new UserDAO();
            UserDTO user = new UserDTO(UserID, Password);
            boolean check = true;
            boolean check2 = true;
            boolean check3 = true;

            if (loginUser == null) {
                url = ERROR;
            } else {
                //2 vs 3
                if (!Password.equals(confirm)) {
                    userError.setConfirmPasswordError("Two password is not match");
                    check = false;
                    request.setAttribute("USER_ERROR", userError);
                } else {
                    check = CheckValidation.isValidPassword(Password);
                    userError.setPasswordError("Password at least 8 character. \n "
                            + "1 Uppercase character, at least 1 number, not contain space \n"
                            + " and at least 1 speacial chars");   
                    request.setAttribute("submitFail3", "done");
                }
                //1 vs HT
                check2 = dao.checkOldPassword(UserID, oldPassword);
                if (check2 == false) {
                    request.setAttribute("submitFail2", "done");
                }
                //1 vs 2
                if (oldPassword.equals(Password)) {
                    check3 = false;
                    request.setAttribute("submitFail", "done");
                }
                if (check == true && check2 == true && check3 == true) {
                    boolean checkInsert = dao.updatePassword(UserID, Password);
                    if (checkInsert) {
                        url = SUCCESS;
                        request.setAttribute("submitDone", "done");
                    }
                } else {
                    request.setAttribute("UserID", UserID);

                }

            }

        } catch (Exception e) {
            e.printStackTrace();
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
