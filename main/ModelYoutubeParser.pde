/**
 * Modèle du parseur de youtube
 * On se connecte à youtube ajoutant "musique folk #tag" dans l'URL
 * Puis on récupère le lien du premier résultat
 */        
    
    final class ModelYoutubeParser {
      
      private String songURL;
      
      /**
       * Récupération d'une URL youtube correspont au tag 
       * via parsage d'une page HTML
       * @import inputTag
       */
      public void loadNewSongForTag( String inputTag ) throws ParserException {
        
        // On cherche des musiques folk en fonction du hashtag et l'on récupère l'URL de la première vidéo
        String lines[] = loadStrings( "https://www.youtube.com/results?q=" + inputTag + "+folk+music&sp=EgIQAQ%253D%253D" );
        String[] m = match( join( lines, "" ), "<h3 class=\"yt-lockup-title \"><a href=\"(.*?)\"" );
        
        if ( m == null ) {
          
          println( "Impossible de récupérer la bande son." );
          throw new ParserException();
          
        } else
          songURL = "https://www.youtube.com" + m[1];
        
      }
      
      /**
       * Getter URL
       * @return songURL
       */
      public String getSongURL() {
        return songURL;
      }
      
    }
    
    