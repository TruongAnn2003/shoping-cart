package com.truongann.shopingcart.cart;

import com.truongann.shopingcart.business.Cart;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        ServletContext sc = getServletContext();

        // get current action
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        String url = "/index.jsp";
        if (action.equals("continue")) {
            url = "/index.jsp";    // the "index" page
        }
        sc.getRequestDispatcher(url)
                .forward(request, response);
        // perform action and set URL to appropriate page

    }
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
