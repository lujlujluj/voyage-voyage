        
    
    final class ModelYoutubeParser {
      
      private String songURL;
      
      public void loadNewSongForTag( String inputTag ) {
        
        // On cherche des musiques folk en fonction du hashtag et l'on récupère l'URL de la première vidéo
        String lines[] = loadStrings( "https://www.youtube.com/results?q=" + inputTag + "+folk+music&sp=EgIQAQ%253D%253D" );
        String[] m = match( join( lines, "" ), "<h3 class=\"yt-lockup-title \"><a href=\"(.*?)\"" );
        
        songURL = "https://www.youtube.com" + m[1];
        
      }
      
      public String getSongURL() {
        return songURL;
      }
      
    }
    
    
