/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginn;

/**
 *
 * @author Sangeeth
 */
public class UserBean {
	
    private String UserName;
    private String Password;
    private String Name;
    private String RollNo;
    public boolean valid;


    public String getName() {
       return Name;
      }

    public void setName(String newFirstName) {
       Name = newFirstName;
      }


    public String getRollNo() {
       return RollNo;
                      }

    public void setRollNo(String newLastName) {
       RollNo = newLastName;
                      }


    public String getPassword() {
       return Password;
      }

    public void setPassword(String newPassword) {
       Password = newPassword;
      }


    public String getUserName() {
       return UserName;
                      }

    public void setUserName(String newUsername) {
       UserName = newUsername;
                      }


    public boolean isValid() {
       return valid;
      }

    public void setValid(boolean newValid) {
       valid = newValid;
      }	
}
