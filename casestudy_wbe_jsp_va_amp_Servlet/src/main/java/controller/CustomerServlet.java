package controller;

import model.been.Customer;
import model.been.CustomerDisplay;
import model.been.CustomerType;
import model.been.EmployeeDisplay;
import model.service.impl.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private CustomerServiceImpl customerService = new CustomerServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "edit":
//                editCustomer(request,response);
                break;
            case "delete":
//                deleteCustomer(request,response);
                break;
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
//                showEditEmployee(request,response);
                break;
            case "delete":
//                showDeleteEmployee(request,response);
                break;
            default:
                listCustomer(request, response);
                break;

        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CustomerDisplay> customerDisplayList = customerService.getListCustomer();
        List<CustomerType> customerTypeList = customerService.getListCustomerType();
        request.setAttribute("customerDisplayList", customerDisplayList);
        request.setAttribute("customerTypeList", customerTypeList);
        request.getRequestDispatcher("/customer/list.jsp").forward(request, response);
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        Boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String name = request.getParameter("Name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String cmnd = request.getParameter("CMND");
        String phone = request.getParameter("SDT");
        String email = request.getParameter("Email");
        String address = request.getParameter("Address");
        int idLoaiKhach = Integer.parseInt(request.getParameter("CusTypeId"));
        Customer customer = new Customer(idLoaiKhach, name, dateOfBirth, gender, cmnd, phone, email, address);
        customerService.addCustomer(customer);
        try {
            listCustomer(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
