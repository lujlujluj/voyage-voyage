/**
 * Gestion de l'écran d'accueil (Vue)
 */

    final class ViewMenu extends View {
        
        private ControllerMenu controller; // Référence sur le contrôleur du menu
       
        /**
        * Constructeur
        */
        public ViewMenu() {
          controller = new ControllerMenu(); // On instancie le contrôleur du menu
        }
        
        public void display() {
          
          controller.update(); // On met à jour le contrôleur à chaque tour de boucle
          
          tint( 250, 230, 255 ); // Affichage du logo
          image( controller.getLogoImage(), 100, 80 );
          noTint();
          
          textAlign( LEFT, CENTER ); // Texte d'introduction
          fill( 220, 200, 255 );
          text( "Where do you wanna go today ?", 100, 280 );
          
          if ( controller.displayErrorMessage() ) { // Message d'erreur en cas de saisie invalide
          
            fill( 220, 20, 80 );
            textSize( 12 );
            text( "Destination inconnue, veuillez essayer de nouveau", 100, 320 );
            textSize( 16 );
            
          }
          
          fill( 220, 200, 255 );
          text( controller.getInputTextToDisplay(), 100, 380 ); // Affichage de l'entrée clavier
          
          text( "Hit Enter to begin. Press q to escape", 100, 480 ); // Autre notice textuelle
          
        }
        
        public void input() {
          controller.input();
        }
        
        
        /**
        * Effacer le mot clé rentré par l'utilisateur
        */
        public void resetInput() {
          controller.resetInput();
        }
        
        
       /**
        * Affiche du message d'erreur via le controleur 
        */
        public void enableErrorMessage() {
          controller.enableErrorMessage(); 
        }
      
    }
    
    