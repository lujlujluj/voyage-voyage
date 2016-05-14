        
    
    final class Graphics {
     
      public PImage downsampling( PImage img ) {
  
        for ( int i = 0; i < 600; i += 5 ) {
      
          for ( int j = 0; j < 600; j += 8 ) {
      
            int firstPixel = i + 600 * j;
            int sumRed = 0, sumGreen = 0, sumBlue = 0;
      
            for ( int k = firstPixel; k < firstPixel + 5; k++ ) {
      
              for ( int l = 0; l < 8; l++ ) {
                
                sumRed += red( img.pixels[k + l * 600] );
                sumGreen += green( img.pixels[k + l * 600] );
                sumBlue += blue( img.pixels[k + l * 600] );
                
              }
              
            }
            
            int areaColorRed = sumRed / 40;
            int areaColorGreen = sumGreen / 40;
            int areaColorBlue = sumBlue / 40;
            
            areaColorRed = areaColorRed * 120/255;
            areaColorGreen = areaColorGreen * 100/255;
            
            for ( int k = firstPixel; k < firstPixel + 5; k++ ) {
      
              for ( int l = 0; l < 8; l++ ) 
                img.pixels[k + l * 600] = color( areaColorRed, areaColorGreen, areaColorBlue );
              
            }
            
          }
          
        }
      
        return img;
      }
    
    }
    
    
