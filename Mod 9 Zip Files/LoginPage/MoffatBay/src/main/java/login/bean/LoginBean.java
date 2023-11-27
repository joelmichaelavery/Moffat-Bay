/* Author: Joel Avery
   Date: November 11, 2023
   Class: CSD 460 */

package login.bean;

import java.io.Serializable;

public class LoginBean implements Serializable {
    private static final long serialVersionUID = 1L;

    private String username;
    private String password;

    // Getter for username field
    public String getUsername() {
        return username;
    }

    // Setter for username field
    public void setUsername(String username) {
        this.username = username;
    }

    // Getter for password field
    public String getPassword() {
        return password;
    }

    // Setter for password field
    public void setPassword(String password) {
        this.password = password;
    }
}
