package com.truongann.shopingcart.cart;

import com.truongann.shopingcart.business.Cart;
import com.truongann.shopingcart.business.LineItem;
import com.truongann.shopingcart.business.Product;
import com.truongann.shopingcart.data.ProductIO;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CartServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {




        HttpSession session = request.getSession();
        Cart cart;
        final Object lock = request.getSession().getId().intern();
        synchronized (lock){
            ServletContext sc = getServletContext();
            // get current action
            String action = request.getParameter("action");
            if (action == null) {
                action = "update";
            }
            String url = "/index.jsp";
            if (action.equals("shop")) {
                url = "/index.jsp";
            }
            else if (action.equals("showcart")) {
                url = "/cart.jsp";
                cart = (Cart) session.getAttribute("cart");
                if (cart == null) {
                    cart = new Cart();
                    session.setAttribute("cart", cart);
                }
            }
            else if (action.equals("cart") || action.equals("update")) {
                cart = (Cart) session.getAttribute("cart");
                String productCode = request.getParameter("productCode");
                String quantityString = request.getParameter("quantity");
                if (cart == null) {
                    cart = new Cart();
                }
                String path = sc.getRealPath("/WEB-INF/products.txt");
                Product product = ProductIO.getProduct(productCode, path);
                int quantity;
                try {
                    quantity = Integer.parseInt(quantityString);
                    if (quantity < 0) {
                        quantity = 1;
                    }
                    LineItem lineItem = new LineItem(product, quantity);
                    if (quantity > 0 )
                    {
                        cart.updateItem(lineItem);
                    } else if (quantity == 0) {
                        cart.removeItem(lineItem);
                    }
                } catch (NumberFormatException nfe) {
                    if(quantityString==null){
                        LineItem lineItem = new LineItem(product, 1);
                        cart.addItem(lineItem);
                    }
                }
                session.setAttribute("cart", cart);
                url = "/cart.jsp";
            }

            else if (action.equals("remove")) {
                RemoveProduct(request,response);
            }
            else if (action.equals("checkout")) {
                session.setAttribute("cart",new Cart());
                url = "/checkout.jsp";
            }
            sc.getRequestDispatcher(url)
                    .forward(request, response);
        }
    }

    private void RemoveProduct(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        System.out.println("remove");
        ServletContext sc = getServletContext();
        HttpSession session = request.getSession();
        String productCode = request.getParameter("productCode");
        String quantityString = request.getParameter("quantity");
        int quantity;
        try {
            quantity = Integer.parseInt(quantityString);
            if (quantity < 0) {
                quantity = 1;
            }
        } catch (NumberFormatException nfe) {
            quantity = 1;
        }
        String path = sc.getRealPath("/WEB-INF/products.txt");
        Product product = ProductIO.getProduct(productCode, path);
        LineItem lineItem = new LineItem();
        lineItem.setProduct(product);
        lineItem.setQuantity(quantity);
        Cart cart = (Cart) session.getAttribute("cart");
        cart.removeItem(lineItem);
        session.setAttribute("cart", cart);

        sc.getRequestDispatcher("/cart.jsp")
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

}
