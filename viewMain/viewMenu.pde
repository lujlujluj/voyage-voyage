
  final class Menu {
    
    private PImage logo;
    
    public Menu(){
    }
    
    void displayMenu(){
      
      logo = loadImage("../ressources/logo.png");   
      image(logo, 101, 10);
     
      text("Where do you wanna to go today ? ", 100, 200);
 
      textAlign(LEFT, CENTER); 
      stroke( 60, 100 );
      for ( int i = 0; i < 600; i += 4 )
        line( 0, i, 800, i );
      
      fill( 220, 200, 255 );
      if(frameCursor<=16){
        text(inputText+"|", 100, 0, width, height);
      } else{
        text(inputText, 100, 0, width, height);
      }
      
      text("Press q to escape ", 100, 400);
   }
      
  }