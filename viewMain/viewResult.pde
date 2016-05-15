

  final class Result {
    
    public Result(){
    }
    
    void displayResult(){
      
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
      /*if(frameCursor<=16){
        text(myText+"|", 0, 0, width, height);
      } else{
        text(myText, 0, 0, width, height);
      }*/
      
      text(twitterParser.getTweet(0), 0, 0, width, height);
   }
      
  }