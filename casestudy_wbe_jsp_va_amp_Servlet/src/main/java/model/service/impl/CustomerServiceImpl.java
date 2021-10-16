package model.service.impl;

import model.been.Customer;
import model.been.CustomerDisplay;
import model.been.CustomerType;
import model.been.EmployeeDisplay;
import model.repository.impl.CustomerRepositoryImpl;
import model.service.ICustomerService;

import java.util.List;

public class CustomerServiceImpl implements ICustomerService {
    CustomerRepositoryImpl customerRepository = new CustomerRepositoryImpl();
    @Override
    public List<CustomerDisplay> getListCustomer() {
        return customerRepository.getListCustomer();
    }

    @Override
    public void addCustomer(Customer customer) {
        customerRepository.addCustomer(customer);
    }

    @Override
    public boolean editCustomer(int id) {
        return false;
    }

    @Override
    public boolean deleteCustomer(int id) {
        return false;
    }

    @Override
    public List<CustomerType> getListCustomerType() {
        return customerRepository.getListCustomerType();
    }
}
