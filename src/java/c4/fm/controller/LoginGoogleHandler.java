/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.controller;

import c4.fm.user.UserDAO;
import c4.fm.logingoole.GoogleUtils;
import c4.fm.logingoole.UserGoogleDto;
import c4.fm.user.UserDTO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "LoginGoogleHandler", urlPatterns = {"/LoginGoogleHandler"})
public class LoginGoogleHandler extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        try {
            String code = request.getParameter("code");
            System.out.println(request.getParameter("code"));
            if (code == null || code.isEmpty()) {
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                dis.forward(request, response);
            } else {
                String accessToken = GoogleUtils.getToken(code);
                UserGoogleDto googlePojo = GoogleUtils.getUserInfo(accessToken);
                request.setAttribute("id", googlePojo.getId());
                request.setAttribute("name", googlePojo.getName());
                request.setAttribute("email", googlePojo.getEmail());
                String UserID = (String) request.getAttribute("email");
                String password = (String) request.getAttribute("id");
                UserDAO dao = new UserDAO();
                UserDTO user = dao.checkLogin(UserID, password);
                if (user != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("LOGIN_USER", user);
                    String RoleID = user.getRoleID();
                    if ("AD".equals(RoleID)) {
                        RequestDispatcher dis = request.getRequestDispatcher("admin.jsp");
                        dis.forward(request, response);
                    } else if ("US".equals(RoleID)) {
                        RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
                        dis.forward(request, response);
                    } else if ("MT".equals(RoleID)) {
                        RequestDispatcher dis = request.getRequestDispatcher("mentor.jsp");
                        dis.forward(request, response);
                    } else {
                        session.setAttribute("ERROR_MESSAGE", "Your role is not support");
                    }
                } else {
                    UserDTO userGoogle=new UserDTO(UserID, UserID, UserID, "US", "", "", password, "", "1", "");
                    UserDAO userDAO=new UserDAO();
                    userDAO.insertUserGoogle(userGoogle);
                    HttpSession session = request.getSession();
                    session.setAttribute("LOGIN_USER", userGoogle);
                    RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
                    dis.forward(request, response);
                }
            }
        } catch (Exception e) {
            log("Error at Login Google Controller" + e.toString());
        }
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
