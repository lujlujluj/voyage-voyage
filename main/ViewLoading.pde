/**
 * Gestion de l'écran de chargement (Vue)
 */

    final class ViewLoading extends View {
        
        private ControllerLoading controller; // Référence sur le contrôleur de l'écran de chargement
        
        /**
        * Constructeur
        */
        public ViewLoading() {
          controller = new ControllerLoading(); // On instancie le contrôleur de l'écran de chargement
        }
        
        public void display() {
          
          controller.update(); // On met à jour le contrôleur à chaque tour de boucle
          
          strokeWeight( 3 );
          pushMatrix();
          translate( width / 2, height / 2 ); // On se place au centre de l'écran
          
          for ( int i = 0; i < 20; i++ ) { // On affiche 2 x 20 lignes
            
            stroke( 250, 210, 255, i * 255 / 20 );
            line( controller.x1( i ), controller.y1( i ), controller.x2( i ), controller.y2( i ) );
            
            stroke( 200, 180, 255, i * 255 / 20 );
            line( controller.x2( i ), controller.y1( i ), controller.x1( i ), controller.y1( i ) );
            
          }
          
          popMatrix(); // On replace le repère à sa position initiale
          
          textAlign( CENTER, CENTER ); // Notice de chargement
          fill( 220, 200, 255 );
          text( "Loading...", 0, 0, width, height );
          
        }
        
        public void input() {
          controller.input();
        }
        
        /**
         * Chargement des données récupérées grâce au tag 
         * rentré par l'utilisateur
         * @param inputTag - # tapé par l'utilisateur 
         */
        public void loadDataForTag( String inputTag ) {
           controller.loadDataForTag( inputTag );
        }
      
    }
    
    