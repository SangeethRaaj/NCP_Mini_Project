/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import conn.ConnectionManager;
import conn.status;
import java.text.*;
import java.util.*;
import java.sql.*;
import loginn.UserBean;

/**
 *
 * @author Sangeeth
 */
public class ClassDAO {

    static Connection currentCon = null;
    static ResultSet rs = null;
    static ResultSet rs1 = null;
    
    public static boolean setNo(int n){
        
        Statement stmt = null;
        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            stmt.executeUpdate("UPDATE `currstats` SET `value`= "+n+" WHERE `stat`='classno'");
            return true;
            
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
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
        return false;
    }
    
    public static int getNo(){
        
        Statement stmt = null;
        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery("SELECT `value`,`stat` FROM `currstats` WHERE `stat` LIKE 'classno'");
            if (rs.next()) {
                String no = rs.getString("value");
                System.out.println("No is "+no);
                int n = Integer.parseInt(no);
                return n;
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
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
        return 0;
    }
    
    public static status addClass(UserBean bean, ClassBean c) {
        
        if(bean.isValid()){
            Statement stmt = null;
            String UserName = bean.getUserName();
            int n = getNo();
            System.out.println("n is " +n);
            String ClassId = "C"+n;
            String Name = c.getName();
            String searchQuery
                = "SELECT * FROM `classlist` WHERE Classid like'"
                + ClassId
                + "'";
            String insertQuery = "INSERT INTO `classlist`(`ClassId`, `UserName`, `Name`) VALUES ("
                + "'" + ClassId + "','" + UserName + "','" + Name + "')";
            
            try {
                currentCon = ConnectionManager.getConnection();
                stmt = currentCon.createStatement();
                rs = stmt.executeQuery(searchQuery);
                if (rs.next()) {
                    String s = "Class Id exists";
                    setNo(n+1);
                    return new status(false, s);
                }
                else{
                    stmt.executeUpdate(insertQuery);
                    setNo(n+1);
                    return new status(true, "Successful");
                }
            } catch (Exception e) {
                System.out.println(e);
            } finally {if (rs != null) {try {rs.close();} catch (Exception e) {}rs = null;}if (stmt != null) {try {stmt.close();} catch (Exception e) {}stmt = null;}
                if (currentCon != null) {try {currentCon.close();} catch (Exception e) {}currentCon = null;}}
        }
        
        return null;
    }

    public static ArrayList<ClassBean> getClasses(UserBean bean) {
        ArrayList<ClassBean> a = new ArrayList<ClassBean>();
        Statement stmt = null;
        String UserName = bean.getUserName();
        String searchQuery
                = "SELECT * FROM `classlist` WHERE UserName='"
                + UserName
                + "'";
        System.out.println("User name is " + UserName);
        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            int cnt = 0;
            while (rs.next()) {
                cnt++;
                String Name = rs.getString("Name");
                String ClassId = rs.getString("ClassId");

                ClassBean bb = new ClassBean();
                bb.setClassId(ClassId);
                bb.setName(Name);
                bb.setUserName(UserName);

                a.add(bb);
            }
            System.out.println("Size of arraList : "+cnt);
        } catch (Exception e) {
            System.out.println(e);
        } finally {if (rs != null) {try {rs.close();} catch (Exception e) {}rs = null;}if (stmt != null) {try {stmt.close();} catch (Exception e) {}stmt = null;
            }if (currentCon != null) {try {currentCon.close();} catch (Exception e) {}currentCon = null;}}
        return a;
    }
    
    public static ArrayList<ClassDataBeans> getParticipatingClasses(UserBean bean){
        ArrayList<ClassDataBeans> a = new ArrayList<ClassDataBeans>();
        Statement stmt = null;
        String UserName = bean.getUserName();
        String searchQuery = "SELECT * FROM `Studentslist` WHERE `SID` Like '"+UserName+"'";
        System.out.println("User name is " + UserName);
        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            int cnt = 0;
            while (rs.next()) {
                cnt++;
                String ClassID = rs.getString("ClassID");
                ClassDataBeans bb = getClass(ClassID);
                a.add(bb);
            }
            System.out.println("Size of arraList : "+cnt);
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
                stmt = null;
            }
            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                }
                currentCon = null;
        }}
        return a;
    }
    
    private static ClassDataBeans getClass(String ClassID){
        Statement stmt = null;
        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            String searchQuery = "SELECT * FROM `classlist` WHERE ClassId='"
                + ClassID
                + "'";
            rs1 = stmt.executeQuery(searchQuery);
            if (rs1.next()) {
                ClassDataBeans bb = new ClassDataBeans();
                bb.setClassId(ClassID);
                 String Name = rs1.getString("Name");
                bb.setName(Name);
                return bb;
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs1 != null) {
                try {
                    rs1.close();
                } catch (Exception e) {
                }
                rs1 = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
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
        return null;
    
    }

    public static status joinClass(UserBean bean, ClassBean c) {
        
        if(bean.isValid()){
            Statement stmt = null;
            String UserName = bean.getUserName();
            String ClassId = c.getClassId();
            String searchQuery
                = "SELECT * FROM `Studentslist` WHERE `SID` Like '"+UserName+"' AND `ClassID` LIKE '"+ClassId+"'";
            String insertQuery = "INSERT INTO `Studentslist`(`SID`, `ClassID`) VALUES ('"+UserName+"','"+ClassId+"')";
            
            try {
                currentCon = ConnectionManager.getConnection();
                stmt = currentCon.createStatement();
                rs = stmt.executeQuery(searchQuery);
                if (rs.next()) {
                    String s = "Already you belong to the class";
                    return new status(false, s);
                }
                else{
                    stmt.executeUpdate(insertQuery);
                    return new status(true, "Successful");
                }
            } catch (Exception e) {
                System.out.println(e);
            } finally {if (rs != null) {try {rs.close();} catch (Exception e) {}rs = null;}if (stmt != null) {try {stmt.close();} catch (Exception e) {}stmt = null;}
                if (currentCon != null) {try {currentCon.close();} catch (Exception e) {}currentCon = null;}}
        }
        
        return new status(false, "Error!!");

    }
}
