/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import model.PaymentMethod;

/**
 *
 * @author Truong Van Khang - CE181852
 */
public class PaymentMethodServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PaymentMethodServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentMethodServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        System.out.println(action);
        try {
            switch (action) {
                case "showInfo":
                    showInfo(request, response);
                    break;
                case "add":
                    addPaymentMethod(request, response);
                    break;
                case "update":
                    updatePaymentMethod(request, response);
                    break;
                case "delete":
                    delete(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
    private void showInfo(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {  
        try {
            List<PaymentMethod> list = dao.PaymentMethodDAO.getAll();
            if (list != null) {
                request.setAttribute("paymentMethods", list);
                request.getRequestDispatcher("managementPaymentMethod.jsp").forward(request, response);
            } else {
                System.out.println("Chuoi rong");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }
    }
    
    private void addPaymentMethod(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        boolean Complete = false;
        String PaymentMName = request.getParameter("PaymentMName");
        try {
            if (check_Exist_Name(PaymentMName) || !check_Name(PaymentMName)) {
                HttpSession session = request.getSession(true);
                session.setAttribute("PMer", "Add Payment Method Name Failed !!  Payment Method Name already exists or invalid character.");
                showInfo(request, response);
                return;
            }
            Complete = dao.PaymentMethodDAO.addPaymentM(PaymentMName);
            if (Complete) {
                showInfo(request, response);
            } else {
                System.out.println("Loi");
            }
        } catch (ServletException | IOException | SQLException e) {
            e.printStackTrace();
        }
    }
    
    private boolean check_Name(String cateName) {
        return cateName.matches("^[a-zA-Z\\s-]{3,50}$");
    }
    
    private boolean check_Exist_Name(String cateName) {
        List<PaymentMethod> list = dao.PaymentMethodDAO.getAll();
        for (PaymentMethod c : list) {
            if (c.getPaymentMethName().equalsIgnoreCase(cateName)) {
                return true;
            }
        }
        return false;
    }
    
    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String ID = request.getParameter("id");
        try {
            if (dao.PaymentMethodDAO.deletePaymentMT(ID)) {
                showInfo(request, response);
            }  
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }
    }
    
    private void updatePaymentMethod(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        boolean Complete = false;
        String PaymentMID = request.getParameter("PaymentMID");
        String PaymentMName = request.getParameter("PaymentMName");
        System.out.println(PaymentMID);
        System.out.println(PaymentMName);
        try {
            if (check_Exist_Name(PaymentMName) || !check_Name(PaymentMName)) {
                HttpSession session = request.getSession(true);
                session.setAttribute("PMer", "Update Payment Method Name Failed !!  Payment Method Name already exists or invalid character.");
                showInfo(request, response);
                return;
            }
            Complete = dao.PaymentMethodDAO.updatePaymentMT(PaymentMID, PaymentMName);
            if (Complete) {
                showInfo(request, response);
            } else {
                System.out.println("Loi");
            }
        } catch (ServletException | IOException | SQLException e) {
            e.printStackTrace();
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
