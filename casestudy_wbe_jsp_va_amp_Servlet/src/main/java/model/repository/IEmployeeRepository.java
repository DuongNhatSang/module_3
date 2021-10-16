package model.repository;

import model.been.*;

import java.util.List;

public interface IEmployeeRepository {
    List<EmployeeDisplay> getListEmployee();
    void addEmployee(Employee employee);
    boolean editEmployee(Employee employee);
    boolean deleteEmployee(int id);
    List<Position> getListPosition();
    List<Education> getListEducation();
    List<Division> getListDivision();
}
