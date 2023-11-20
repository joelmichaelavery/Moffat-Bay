/* Author: Joel Avery
   Date: November 11, 2023
   Class: CSD 460 */

package login.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import login.bean.LoginBean;

public class LoginDao {
    // This method validates a user's login by checking the provided username and password
    public boolean validate(LoginBean loginBean) throws ClassNotFoundException {
        boolean status = false;

        // Load the MySQL JDBC driver class
        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/MoffatBayLodge?useSSL=false", "student1", "pass");

                // Step 2: Create a prepared statement using the connection object
                PreparedStatement preparedStatement = connection
                        .prepareStatement("select * from Guests where Email = ? and Password = ? ")) {
            // Set parameters for the SQL query using the user's username and password
            preparedStatement.setString(1, loginBean.getUsername());
            preparedStatement.setString(2, loginBean.getPassword());

            // Print the prepared SQL statement (for debugging)
            System.out.println(preparedStatement);

            // Execute the query and store the result set
            ResultSet rs = preparedStatement.executeQuery();

            // Check if the result set contains data (valid login)
            status = rs.next();

        } catch (SQLException e) {
            // Handle SQL exceptions and print error details
            printSQLException(e);
        }

        return status;
    }

    // This method prints details of SQL exceptions
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
}
