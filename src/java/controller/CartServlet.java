/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.MenuDAO;
import Model.Cart;
import Model.Item;
import Model.Product;;
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
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        Timestamp createdAt = new Timestamp(System.currentTimeMillis());
//        Timestamp updatedAt = new Timestamp(System.currentTimeMillis());
//
//        Product product = new Product(1, "Sản phẩm mẫu", "Mô tả sản phẩm mẫu", 100.0, 50, "http://example.com/image.jpg", 1, createdAt, updatedAt);
//        Product product1 = new Product(1, "Sản phẩm mẫu", "Mô tả sản phẩm mẫu", 100.0, 50, "http://example.com/image.jpg", 1, createdAt, updatedAt);
//        Product product2 = new Product(1, "Sản phẩm mẫu", "Mô tả sản phẩm mẫu", 100.0, 50, "http://example.com/image.jpg", 1, createdAt, updatedAt);
//        HttpSession session = request.getSession(true);
//        Cart cart = null;
//        Object o = session.getAttribute("cart");
//        String action = "";
//
//        if (o != null) {
//            cart = (Cart) o;
//        } else {
//            cart = new Cart();
//            action = request.getParameter("action");
//        }
//        String quantity = request.getParameter("productID");
//        String id = request.getParameter("quantity");
//
//        int num, Id;
//        try {
//            num = 4;
//            Id = product.getProduct_id();
////            num = Integer.parseInt(quantity);
////            Id = Integer.parseInt(id);
//            if (num == -1 && cart.getQuantityById(Id) <= 1) {
//                cart.removeItem(Id);
//            } else {
////                    MenuDAO M = new MenuDAO();
//                    Product p = new Product();
//                    double price = p.getPrice() * 1.2;
//                    Item i = new Item(p, price, num);
//                    cart.addItem(i);
//                }
//        } catch (Exception e) {
//            num = 1;
//        }
//        List<Item> list = cart.getItems();
//        session.setAttribute("cart", cart);
//        session.setAttribute("size", list.size());
//        request.getRequestDispatcher("cart.jsp").forward(request, response);
//
//    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }

        // Get action, product ID, and quantity from request
        String action = request.getParameter("action");
        String productIdStr = request.getParameter("productId");
        String quantityStr = request.getParameter("quantity");

        int productId, quantity;
        try {
            productId = 1;
            quantity = 2;
//            productId = Integer.parseInt(productIdStr);
//            quantity = Integer.parseInt(quantityStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID or quantity");
            return;
        }

        // Load product details (example: from database or predefined list)
        MenuDAO M = new MenuDAO();
        Product product = M.getProduct(productId); // Assume this method gets the product by ID
        if (product == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
            return;
        }

        // Handle the cart actions
        if ("increase".equals(action)) {
            cart.updateItemQuantity(productId, quantity);
        } else if ("decrease".equals(action)) {
            if (cart.getQuantityById(productId) > 1) {
                cart.updateItemQuantity(productId, quantity);
            } else {
                cart.removeItem(productId);
            }
        }

        // Update session and forward to cart.jsp
        List<Item> items = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", items.size());
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
