    
    
    private Parser parser;
    private Graphics graphics;
    private UserInput userinput;

    private PFont Apple = null;
    private String myText = "Voyage voyage";
    
    public void setup() {
      
      size( 800, 600 );     
      stroke( 60, 100 );
      
      parser = new Parser();
      graphics = new Graphics();
      userinput = new UserInput();
      
      stroke( 60, 100 );
      noCursor();
      
      //Create font 
      printArray(PFont.list());
      Apple = createFont("../ressources/Apple.ttf", 24);
      textFont(Apple);
      textAlign(CENTER, CENTER);  
      
    }
    
    public void update() {}
     
    public void draw() {
      
      update();
      
      background( 0 );
      
      image( graphics.getPictureToDisplay(), 125, 25 );
     
      for ( int i = 0; i < 600; i += 4 )
        line( 0, i, 800, i );
        
      text(myText, 0, 0, width, height);
      
    }
    
    public void keyPressed() {
      userinput.textinput();
    }
    
    