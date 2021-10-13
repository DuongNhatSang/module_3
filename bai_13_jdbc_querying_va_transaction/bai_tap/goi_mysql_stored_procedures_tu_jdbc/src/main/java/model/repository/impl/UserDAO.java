package model.repository.impl;

import model.been.User;
import model.repository.IUserDAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo2?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "nhathuy321";

    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String ADD_USERS_SQL = "INSERT INTO users (id, name, email, country) VALUES (?, ?, ?, ?);";

    public UserDAO() {
    }
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public User selectUser(int id) {
        User user = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    public List<User> selectAllUsers() {
        Connection connection = getConnection();
        CallableStatement callableStatement = null;
        List<User> users = new ArrayList<>();
        ResultSet resultSet = null;
        if(connection != null){
            try {
                callableStatement = connection.prepareCall("call getListUser()");
                callableStatement.executeQuery();
                resultSet = callableStatement.getResultSet();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");
                    users.add(new User(id, name, email, country));
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
        }

        return users;
    }

    public boolean deleteUser(int id) throws SQLException {
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall("call deleteUser(?)");
        boolean rowDeleted = false;
        if(connection != null) {
            try{
                callableStatement.setInt(1, id);
                rowDeleted = callableStatement.executeUpdate() > 0;
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        return rowDeleted;
    }

    public boolean updateUser(User user) throws SQLException {
        Connection connection = getConnection();
        CallableStatement callableStatement = null;
        boolean rowUpdated = false;
        try {
            callableStatement = connection.prepareCall("call updateUser(?,?,?,?)");
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());


            rowUpdated = callableStatement.executeUpdate() > 0;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
    public void addUserTransaction() throws SQLException{
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        boolean rowAdd = false;
        if(connection != null){
            try {
                connection.setAutoCommit(false);
                preparedStatement = connection.prepareStatement(ADD_USERS_SQL);
                preparedStatement.setInt(1,3);
                preparedStatement.setString(2, "dd");
                preparedStatement.setString(3, "mmm");
                preparedStatement.setString(4, "rrr");
                preparedStatement.executeUpdate();
                preparedStatement = connection.prepareStatement(ADD_USERS_SQL);
                preparedStatement.setInt(1,2);
                preparedStatement.setString(2, "aa");
                preparedStatement.setString(3, "bbb");
                preparedStatement.setString(4, "ttt");
                preparedStatement.executeUpdate();
                connection.commit();
            }catch (SQLException e){
                e.printStackTrace();
                connection.rollback();
            }
        }
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        try {
            userDAO.addUserTransaction();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
