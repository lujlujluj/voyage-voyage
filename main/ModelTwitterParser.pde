        
    
    final class ModelTwitterParser {
      
      private String[] tweets; // Les tweets récupérés
      
      public String getTweet( int indexOfTweet ) {
        return tweets[indexOfTweet];
      }
  
      public void loadNewTweetsForTag( String inputTag ) {
        
        // On cherche le premier compte twitter selon un hashtag
        String lines[] = loadStrings( "https://twitter.com/search?f=users&q=" + inputTag );
        String[] m = match( join( lines, "" ), "js-action-profile-name\" href=\"/(.*?)\"" );
        
        // On récupère les derniers tweets du compte
        String lines2[] = loadStrings( "https://twitter.com/" + m[1] );
        String[][] m2 = matchAll( join( lines2, "" ), "data-aria-label-part=\"0\">(.*?)(<a href=\"https.*?\" rel=\"nofollow\"|</p>)" );
        
        if ( m2 == null ) {
      
          println( "Impossible de récupérer les tweets." );
          
        } else {
      
          println( m2.length + " tweet(s) récupéré(s)." );
          
          tweets = new String[m2.length];
          
          // On garde uniquement le contenu du tweet en dehors des balises HTML
          for ( int i = 0; i < m2.length; i++ ) {
            
            boolean dontCopy = false;
            tweets[i] = "";
            
            for ( int l = 0; l < m2[i][1].length(); l++) {
              
              if ( m2[i][1].charAt(l) == '<' )
                dontCopy = true;
              
              if ( !dontCopy )
                tweets[i] += m2[i][1].charAt(l);
              
              if ( m2[i][1].charAt(l) == '>' )
                dontCopy = false;
              
            }  
              
          }
          
        }
        
      }
      
    }
    
    
