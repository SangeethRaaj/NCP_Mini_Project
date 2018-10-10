function validateform(){  
    var x=document.myform.code.value;  
     
       if(x.length<7){  
      alert("Course Code must be 7 characters long.");  
      return false;  
      } 
    var atposition=x.indexOf("@");  
    if(atposition<3){
    alert("No '@' present. Not a valid code");  
      return false;  
    }
    
    var sub1 = "cbe";
    var sub2 = "ban";
    var sub3 = "amt";
    if((x.indexOf(sub1) == -1)&&(x.indexOf(sub2) == -1)&&(x.indexOf(sub3) == -1)){
    alert("Enter a valid code");
    return false;
    }
    }