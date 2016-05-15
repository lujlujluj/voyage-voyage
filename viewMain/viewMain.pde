
    
    private ViewMenu menu; // Références sur les vues
    private ViewLoading loading;
    private ViewResults results;
    
    private PFont font; // Police d'affichage
    private float line1 = 200; // Paramètres bruit image
    private float line2 = 300;
    private float line3 = 500;
    
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
      
      stroke( 20, 60 ); // Afficher l'effet de bruit / scintillement
      strokeWeight( 10 );
      line( 0, line1, width, line1 );
      line( 0, line2, width, line2 );
      line( 0, line3, width, line3 );
      line1 -= 2;
      if ( line1 < 0 )
        line1 = height;
      line2 -= 4;
      if ( line2 < 0 )
        line2 = height;
      line3 -= 7;
      if ( line3 < 0 )
        line3 = height;
      
      strokeWeight( 1 ); // Afficher les lignes sur l'écran
      stroke( 60, 100 );
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
    
    
