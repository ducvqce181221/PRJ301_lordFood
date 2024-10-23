/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import model.Cart;
import model.Item;
import model.Product;
;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Truong Van Khang - CE181852
 */


public class CartServlet extends HttpServlet {

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
            out.println("<title>Servlet CartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartServlet at " + request.getContextPath() + "</h1>");
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
        doPost(request, response);
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
        HttpSession session = request.getSession(true);

        Cart cart = null;
        Object o = session.getAttribute("cart");

        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        String action = request.getParameter("action");
        String id = request.getParameter("productID");
        String quantity = request.getParameter("quantity");

        if (id == null || quantity == null) {
            throw new NullPointerException("Product ID or quantity is missing");
        }
        int num, Id;
        try {
            System.out.println("Khang - Product ID: " + id + ", Quantity: " + quantity + ",Acction " + action);
            Id = Integer.parseInt(id);
            num = Integer.parseInt(quantity);
            if (num == -1 && cart.getQuantityById(Id) <= 1) {
                cart.removeItem(Id);
            } else if ("increase".equalsIgnoreCase(action)) {
                Item i = CheckItem(num, Id);
                cart.addItem(i);
            } else if ("decrease".equalsIgnoreCase(action)) {
                Item e = CheckItem(num, Id);
                cart.DeleteItem(e);
            } else if ("delete".equalsIgnoreCase(action)) {
                cart.removeItem(Id);
            } else if ("deleteAll".equalsIgnoreCase(action)) {
                cart.removeAll();
            }
        } catch (NumberFormatException e) {
            System.out.println("Invalid number format for product ID or quantity.");
            num = 1;
        } catch (NullPointerException e) {
            System.out.println("A required object is null: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Item> list = cart.getItems();
        double totalMoney = cart.getTotalMoney();
        session.setAttribute("totalMoney", totalMoney);
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("cart.jsp").forward(request, response);

    }

    public Item CheckItem(int num, int Id) {
        ProductDAO M = new ProductDAO();
        Product p = M.getProduct(Id);
        if (p == null) {
            throw new NullPointerException("Product not found for ID: " + Id);
        }
        double price = p.getPrice() * 1.2;
        Item e = new Item(p, price, num);
        return e;
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
