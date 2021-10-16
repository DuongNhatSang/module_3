package model.repository.impl;

import model.been.*;
import model.repository.DBConnection;
import model.repository.IEmployeeRepository;

import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements IEmployeeRepository {

    private static final String SELECT_ALL_EMPLOYEE = "CALL get_all_employee();";
    private static final String SELECT_POSITION = "SELECT * FROM position;";
    private static final String SELECT_EDUCATION = "SELECT * FROM education_degree;";
    private static final String SELECT_DIVISION = "SELECT * FROM division;";
    private static final String INSERT_EMPLOYEE = "CALL insert_employee(?,?,?,?,?,?,?,?,?,?);";
    private static final String DELETE_EMPLOYEE = "DELETE FROM employee WHERE employee.employee_id = ?;";
    private static final String UPDATE_EMPLOYEE = "CALL update_employee(?,?,?,?,?,?,?,?,?,?,?);";

    @Override
    public List<EmployeeDisplay> getListEmployee() {
        Connection connection = DBConnection.getConnection();
        CallableStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<EmployeeDisplay> employeeList = new ArrayList<>();
        if (connection != null) {
            try {
                preparedStatement = connection.prepareCall(SELECT_ALL_EMPLOYEE);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("employee_id");
                    String employeeName = resultSet.getString("employee_name");
                    String employeeBirthday = resultSet.getString("employee_birthday");
                    String employeeIdCard = resultSet.getString("employee_id_card");
                    Double employeeSalary = resultSet.getDouble("employee_salary");
                    String employeePhone = resultSet.getString("employee_phone");
                    String employeeEmail = resultSet.getString("employee_email");
                    String employeeAddress = resultSet.getString("employee_address");
                    String positionName = resultSet.getString("position_name");
                    String educationDegreeName = resultSet.getString("education_degree_name");
                    String divisionName = resultSet.getString("division_name");
                    EmployeeDisplay employee = new EmployeeDisplay(id, employeeName, employeeBirthday, employeeIdCard, employeeSalary,
                            employeePhone, employeeEmail, employeeAddress, positionName, educationDegreeName, divisionName);
                    employeeList.add(employee);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return employeeList;
    }

    @Override
    public void addEmployee(Employee employee) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        String birthDay = employee.getBirthDay();
        DateFormat from = new SimpleDateFormat("dd-MM-yyyy"); // current format
        DateFormat to = new SimpleDateFormat("yyyy-MM-dd"); // wanted format
        String result = null;
        try {
            result = to.format(from.parse(birthDay));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        try {
            callableStatement = connection.prepareCall(INSERT_EMPLOYEE);
            callableStatement.setString(1, employee.getFullName());
            callableStatement.setString(2, result);
            callableStatement.setString(3, employee.getIdCard());
            callableStatement.setDouble(4, employee.getSalary());
            callableStatement.setString(5, employee.getPhoneNumber());
            callableStatement.setString(6, employee.getEmail());
            callableStatement.setString(7, employee.getAddress());
            callableStatement.setInt(8, employee.getPositionId());
            callableStatement.setInt(9, employee.getEducationDegreeId());
            callableStatement.setInt(10, employee.getDivisionId());

            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public boolean editEmployee(Employee employee) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        boolean bool = false;
        String birthDay = employee.getBirthDay();
        DateFormat from = new SimpleDateFormat("dd-MM-yyyy"); // current format
        DateFormat to = new SimpleDateFormat("yyyy-MM-dd"); // wanted format
        String result = null;
        try {
            result = to.format(from.parse(birthDay));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if (connection != null) {
            try {
                callableStatement = connection.prepareCall(UPDATE_EMPLOYEE);
                callableStatement.setInt(1,employee.getIdNumber());
                callableStatement.setString(2,employee.getFullName());
                callableStatement.setString(3,result);
                callableStatement.setString(4,employee.getIdCard());
                callableStatement.setDouble(5,employee.getSalary());
                callableStatement.setString(6,employee.getPhoneNumber());
                callableStatement.setString(7,employee.getEmail());
                callableStatement.setString(8,employee.getAddress());
                callableStatement.setInt(9,employee.getPositionId());
                callableStatement.setInt(10,employee.getEducationDegreeId());
                callableStatement.setInt(11,employee.getDivisionId());
                callableStatement.executeUpdate();
                bool = callableStatement.executeUpdate() > 0;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return bool;
    }

    @Override
    public boolean deleteEmployee(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        boolean bool = false;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareCall(DELETE_EMPLOYEE);
                preparedStatement.setInt(1, id);
                bool = preparedStatement.executeUpdate() > 0;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return bool;
    }

    @Override
    public List<Position> getListPosition() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Position> positionList = new ArrayList<>();
        if (connection != null) {
            try {
                preparedStatement = connection.prepareCall(SELECT_POSITION);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("position_id");
                    String positionName = resultSet.getString("position_name");
                    Position position = new Position(id, positionName);
                    positionList.add(position);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return positionList;
    }

    @Override
    public List<Education> getListEducation() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Education> educationList = new ArrayList<>();
        if (connection != null) {
            try {
                preparedStatement = connection.prepareCall(SELECT_EDUCATION);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("education_degree_id");
                    String educationName = resultSet.getString("education_degree_name");
                    Education education = new Education(id, educationName);
                    educationList.add(education);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return educationList;
    }

    @Override
    public List<Division> getListDivision() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Division> divisionList = new ArrayList<>();
        if (connection != null) {
            try {
                preparedStatement = connection.prepareCall(SELECT_DIVISION);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("division_id");
                    String educationName = resultSet.getString("division_name");
                    Division division = new Division(id, educationName);
                    divisionList.add(division);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return divisionList;
    }
}
