
    
    final class ControllerMenu {
      
      public ControllerMenu(){}
      
       public void textinput() {
        if (keyCode == BACKSPACE) {
          if (inputText.length() > 0) {
            inputText = inputText.substring(0, inputText.length()-1);
          }
        }else if(keyCode == RETURN || keyCode == ENTER){
          if (instagramParser == null && twitterParser == null){
             instagramParser = new InstagramParser();
             twitterParser = new TwitterParser();
             screen = false;
          }
          if (graphics == null){
            graphics = new Graphics();
            screen = false;
          }
          else{
            graphics.displayRT();
            screen = false;
          }
        } else if (keyCode == DELETE) {
          inputText = "";
        } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
          inputText = inputText + key;
        }

      }
    
   }