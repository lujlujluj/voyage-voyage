

    final class ControllerResults {
      
      public ControllerResults(){}
      
      public void update(){
        graphics.update();
      }
      
      public void textinput() {
        if (key == 'q' || key == 'Q') {
          screen = true;
          inputText = "";
        }
    
      }
   
    }