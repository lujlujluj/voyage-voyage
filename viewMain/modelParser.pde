        
    
    final class Parser {
      
      private String[] picturesURL;
      
      public Parser() {
       
        loadLastPictures();
        
      }
      
      public String getPictureURL( int indexOfPicture ) {
       
        return picturesURL[indexOfPicture];
        
      }
     
      private void loadLastPictures() {
    
        String lines[] = loadStrings( "http://iconosquare.com/tag/paris" );
        println( "there are " + lines.length + " lines" );
      
        String[][] m = matchAll( join( lines, "" ), "image-wrapper.*?src=\"(.*?)\"" );
      
        if ( m == null ) {
      
          println( "Impossible de récupérer les URLs des images." );
          
        } else {
      
          println( m.length + " URLs récupérée(s)." );
          
          picturesURL = new String[m.length];
      
          for ( int i = 0; i < m.length; i++ ) {
      
            String[] m2 = match( m[i][1], "(.*)s150x150/(.*)" );
      
            if ( m2 != null )        
              picturesURL[i] = m2[1] + m2[2];
            else
              picturesURL[i] = m[i][1];
              
          }
          
        }
        
      }
      
    }
    
    
