package model.service.impl;

import model.been.*;
import model.repository.impl.EmployeeRepositoryImpl;
import model.service.IEmployeeService;

import java.util.List;

public class EmployeeServiceImpl implements IEmployeeService {
    EmployeeRepositoryImpl employeeRepository = new EmployeeRepositoryImpl();
    @Override
    public List<EmployeeDisplay> getListEmployee() {
        return employeeRepository.getListEmployee();
    }

    @Override
    public void addEmployee(Employee employee) {
employeeRepository.addEmployee(employee);
    }

    @Override
    public boolean editEmployee(Employee employee) {
        return employeeRepository.editEmployee(employee);
    }

    @Override
    public boolean deleteEmployee(int id) {
        return employeeRepository.deleteEmployee(id);
    }

    @Override
    public List<Position> getListPosition() {
        return employeeRepository.getListPosition();
    }

    @Override
    public List<Education> getListEducation() {
        return employeeRepository.getListEducation();
    }

    @Override
    public List<Division> getListDivision() {
        return employeeRepository.getListDivision();
    }
}
