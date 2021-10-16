package controller;

import model.been.*;
import model.service.impl.EmployeeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    EmployeeServiceImpl employeeService = new EmployeeServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createEmployee(request, response);
                break;
            case "edit":
                editEmployee(request,response);
                break;
            case "delete":
                deleteEmployee(request,response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                listEmployee(request,response);
    }
    private void listEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<EmployeeDisplay> employeeList = employeeService.getListEmployee();
        List<Position> positionList = employeeService.getListPosition();
        List<Education> educationList = employeeService.getListEducation();
        List<Division> divisionList = employeeService.getListDivision();
        request.setAttribute("employeeList",employeeList);
        request.setAttribute("positionList",positionList);
        request.setAttribute("educationList",educationList);
        request.setAttribute("divisionList",divisionList);
        request.getRequestDispatcher("/employee/list.jsp").forward(request,response);
    }
    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        String name = request.getParameter("Name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String cmnd = request.getParameter("CMND");
        Double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("SDT");
        String email = request.getParameter("Email");
        String address = request.getParameter("Address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationId = Integer.parseInt(request.getParameter("educationId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        Employee employee = new Employee(name, dateOfBirth, cmnd, salary, phone, email, address,positionId,educationId,divisionId);
        employeeService.addEmployee(employee);
        try {
            listEmployee(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.deleteEmployee(id);
        listEmployee(request,response);
    }
    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("Nameedit");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String cmnd = request.getParameter("CMND");
        Double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("SDT");
        String email = request.getParameter("Email");
        String address = request.getParameter("Address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationId = Integer.parseInt(request.getParameter("educationId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        Employee employee = new Employee(id,name, dateOfBirth, cmnd, salary, phone, email, address,positionId,educationId,divisionId);
        employeeService.editEmployee(employee);
        try {
            listEmployee(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
