/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.OrderDBcontext;
import dal.OrderDetailDBcontext;
import dal.ShippingDBcontext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.LinkedHashMap;
import java.util.Map;
import model.Account;
import model.Cart;
import model.Order;
import model.Shipping;

/**
 *
 * @author Thanh Hai
 */
public class CheckOutController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet CheckOutController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOutController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       HttpSession session = request.getSession(false); // Không tạo session mới nếu không tồn tại
if (session != null && session.getAttribute("acc") != null) {
    // Người dùng đã đăng nhập, cho phép xem trang Checkout
    // Tiếp tục xử lý cho phần Checkout ở đây
      
            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
            if (carts == null) {
                carts = new LinkedHashMap<>();
            }

            //tinh tong tien
            double totalMoney = 0;
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                Integer productId = entry.getKey();
                Cart cart = entry.getValue();

                totalMoney += cart.getQuantity() * cart.getProduct().getPrice();

            }
            request.setAttribute("totalMoney", totalMoney);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
 
} else {
    // Người dùng chưa đăng nhập, chuyển hướng về trang đăng nhập
    response.sendRedirect(request.getContextPath() + "/login");
}

    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       response.setCharacterEncoding("UTF-8");
        String firtName = request.getParameter("firtName");
        String lastName = request.getParameter("lastName");
        String name =firtName+lastName;
        String phone = request.getParameter("phone");
        String address1 = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String note = request.getParameter("note");
        String address=address1+city+state+country;

        //lưu vào database
        //Lưu Shipping
        Shipping shipping = new Shipping( name, phone, address);

        int shippingId = new ShippingDBcontext().createReturnId(shipping); //trả về id tự tăng của bản ghi vừa lưu vào database
        //Lưu Order
        HttpSession session = request.getSession();
        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        //tinh tong tien
        double totalPrice = 0;
        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
            Integer productId = entry.getKey();
            Cart cart = entry.getValue();

            totalPrice += cart.getQuantity() * cart.getProduct().getPrice();

        }

        Account a = (Account)request.getSession().getAttribute("acc");
        Order order = new Order(a.getUid(),totalPrice,note,shippingId);
                
        int orderId = new OrderDBcontext().createReturnId(order);
        //Lưu OrderDetail

        new OrderDetailDBcontext().saveCart(orderId, carts);

        session.removeAttribute("carts");
        request.setAttribute("cartss", carts);
        request.setAttribute("totalPrice", totalPrice);
        request.getRequestDispatcher("orderthank.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
