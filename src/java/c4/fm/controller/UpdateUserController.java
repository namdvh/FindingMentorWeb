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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HuuToan
 */
public class UpdateUserController extends HttpServlet {

    private static final String ERROR = "updateUser.jsp";
    private static final String SUCCESS = "LoadInforController";

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
            CheckValidation valid = new CheckValidation();
            String Name = request.getParameter("Name");
            String Email = request.getParameter("Email");
            String PhoneNumber = request.getParameter("phone");
            String Address = request.getParameter("Address");
            String BirthDay = request.getParameter("BirthDay");
            String Images = request.getParameter("Images");
            boolean check = true;
            if (Name.length() < 1) {
                userError.setNameError("Name can not black!!!");
                check = false;
            }
            if (CheckValidation.isValidEmailAddress(Email) != true) {
                userError.setEmailError("Email must have domain @123xxx.com");
                check = false;
            }
            if (CheckValidation.isValidPhoneNumber(PhoneNumber) != true) {
                userError.setPhoneNumberError("Phone number only have 10 digit");
                check = false;
            }
            if (Address.length() < 0 || Address.length() > 150) {
                userError.setPhoneNumberError("Your Address is too long");
                check = false;
            }
            if (BirthDay.length() < 0) {
                userError.setBirthdayError("Your Birthday is invalid, please input again!");
                check = false;
            }
            if (check) {
                HttpSession session = request.getSession();
                UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
                UserDAO usdao = new UserDAO();
                UserDTO usdto = new UserDTO(user.getUserID(), Name, Email, PhoneNumber, Address, BirthDay, Images);
                boolean checkupdate = usdao.updateUser(usdto);
                if (checkupdate) {
                    url = SUCCESS;
                    String msg = ("Update Successful");
                    request.setAttribute("UPDATE_SUCCESS", msg);
                } else {
                    url = ERROR;
                    request.setAttribute("UPDATE_ERROR", userError);
                }
            }

        } catch (Exception e) {
            log("Error at update user" + e.toString());
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