        
    
    final class ModelInstagramParser {
      
      private String[] picturesURL;
      
      public String getPictureURL( int indexOfPicture ) {
        return picturesURL[indexOfPicture];
      }
      
      public void loadNewPicturesForTag( String inputTag ) throws ParserException {
        
        // On récupère les dernières photos selon le hashtag
        String lines[] = loadStrings( "http://iconosquare.com/tag/" + inputTag );
        String[][] m = matchAll( join( lines, "" ), "image-wrapper.*?src=\"(.*?)\"" );
      
        if ( m == null ) {
          
          println( "Impossible de récupérer les URLs des images." );
          throw new ParserException();
          
        } else if ( m.length < 11 ) { // Trop peu d'images récupérées
        
          throw new ParserException();
          
        } else {
      
          println( m.length + " URLs récupérée(s)." );
          
          picturesURL = new String[m.length];
          
          // On récupère l'URL des images en plus haute résolution
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
    
    class ParserException extends Exception { 
    
      public ParserException() {
        System.out.println( "Pas assez de contenu disponible pour cette entrée." );
      }  
    
    }
    
