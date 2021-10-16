package model.service;

import model.been.Customer;
import model.been.CustomerDisplay;
import model.been.CustomerType;
import model.been.EmployeeDisplay;

import java.util.List;

public interface ICustomerService {
    List<CustomerDisplay> getListCustomer();
    void addCustomer(Customer customer);
    boolean editCustomer(int id);
    boolean deleteCustomer(int id);
    List<CustomerType> getListCustomerType();
}
