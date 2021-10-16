package model.repository.impl;

import model.been.Customer;
import model.been.CustomerDisplay;
import model.been.CustomerType;
import model.been.EmployeeDisplay;
import model.repository.DBConnection;
import model.repository.ICustomerRepository;

import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements ICustomerRepository {
    private static final String SELECT_ALL_CUSTOMER = "CALL get_all_customer();";
    private static final String INSERT_CUSTOMER = "CALL insert_customer(?,?,?,?,?,?,?,?);";
    private static final String SELECT_ALL_CUSTOMER_TYPE = "SELECT * FROM customer_type;";
    @Override
    public List<CustomerDisplay> getListCustomer() {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement= null;
        ResultSet resultSet = null;
        List<CustomerDisplay> customerDisplayList = new ArrayList<>();
        if(connection != null) {
            try {
                callableStatement = connection.prepareCall(SELECT_ALL_CUSTOMER);
                resultSet = callableStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("customer_id");
                    String  customerType = resultSet.getString("customer_type_name");
                    String fullName = resultSet.getString("customer_name");
                    String birthDay = resultSet.getString("customer_birthday");
                    Boolean gender = resultSet.getBoolean("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phoneNumber = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    CustomerDisplay customerDisplay = new CustomerDisplay(id,customerType,fullName,birthDay,gender,
                            idCard,phoneNumber,email,address);
                    customerDisplayList.add(customerDisplay);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return customerDisplayList;
    }

    @Override
    public void addCustomer(Customer customer) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement= null;
        String birthDay = customer.getBirthDay();
        DateFormat from = new SimpleDateFormat("dd-MM-yyyy"); // current format
        DateFormat to   = new SimpleDateFormat("yyyy-MM-dd"); // wanted format
        String result = null;
        try {
            result = to.format(from.parse(birthDay));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        try {
            callableStatement = connection.prepareCall(INSERT_CUSTOMER);
            callableStatement.setInt(1,customer.getCustomerTypeId());
            callableStatement.setString(2,customer.getFullName());
            callableStatement.setString(3,result);
            callableStatement.setBoolean(4,customer.getGender());
            callableStatement.setString(5,customer.getIdCard());
            callableStatement.setString(6,customer.getPhoneNumber());
            callableStatement.setString(7,customer.getEmail());
            callableStatement.setString(8,customer.getAddress());

            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
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
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement= null;
        ResultSet resultSet = null;
        List<CustomerType> customerTypeList = new ArrayList<>();
        if(connection != null) {
            try {
                preparedStatement = connection.prepareCall(SELECT_ALL_CUSTOMER_TYPE);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("customer_type_id");
                    String  customerTypeName = resultSet.getString("customer_type_name");
                    CustomerType customerType = new CustomerType(id,customerTypeName);
                    customerTypeList.add(customerType);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return customerTypeList;
    }
}
