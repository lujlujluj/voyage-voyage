
    
    private ViewMenu menu; // Références sur les vues
    private ViewLoading loading;
    private ViewResults results;
    
    private PFont font; // Police d'affichage
private float line1 = height/2; // Paramètres bruit image
    private float line2 = height/2;
    private float line3 = height/2;
    
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
      
      stroke( 60, 60 );
      strokeWeight(10);
      line(0, line1, width, line1);
      line(0, line2+60, width, line2+60);
      line(0, line3+120, width, line3+120);
       line1 = line1 - 8;
       if (line1 < 0) { 
         line1 = height; 
       }
       line2 = line2 - 12;
       if (line2 < 0) { 
         line2 = height; 
       }
       line3 = line3 - 45;
       if (line3 < 0) { 
         line3 = height; 
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
    
    