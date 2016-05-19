/**
 * Gestion de l'écran de résultat
 */

    final class ViewResults extends View {
        
        private ControllerResults controller; // Référence sur le contrôleur de l'écran des résultats
        
        /**
         * Constructeur
         */
        public ViewResults() {
          controller = new ControllerResults(); // On instancie le contrôleur de l'écran des résultats
        }
        
        public void display() {
          
          controller.update(); // On mets à jour le contrôleur à chaque tour de boucle
          
          image( controller.getPictureToDisplay(), 125, 25 ); // On affiche l'image instagram courante
          
          noStroke(); // Effet d'affichage progressif par blocs
          fill( 0 );
          int k = 0;
          for ( int j = 25; j < 575; j += 15 ) {
            for ( int i = 125; i < 675; i += 10 ) {
              if ( k >= controller.getNbRectsToDisplay() )
                rect( i, j, 10, 15 );
              k++;
            }
          }
          
          fill( 220, 200, 255 ); // On affiche le tweet courant
          textAlign(LEFT, CENTER);
          text( controller.getCurrentTweet().substring( 0, controller.getNbCharsToDisplay() ), 50, 150, 700, 300 );
          
        }
        
        public void input() {
          controller.input();
        }
        
        /**
         * Chargement des données récupérées grâce au tag 
         * rentré par l'utilisateur
         * @param inputTag - # tapé par l'utilisateur 
         */
        public void loadDataForTag( String inputTag ) throws ParserException {
          controller.loadDataForTag( inputTag );
        }
        
        /**
         * Initialisation du controleur avec de nouvelles données
         */
        public void initWithNewData() {
          controller.initWithNewData();
        }
      
    }
    
    