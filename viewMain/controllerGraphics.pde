        
    
    final class Graphics {
      
      private PImage[] picturesToDisplay = new PImage[3];
      private int position = 800;
      private int nextPictureIndex = 4;
     
      public Graphics() {
      
        for ( int i = 0; i < 3; i++ ) {
        
          String pictureURL = parser.getPictureURL( i + 1 );
          println( pictureURL );
          
          PImage tmp = loadImage( pictureURL, "jpg" );
          picturesToDisplay[i] = new PImage( 600, 600 );
          picturesToDisplay[i].copy( tmp, 0, 0, tmp.width, tmp.height, 0, 0, 600, 600 );
          
          downsampling( i );
          picturesToDisplay[i].resize( 550, 550 );
        
        }
      
      }
      
      public PImage getPictureToDisplay( int indexOfPicture ) {
       
         return picturesToDisplay[indexOfPicture];
        
      }
      
      public int getPosition() {
        return position; 
      }
      
      public void updatePosition() {
       
        position -= 1;
        
        if ( position <= -550 ) {
      
          loadNewPicture();
          position = 0;
        
        }
        
      }
      
      private void loadNewPicture() {
        
        picturesToDisplay[0] = picturesToDisplay[1];
        picturesToDisplay[1] = picturesToDisplay[2];
        
        String pictureURL = parser.getPictureURL( nextPictureIndex );
        println( pictureURL );
        
        PImage tmp = loadImage( pictureURL, "jpg" );
        picturesToDisplay[2] = new PImage( 600, 600 );
        picturesToDisplay[2].copy( tmp, 0, 0, tmp.width, tmp.height, 0, 0, 600, 600 );
        
        downsampling( 2 );
        picturesToDisplay[2].resize( 550, 550 );
        
        nextPictureIndex++;
        if ( nextPictureIndex > 10 )
          nextPictureIndex = 1;
        
      }
     
      private void downsampling( int indexOfPicture ) {
  
        for ( int i = 0; i < 600; i += 5 ) {
      
          for ( int j = 0; j < 600; j += 8 ) {
      
            int firstPixel = i + 600 * j;
            int sumRed = 0, sumGreen = 0, sumBlue = 0;
      
            for ( int k = firstPixel; k < firstPixel + 5; k++ ) {
      
              for ( int l = 0; l < 8; l++ ) {
                
                sumRed += red( picturesToDisplay[indexOfPicture].pixels[k + l * 600] );
                sumGreen += green( picturesToDisplay[indexOfPicture].pixels[k + l * 600] );
                sumBlue += blue( picturesToDisplay[indexOfPicture].pixels[k + l * 600] );
                
              }
              
            }
            
            int areaColorRed = sumRed / 40;
            int areaColorGreen = sumGreen / 40;
            int areaColorBlue = sumBlue / 40;
            
            areaColorRed = areaColorRed * 100/255;
            areaColorGreen = areaColorGreen * 60/255;
            
            for ( int k = firstPixel; k < firstPixel + 5; k++ ) {
      
              for ( int l = 0; l < 8; l++ ) 
                picturesToDisplay[indexOfPicture].pixels[k + l * 600] = color( areaColorRed, areaColorGreen, areaColorBlue );
              
            }
            
          }
          
        }
      
      }
    
    }
    
    
