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
 import java.sql.*;
 import java.util.*;


   public class ConnectionManager {

      static Connection con;
      static String url;
            
      public static Connection getConnection(){
         try{
            String url = "jdbc:mysql://sangeethraaj.com:3306/sangeethraaj_am"; 
            Class.forName("com.mysql.jdbc.Driver");
            try{            	
               con = DriverManager.getConnection(url,"sangeethraaj_amu","arunkumar");  
            }
            catch (SQLException ex){
               ex.printStackTrace();
            }
         }

         catch(ClassNotFoundException e){
            System.out.println(e);
         }

      return con;
    }
}
