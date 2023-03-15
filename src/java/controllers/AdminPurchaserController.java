
package controllers;

import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import models.*;


public class AdminPurchaserController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Integer> AccountIdList = new AccountDAO().getAccountIdByRole(2);
        req.setAttribute("purlist", AccountIdList);
        req.setAttribute("contactDAO", new ContactDAO());
        req.setAttribute("accDAO", new AccountDAO());
        req.getRequestDispatcher("/admin-purchaser-account.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Account> accList = new AccountDAO().getAllAccounts();
       
        req.getRequestDispatcher("/admin-purchaser-account.jsp").forward(req, resp);
    }
    
}
