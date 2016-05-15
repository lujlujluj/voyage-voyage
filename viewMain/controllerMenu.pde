

    final class ControllerMenu {
      
      private String inputText; // Texte entré par l'utilisateur
      private PImage imageLogo, imageLogo2; // Image du logo
      private int frameCursor, frameRotor; // Compteur de frames pour le curseur de texte
      
      public ControllerMenu() {
        
        inputText = "";
        imageLogo = loadImage( "../data/logo.png" ); // Charger les images du logo
        imageLogo2 = loadImage( "../data/logo2.png" );
        frameCursor = 0; // On met à 0 les compteur de frames
        frameRotor = 4;

      }
      
      public void update() {
        
        frameCursor++; // L'heure tourne
        if ( frameCursor >= 32 )
          frameCursor = 0;
          
        frameRotor++;
        if ( frameRotor >= 16 )
          frameRotor = 0;
        
      }
        
      public void input() {
        
        if ( keyCode == RETURN || keyCode == ENTER ) {
        
          loading.loadDataForTag( inputText ); // On lance le chargement des données
          currentScreen = Screen.LOADING; // On passe sur l'écran de chargement
          
        } else if ( keyCode == BACKSPACE ) {
          
          if ( inputText.length() > 0 ) // On supprime le dernier caractère
            inputText = inputText.substring( 0, inputText.length() - 1 ); 
          
        } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT)
          inputText = inputText + key; // On ajoute la lettre à la chaine d'entrée

      }
        
      public void resetInput() {
        inputText = "";
      }
      
      public PImage getLogoImage() {
        
        if ( frameRotor < 9 ) // Pour animer l'hélice de l'avion
          return imageLogo;
        else
          return imageLogo2;
        
      }
      
      public String getInputTextToDisplay() {
       
        if ( frameCursor < 16 ) // Le curseur clignote
          return inputText + "|";
        else
          return inputText;
        
      }
      
    }
    
    
