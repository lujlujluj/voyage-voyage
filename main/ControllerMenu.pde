

    final class ControllerMenu {
      
      private String inputText; // Texte entré par l'utilisateur
      private PImage imageLogo, imageLogo2; // Image du logo
      private int frameCursor, frameRotor; // Compteur de frames pour le curseur de texte
      
      private final int MAX_INPUT = 20; // Taille maximale de l'entrée utilisateur
      private boolean inputError; // Doit-on afficher un message d'erreur ?
      
      public ControllerMenu() {
        
        inputText = "";
        imageLogo = loadImage( "../data/logo.png" ); // Charger les images du logo
        imageLogo2 = loadImage( "../data/logo2.png" );
        frameCursor = 0; // On met à 0 les compteur de frames
        frameRotor = 4;
        
        inputError = false; // Pas de message d'erreur au début

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
        
          ViewLoading loading = (ViewLoading) views[Screen.LOADING.ordinal()];
          
          loading.loadDataForTag( cleanInput( inputText ) ); // On lance le chargement des données
          currentScreen = Screen.LOADING; // On passe sur l'écran de chargement
          resetInput(); // On efface la saisie
          disableErrorMessage(); // On désactive le message d'erreur
          
        } else if ( keyCode == BACKSPACE ) {
          
          if ( inputText.length() > 0 ) // On supprime le dernier caractère
            inputText = inputText.substring( 0, inputText.length() - 1 ); 
          
        } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && inputText.length() < MAX_INPUT )
          inputText = inputText + key; // On ajoute la lettre à la chaine d'entrée

      }
        
      public void resetInput() {
        inputText = "";
      }
      
      public void enableErrorMessage() {
        inputError = true;
      }
      
      public void disableErrorMessage() {
        inputError = false;
      }
      
      public boolean displayErrorMessage() {
        return inputError;
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
      
      private String cleanInput( String input ) {
       
        String output = "";  
       
        for ( int i = 0; i < input.length(); i++ ) {
        
          if ( ( input.charAt(i) >= 'A' && input.charAt(i) <= 'Z' ) || ( input.charAt(i) >= 'a' && input.charAt(i) <= 'z' ) )
            output += input.charAt(i);
         
        }
       
        return output;
      }
      
    }
    
    
