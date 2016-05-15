

    final class ViewMenu {
        
        private ControllerMenu controller; // Référence sur le contrôleur du menu
       
        public ViewMenu() {
          controller = new ControllerMenu(); // On instancie le contrôleur du menu
        }
        
        public void display() {
          
          controller.update(); // On mets à jour le contrôleur à chaque tour de boucle
          
          image( controller.getLogoImage(), 100, 80 ); // Affichage du logo
          
          textAlign( LEFT, CENTER );
          fill( 220, 200, 255 );
          text( "Where do you wanna to go today ?", 100, 280 ); // Texte d'introduction
          
          text( controller.getInputTextToDisplay(), 100, 380 ); // Affichage de l'entrée clavier
          
          text( "Press q to escape", 100, 480 ); // Autre notice textuelle
          
        }
        
        public void input() {
          controller.input();
        }
        
        public void resetInput() {
          controller.resetInput();
        }
      
    }
    
    
