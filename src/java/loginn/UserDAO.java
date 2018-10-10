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

import java.text.*;
import java.util.*;
import java.sql.*;

public class UserDAO 	
{
   static Connection currentCon = null;
   static ResultSet rs = null;  
   
   public static UserBean signup(UserBean bean) {

      //preparing some objects for connection 
      Statement stmt = null;    

      String UserName = bean.getUserName();    
      String Password = bean.getPassword();
      String Namee = bean.getName();
      String RollNo = bean.getRollNo();

      String searchQuery =
            "select * from userlist where UserName='"
                     + UserName
                     + "' AND Password='"
                     + Password
                     + "'";
      String insertQuery = "INSERT INTO `userlist`(`UserName`, `Password`, `Name`, `RollNo`) VALUES ("
              + "'"+UserName+"','"+Password+"','"+Namee+"','"+RollNo+"')";
      

   // "System.out.println" prints in the console; Normally used to trace the process
   System.out.println("User name is " + UserName);          
   System.out.println("User password is " + Password);
   System.out.println("Query: "+searchQuery);

   try 
   {
      //connect to DB 
      currentCon = ConnectionManager.getConnection();
      stmt=currentCon.createStatement();
      rs = stmt.executeQuery(searchQuery);	        
      boolean more = rs.next();

      // if user does not exist set the isValid variable to false
      if (!more) 
      {
         // SignUP happens here
          System.out.println("insert query : "+insertQuery);
          stmt.executeUpdate(insertQuery);
          System.out.println("Regestration Successful");
          bean.setValid(true);
      } 

      //if user exists set the isValid variable to true
      else if (more) 
      {
         String Name = rs.getString("Name");
//         String RollNo = rs.getString("RollNo");

         System.out.println("UserName " + Name+ " already taken");
//         bean.setName(Name);
//         bean.setRollNo(RollNo);
         bean.setValid(false);
      }
   } 

   catch (Exception ex) 
   {
      System.out.println("SignUp failed: An Exception has occurred! " + ex);
   } 

   //some exception handling
   finally 
   {
      if (rs != null)	{
         try {
            rs.close();
         } catch (Exception e) {}
            rs = null;
         }

      if (stmt != null) {
         try {
            stmt.close();
         } catch (Exception e) {}
            stmt = null;
         }

      if (currentCon != null) {
         try {
            currentCon.close();
         } catch (Exception e) {
         }

         currentCon = null;
      }
   }

    return bean;

   }
   
   public static UserBean login(UserBean bean) {

      //preparing some objects for connection 
      Statement stmt = null;    

      String username = bean.getUserName();    
      String password = bean.getPassword();   

      String searchQuery =
            "select * from userlist where UserName='"
                     + username
                     + "' AND Password='"
                     + password
                     + "'";

   // "System.out.println" prints in the console; Normally used to trace the process
   System.out.println("User name is " + username);          
   System.out.println("User password is " + password);
   System.out.println("Query: "+searchQuery);

   try 
   {
      //connect to DB 
      currentCon = ConnectionManager.getConnection();
      stmt=currentCon.createStatement();
      rs = stmt.executeQuery(searchQuery);	        
      boolean more = rs.next();

      // if user does not exist set the isValid variable to false
      if (!more) 
      {
         System.out.println("Sorry, you are not a registered user! Please sign up first");
         bean.setValid(false);
      } 

      //if user exists set the isValid variable to true
      else if (more) 
      {
         String Name = rs.getString("Name");
         String RollNo = rs.getString("RollNo");

         System.out.println("Welcome " + Name);
         bean.setName(Name);
         bean.setRollNo(RollNo);
         bean.setValid(true);
      }
   } 

   catch (Exception ex) 
   {
      System.out.println("Log In failed: An Exception has occurred! " + ex);
   } 

   //some exception handling
   finally 
   {
      if (rs != null)	{
         try {
            rs.close();
         } catch (Exception e) {}
            rs = null;
         }

      if (stmt != null) {
         try {
            stmt.close();
         } catch (Exception e) {}
            stmt = null;
         }

      if (currentCon != null) {
         try {
            currentCon.close();
         } catch (Exception e) {
         }

         currentCon = null;
      }
   }

    return bean;

   }	
}