
    
    final class UserInput {
      
       public void textinput() {
        if (keyCode == BACKSPACE) {
          if (myText.length() > 0) {
            myText = myText.substring(0, myText.length()-1);
          }
        }else if(keyCode == RETURN || keyCode == ENTER){
           graphics.displayRT();
        } else if (keyCode == DELETE) {
          myText = "";
        } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
          myText = myText + key;
        } 
      }
    
   }