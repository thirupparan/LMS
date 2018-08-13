/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.controller;

import com.sgc.data.MainClassificationDao;
import com.sgc.model.MainClassification;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thirupparan
 */
@WebServlet(name = "EditMainClassificationController", urlPatterns = {"/EditMainClassificationController"})
public class EditMainClassificationController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditMainClassificationController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditMainClassificationController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        //processRequest(request, response);
        MainClassificationDao mainClassificationDao = new MainClassificationDao();
        MainClassification mainClassification = new MainClassification();
        String id = request.getParameter("mainClassificationId");
        String name = request.getParameter("classificationName");
        mainClassification.setMainClassificationId(request.getParameter("mainClassificationId"));
        mainClassification.setMainClassificationName(request.getParameter("classificationName"));
//        String mainID = request.getParameter("mainClassificationId");
//        String mainName = request.getParameter("classificationName");
        try {
//            mainClassificationDao.updateMainClassification(mainID,mainName);
            mainClassificationDao.updateMainClassification(mainClassification);
            RequestDispatcher dispatcher = request.getRequestDispatcher("./ViewMainClassificationController");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            Logger.getLogger(EditMainClassificationController.class.getName()).log(Level.SEVERE, null, e);
            //System.out.println("PreparedStatement Query Error: " + e.getMessage());

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