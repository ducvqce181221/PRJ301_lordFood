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
import model.ShippingMethod;

/**
 *
 * @author Truong Van Khang - CE181852
 */
public class ShippingMethodServlet extends HttpServlet {

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
            out.println("<title>Servlet ShippingMethodServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShippingMethodServlet at " + request.getContextPath() + "</h1>");
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

    private void showInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ShippingMethod> list = dao.ShippingMethodDAO.getAll();
        try {
            if (list != null) {
                request.setAttribute("ShippingMethod", list);
                request.getRequestDispatcher("managementShipMethod.jsp").forward(request, response);
            } else {
                System.out.println("Chuoi rong");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }
    }

    private void addPaymentMethod(HttpServletRequest request, HttpServletResponse response) {
        boolean Complete = false;
        String ShipMName = request.getParameter("ShipMName");
        try {
            if (check_Exist_Name(ShipMName) || !check_Name(ShipMName)) {
                HttpSession session = request.getSession(true);
                session.setAttribute("SMer", "Add Shipping Method Name Failed !!  Shipping Method Name already exists or invalid character.");
                showInfo(request, response);
                return;
            }
            Complete = dao.ShippingMethodDAO.addShipM(ShipMName);
            if (Complete) {
                showInfo(request, response);
            } else {
                System.out.println("Loi");
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void updatePaymentMethod(HttpServletRequest request, HttpServletResponse response) {
        boolean Complete = false;
        String ShipMID = request.getParameter("ShippId");
        String ShipMName = request.getParameter("ShipNameInput");
        try {
            if (check_Exist_Name(ShipMName) || !check_Name(ShipMName)) {
                HttpSession session = request.getSession(true);
                session.setAttribute("SMer", "Update Shipping Method Name Failed !!  Shipping Method Name already exists or invalid character.");
                showInfo(request, response);
                return;
            }
            Complete = dao.ShippingMethodDAO.updateShipMT(ShipMID, ShipMName);
            if (Complete) {
                showInfo(request, response);
            } else {
                System.out.println("Loi");
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        String ID = request.getParameter("id");
        try {
            if (dao.ShippingMethodDAO.deleteShipMT(ID)) {
                showInfo(request, response);
            }
        } catch (ServletException | IOException e) {
            System.out.println(e);
        }

    }

    private boolean check_Name(String ShipName) {
        return ShipName.matches("^[a-zA-Z\\s-]{3,50}$");
    }

    private boolean check_Exist_Name(String cateName) {
        List<ShippingMethod> list = dao.ShippingMethodDAO.getAll();
        for (ShippingMethod c : list) {
            if (c.getMethodName().equalsIgnoreCase(cateName)) {
                return true;
            }
        }
        return false;
    }

}
