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

        ServletContext sc = getServletContext();

        // get current action
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "update";  // default action
        }

        // perform action and set URL to appropriate page
        String url = "/index.jsp";
        if (action.equals("shop")) {
            url = "/index.jsp";    // the "index" page
        }
        else if (action.equals("cart")) {
            System.out.println("Add");
            String productCode = request.getParameter("productCode");
            String quantityString = request.getParameter("quantity");

            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }
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
            Boolean isfirst= true;
            for (LineItem l: cart.getItems()) {
                System.out.println(l.getProduct().getCode());
                System.out.println(product.getCode());
                if(l.getProduct().getCode().equals(product.getCode()) ){
                    System.out.println("quantity: "+quantity);
                    if (quantity > 0) {
                        l.setQuantity(l.getQuantity()+quantity);
                        cart.addItem(l);
                        isfirst=false;
                    }
                }
            }

            if(isfirst==true){
                //add new
                LineItem lineItem = new LineItem();
                lineItem.setProduct(product);
                lineItem.setQuantity(quantity);
                cart.addItem(lineItem);
            }
                isfirst=false;
            session.setAttribute("cart", cart);
            url = "/cart.jsp";
        } else if (action.equals("update")) {
            System.out.println("Update");
            String productCode = request.getParameter("productCode");
            String quantityString = request.getParameter("quantity");

            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");

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
            for (LineItem l: cart.getItems()) {
                if(l.getProduct().getCode().equals(product.getCode()) ){
                    if (quantity > 0) {
                        l.setQuantity(quantity);
                        cart.addItem(l);
                    } else if (quantity == 0) {
                        RemoveProduct(request,response);
                    }
                }
            }
            session.setAttribute("cart", cart);
            url = "/cart.jsp";
        } else if (action.equals("remove")) {
            RemoveProduct(request,response);
        }
        if (action.equals("checkout")) {
            url = "/checkout.jsp";
        }

        sc.getRequestDispatcher(url)
                .forward(request, response);
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
