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
public class ClassDataBeans implements Serializable {

    public String getClassId() {
        return ClassId;
    }

    public void setClassId(String ClassId) {
        this.ClassId = ClassId;
    }

    public String getUserId() {
        return UserId;
    }

    public void setUserId(String UserId) {
        this.UserId = UserId;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }
   
    private String ClassId;
    private String UserId;
    private String Name;
    
    public ClassDataBeans() {   
    }
    

    
}
