/**
 * Modèle du parseur d'Instagram
 * On récupère les dernières photos liées au #
 */         
    
    final class ModelInstagramParser {
      
      private String[] picturesURL;
      
      /**
       * Getter URL photos
       * @import indexOfPicture
       * @return picturesURL[indexOfPicture] index de l'image
       */
      public String getPictureURL( int indexOfPicture ) {
        return picturesURL[indexOfPicture];
      }
      
      /**
       * Récupération des dernières photos via 
       * parsage d'une page htnl
       * @import inputTag
       */
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
    
    /**
     * Classe ParserException dérivée de Exeption
     * prévient l'utilisateur lorque le nombre de 
     * résultats n'est pas suffisant pour 
     * faire fonctionner l'application 
     */
    class ParserException extends Exception { 
    
      public ParserException() {
        System.out.println( "Pas assez de contenu disponible pour cette entrée." );
      }  
    
    }
    