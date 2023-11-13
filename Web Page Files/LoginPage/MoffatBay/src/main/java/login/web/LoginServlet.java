/* Author: Joel Avery
   Date: November 11, 2023
   Class: CSD 460 */

package login.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.bean.LoginBean;
import login.database.LoginDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }

    // Handle POST requests for user login
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the username and password from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create a LoginBean and set the username and password
        LoginBean loginBean = new LoginBean();
        loginBean.setUsername(username);
        loginBean.setPassword(password);

        try {
            if (loginDao.validate(loginBean)) {
                // Successful login, create a session attribute for the username
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                // Redirect to a login success page
                response.sendRedirect("loginsuccess.jsp");
            } else {
                // Unsuccessful login, set an error message and forward to the login page
                request.setAttribute("error", "Invalid credentials. Please try again.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            // Handle and log any class loading exceptions
            e.printStackTrace();
        }
    }
}
