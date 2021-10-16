package model.service;

import model.been.*;

import java.util.List;

public interface IEmployeeService {
    List<EmployeeDisplay> getListEmployee();
    void addEmployee(Employee employee);
    boolean editEmployee(Employee employee);
    boolean deleteEmployee(int id);
    List<Position> getListPosition();
    List<Education> getListEducation();
    List<Division> getListDivision();
}
