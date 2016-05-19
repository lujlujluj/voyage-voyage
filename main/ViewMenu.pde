

    final class ViewMenu extends View {
        
        private ControllerMenu controller; // Référence sur le contrôleur du menu
       
        public ViewMenu() {
          controller = new ControllerMenu(); // On instancie le contrôleur du menu
        }
        
        public void display() {
          
          controller.update(); // On mets à jour le contrôleur à chaque tour de boucle
          
          tint( 250, 230, 255 ); // Affichage du logo
          image( controller.getLogoImage(), 100, 80 );
          noTint();
          
          textAlign( LEFT, CENTER ); // Texte d'introduction
          fill( 220, 200, 255 );
          text( "Where do you wanna go today ?", 100, 280 );
          
          text( controller.getInputTextToDisplay(), 100, 380 ); // Affichage de l'entrée clavier
          
          text( "Hit Enter to begin. Press q to escape", 100, 480 ); // Autre notice textuelle
          
        }
        
        public void input() {
          controller.input();
        }
        
        public void resetInput() {
          controller.resetInput();
        }
      
    }
    
    