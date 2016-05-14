    
    
    private Parser parser;
    private Graphics graphics; 
    
    public void setup() {
      
      size( 800, 600 );     
      stroke( 60, 100 );
      
      parser = new Parser();
      graphics = new Graphics();
      
    }
    
    public void update() {
      
    }
     
    public void draw() {
      
      update();
      
      background( 0 );
      
      image( graphics.getPictureToDisplay(), 125, 25 );
     
      for ( int i = 0; i < 600; i += 4 )
        line( 0, i, 800, i );
      
    }
    
    
