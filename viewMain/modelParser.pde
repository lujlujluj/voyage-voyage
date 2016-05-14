        
    
    final class Parser {
     
      public String loadLastPicture() {
    
        String lines[] = loadStrings( "http://iconosquare.com/tag/paris" );
        println( "there are " + lines.length + " lines" );
      
        String[][] m = matchAll( join( lines, "" ), "image-wrapper.*?src=\"(.*?)\"" );
      
        if ( m == null ) {
      
          println( "Impossible de récupérer les URLs des images." );
          
          return null;
          
        } else {
      
          println( m.length + " URLs récupérée(s)." );
      
          for ( int i = 0; i < m.length; i++ ) {
      
            String[] m2 = match( m[i][1], "(.*)s150x150/(.*)" );
      
            if ( m2 != null )        
              m[i][1] = m2[1] + m2[2];
          }
      
          return m[1][1];
          
        }
        
      }
      
    }
    
    
