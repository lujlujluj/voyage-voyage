        
    
    final class TwitterParser {
      
      private String[] tweets;
      
      public TwitterParser() {
        loadLastTweets();
      }
      
      public void loadNewTweets() {
        loadLastTweets();
      }
      
      public String getTweet( int indexOfTweet ) {
       
        return tweets[indexOfTweet];
        
      }
     
      private void loadLastTweets() {
    
        String lines[] = loadStrings( "https://twitter.com/search?f=users&q=" + myText );
        println( "there are " + lines.length + " lines" );
        
        String[] m = match( join( lines, "" ), "js-action-profile-name\" href=\"/(.*?)\"" );

        String lines2[] = loadStrings( "https://twitter.com/" + m[1] );
        println( "there are " + lines2.length + " lines" );
        
        String[][] m2 = matchAll( join( lines2, "" ), "data-aria-label-part=\"0\">(.*?)<a href=\"https.*?\" rel=\"nofollow\"" );
        
        if ( m2 == null ) {
      
          println( "Impossible de récupérer les tweets." );
          
        } else {
      
          println( m2.length + " tweet(s) récupéré(s)." );
          
          tweets = new String[m2.length];
      
          for ( int i = 0; i < m.length; i++ ) {
            
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
    
    
