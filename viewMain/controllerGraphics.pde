        
    
    final class Graphics {
      
      private PImage pictureToDisplay;
      private int nextPictureIndex = 1;
      private int nbRectsToDisplay = 0;
     
      public Graphics() {
        loadNewPicture();
      }
      
      public PImage getPictureToDisplay() {
         return pictureToDisplay;
      }
      
      public int getNbRectsToDisplay() {
        return nbRectsToDisplay; 
      }
      
      public void update() {
         
        nbRectsToDisplay += 5;
        if ( nbRectsToDisplay > 1980 ) {
          
          nbRectsToDisplay = 0;
          loadNewPicture();
        
        }
        
      }
      
      private void loadNewPicture() {
        
        String pictureURL = instagramParser.getPictureURL( nextPictureIndex );
        println( pictureURL );
        
        PImage tmp = loadImage( pictureURL, "jpg" );
        pictureToDisplay = new PImage( 600, 600 );
        pictureToDisplay.copy( tmp, 0, 0, tmp.width, tmp.height, 0, 0, 600, 600 );
        
        downsampling();
        pictureToDisplay.resize( 550, 550 );
        
        nextPictureIndex++;
        if ( nextPictureIndex == 5 )
          nextPictureIndex = 6;
        if ( nextPictureIndex > 11 )
          nextPictureIndex = 1;
        
      }

      public void displayRT() {
        
        instagramParser.loadNewPictures();
        nextPictureIndex = 1;
        nbRectsToDisplay = 0;
        loadNewPicture();
        
      }
     
      private void downsampling() {
  
        for ( int i = 0; i < 600; i += 5 ) {
      
          for ( int j = 0; j < 600; j += 8 ) {
      
            int firstPixel = i + 600 * j;
            int sumRed = 0, sumGreen = 0, sumBlue = 0;
      
            for ( int k = firstPixel; k < firstPixel + 5; k++ ) {
      
              for ( int l = 0; l < 8; l++ ) {
                
                sumRed += red( pictureToDisplay.pixels[k + l * 600] );
                sumGreen += green( pictureToDisplay.pixels[k + l * 600] );
                sumBlue += blue( pictureToDisplay.pixels[k + l * 600] );
                
              }
              
            }
            
            int areaColorRed = sumRed / 40;
            int areaColorGreen = sumGreen / 40;
            int areaColorBlue = sumBlue / 40;
            
            areaColorRed = areaColorRed * 100/255;
            areaColorGreen = areaColorGreen * 60/255;
            
            for ( int k = firstPixel; k < firstPixel + 5; k++ ) {
      
              for ( int l = 0; l < 8; l++ ) 
                pictureToDisplay.pixels[k + l * 600] = color( areaColorRed, areaColorGreen, areaColorBlue );
              
            }
            
          }
          
        }
      
      }
    
    }
    
    
