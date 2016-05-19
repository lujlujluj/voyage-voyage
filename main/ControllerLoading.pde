    
    
    final class ControllerLoading {
      
      private ModelYoutubeParser youtubeParser; // Références sur le parseur youtube
      
      float frameLines; // Compteur de frames pour les lignes animées
      
      public ControllerLoading() {
        
        frameLines = 0; // On met à 0 le compteur de frames
        
        youtubeParser = new ModelYoutubeParser(); // On instancie le parseur
        
      }
      
      public void update() {
        frameLines += 0.3; // Le compteur tourne
      }
        
      public void input() {
      
      }
        
      public void loadDataForTag( String inputTag ) {
        
        try {
          
          youtubeParser.loadNewSongForTag( inputTag ); // Charger un nouveau morçeau selon le hashtag entré par l'utilisateur
          //link( youtubeParser.getSongURL() ); // Jouer la musique
          
          new ThreadLoadData( inputTag ).start(); // Démarrer un nouveau thread pour charger les données distantes
          
        } catch ( ParserException e ) {
          currentScreen = Screen.MENU;
        }
       
      }
      
      public float x1( int indexOfLine ) {
        
        float t = frameLines + indexOfLine;
        return sin( t / 10 ) * 100 + sin( t / 5 ) * 20;
      }
      
      public float y1( int indexOfLine ) {
        
        float t = frameLines + indexOfLine;
        return cos( t / 10 ) * 100;
      }
      
      public float x2( int indexOfLine ) {
        
        float t = frameLines + indexOfLine;
        return sin( t / 10 ) * 300 + sin( t ) * 2;
      }
      
      public float y2( int indexOfLine ) {
        
        float t = frameLines + indexOfLine;
        return cos( t / 20 ) * 100 + cos( t / 12 ) * 20;
      }
           
    }
    
    
    final class ThreadLoadData extends Thread {
      
      String inputTag; // Hashtag à partir duquel charger les données
      
      public ThreadLoadData ( String inputTag ) {
        this.inputTag = inputTag;
      }
      
      public void run() {
        
        try {
          
          ViewResults results = (ViewResults) views[Screen.RESULTS.ordinal()];
          
          results.loadDataForTag( inputTag ); // On démarre le chargement des données
          
          results.initWithNewData(); // On prépare les résultats pour l'affichage
          
          currentScreen = Screen.RESULTS; // Le chargement est fini, on passe sur la vue des résultats
        
        } catch ( ParserException e ) {
          
          ViewMenu menu = (ViewMenu) views[Screen.MENU.ordinal()];
          
          menu.enableErrorMessage(); // On revient sur le menu et l'on affiche un message d'erreur à l'utilisateur
          currentScreen = Screen.MENU;
          
        }
      
      } 
      
    }
    
    
