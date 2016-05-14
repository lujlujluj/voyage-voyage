    
      
    private Parser parser = new Parser();
    private Graphics graphics = new Graphics();
    
    private PImage img = null, mask = null;
    
    
    public void setup() {
      
      size( 800, 600 );
    
      String pictureURL = parser.getPictureURL( 1 );
      println( pictureURL );
      
      PImage tmp = loadImage( pictureURL, "jpg" );
      img = new PImage( 600, 600 );
      img.copy( tmp, 0, 0, tmp.width, tmp.height, 0, 0, 600, 600 );
      
      img = graphics.downsampling( img );
      img.resize( 550, 550 );
      
      stroke( 60, 100 );
      
    }
     
    public void draw() {
      
      background( 0 );
      
      image( img, 125, 25 );
     
      for ( int i = 0; i < 600; i += 4 )
        line( 0, i, 800, i );
      
    }
    
    
