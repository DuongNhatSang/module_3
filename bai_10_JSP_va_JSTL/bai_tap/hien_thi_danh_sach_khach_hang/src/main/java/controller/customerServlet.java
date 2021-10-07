package controller;

import model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "customerServlet",value = {"","/listCustomer"})
public class customerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Nguyễn Văn A","10/10/2000","Đà Nẵng",""));
        customerList.add(new Customer("Nguyễn Văn B","10/10/2000","Đà Nẵng",""));
        customerList.add(new Customer("Nguyễn Văn C","10/10/2000","Đà Nẵng",""));
        customerList.add(new Customer("Nguyễn Văn D","10/10/2000","Đà Nẵng",""));
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("ListCustomer.jsp").forward(request,response);
    }
}
