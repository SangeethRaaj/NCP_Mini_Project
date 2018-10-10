function validateSignUpForm(){  
  var name=document.signupf.fname.value;  
  var password=document.signupf.pwd.value;  

  if (name==null || name==""){  
    alert("Name can't be blank");  
    return false;  
  }else if(password.length<6){  
    alert("Password must be at least 6 characters long.");  
    return false;  
  }  
}  

function validateLoginForm(){  
  var email=document.logina.fname.value;  
  var password=document.signupf.pwd.value;
  if (email==null || name==""){  
    alert("Name can't be blank");  
    return false;  
  }else if(password.length<6){  
    alert("Password must be at least 6 characters long.");  
    return false;  
  }  
}  