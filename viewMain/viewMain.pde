
    
    private ViewMenu menu; // Références sur les vues
    private ViewLoading loading;
    private ViewResults results;
    
    private PFont font; // Police d'affichage
    
    private Screen currentScreen = Screen.MENU; // Écran courant
    
    
    public void setup() {
     
      size( 800, 600 ); // Configuration fenêtre
      noCursor();
      
      menu = new ViewMenu(); // On instancie les vues
      loading = new ViewLoading();
      results = new ViewResults();
      
      font = createFont( "../data/apple.ttf", 16 ); // Charger la police
      textFont( font );
      
    }
    
    public void draw() {
      
      background( 0 ); // Effacer le contenu la fenêtre
       
      switch( currentScreen ) { // Afficher l'écran courant
        
        case MENU:
          menu.display();
          break;

        case LOADING:
          loading.display();
          break;

        case RESULTS:
          results.display();
          break;
          
      }
      
      strokeWeight( 1 );
      stroke( 60, 100 ); // Afficher les lignes sur l'écran
      for ( int i = 0; i < height; i += 4 )
        line( 0, i, width, i );
      
    }
    
    public void keyPressed() {
     
       switch( currentScreen ) { // Traiter les entrées clavier pour la vue courante
        
        case MENU:
          menu.input();
          break;

        case LOADING:
          loading.input();
          break;

        case RESULTS:
          results.input();
          break;
          
      }
      
    }
    
    
