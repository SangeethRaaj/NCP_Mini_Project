/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.beans.*;
import java.io.Serializable;

/**
 *
 * @author Sangeeth
 */
public class ClassBean implements Serializable {
    
    public static final String PROP_SAMPLE_PROPERTY = "sampleProperty";
    
    private String ClassId;
    private String UserName;
    private String Name;
    
    public ClassBean() {
        
    }
    
    public void setClassId(String s){
        this.ClassId = s;
    }
    
    public String getClassId(){
        return ClassId;
    }
    
    public String getUserName(){
        return UserName;
    }
    
    public void setUserName(String s){
        this.UserName = s;
    }
    
    public String getName(){
    return this.Name;
    }
    
    public void setName(String s){
        this.Name = s;
    }
    
}
