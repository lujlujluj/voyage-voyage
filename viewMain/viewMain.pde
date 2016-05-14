    
    
    private Parser parser;
    private Graphics graphics;
    private UserInput userinput;

    private PFont Apple = null;
    private String myText = "Voyage voyage";
    private int frameCursor = 0;
    
    public void setup() {
      
      size( 800, 600 );
      
      parser = new Parser();
      graphics = new Graphics();
      userinput = new UserInput();
      
      stroke( 60, 100 );
      noCursor();
      
      // Create font 
      printArray(PFont.list());
      Apple = createFont("../ressources/Apple.ttf", 24);
      textFont(Apple);
      textAlign(LEFT, CENTER);  

    }
    
    public void update() {
      graphics.update();
      
      frameCursor++;
      if(frameCursor>32)
        frameCursor = 0;
    }
     
    public void draw() {
      
      update();
      
      background( 0 );
      
      image( graphics.getPictureToDisplay(), 125, 25 );

      noStroke();
      fill( 0 );
      int k = 0;
      for ( int j = 25; j < 575; j += 15 ) {
        for ( int i = 125; i < 675; i += 10 ) {
          if ( k >= graphics.getNbRectsToDisplay() )
            rect( i, j, 10, 15 );
          k++;
        }
      }
      
      stroke( 60, 100 );
      for ( int i = 0; i < 600; i += 4 )
        line( 0, i, 800, i );
      
      fill( 220, 200, 255 );
      if(frameCursor<=16){
        text(myText+"|", 0, 0, width, height);
      } else{
        text(myText, 0, 0, width, height);
      }
      
    }
    
    public void keyPressed() {
      userinput.textinput();
    }
    
    