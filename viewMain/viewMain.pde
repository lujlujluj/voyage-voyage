    
    
    private Parser parser;
    private Graphics graphics; 
    
    public void setup() {
      
      size( 800, 600 );     
      stroke( 60, 100 );
      
      parser = new Parser();
      graphics = new Graphics();
      
    }
    
    public void update() {
      graphics.updatePosition();
    }
     
    public void draw() {
      
      update();
      
      background( 0 );
      
      image( graphics.getPictureToDisplay( 0 ), graphics.getPosition(), 25 );
      image( graphics.getPictureToDisplay( 1 ), graphics.getPosition() + 550, 25 );
      image( graphics.getPictureToDisplay( 2 ), graphics.getPosition() + 1100, 25 );
     
      for ( int i = 0; i < 600; i += 4 )
        line( 0, i, 800, i );
      
    }
    
    
