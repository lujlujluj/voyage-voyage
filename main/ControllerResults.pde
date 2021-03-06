/**
 * Controleur des résultats  
 */

    final class ControllerResults {
      
      private ModelInstagramParser instagramParser; // Références sur les parseurs de données
      private ModelTwitterParser twitterParser;
      
      private PImage pictureToDisplay; // Pour l'affichage des images instagram
      private int nextPictureIndex;
      private int nbRectsToDisplay;
      
      private int tweetIndex; // Pour l'affichage des tweets
      private int nbCharsToDisplay;
      private int frame;
      
      /**
       * Constructeur
       */
      public ControllerResults() {
        
        instagramParser = new ModelInstagramParser(); // On instancie les parseurs
        twitterParser = new ModelTwitterParser();
        
        nextPictureIndex = 1; // On initialise les arguments pour l'affichage des images instagram
        nbRectsToDisplay = 0;
        
        tweetIndex = 0; // On initialise les arguments pour l'affichage des tweets
        nbCharsToDisplay = 0;
        frame = 0;
        
      }
      
      /**
       * Mise à jour des données 
       * Nombre de rectangles 
       * Nombre de caractères d'un tweet
       */
      public void update() {
        
        nbRectsToDisplay += 5; // Le nombre de blocs de l'images à afficher augmente dans le temps
        if ( nbRectsToDisplay > 1980 ) {
          
          nbRectsToDisplay = 0; // Lorsque l'image est affichée en entier, on en charge une nouvelle
          loadNewPicture();
        
        }
        
        frame++; // Le nombre de caractères du tweet à afficher augmente toutes les 8 frames
        if ( frame == 8 ) {
          
          nbCharsToDisplay++;
          if ( nbCharsToDisplay > getCurrentTweet().length() ) {
          
            nbCharsToDisplay = 0; // Lorsque le tweet est affiché en entier, on en charge un nouveau
            
            do {
              
              tweetIndex++;
              if ( tweetIndex > 10 )
                tweetIndex = 0;
              
            } while ( getCurrentTweet() == null );
            
            println( getCurrentTweet() );
            
          }
          
          frame = 0;
          
        }
        
      }
      
      /**
       * Gestion des entrées utilisateurs pendant
       * l'affichage des résultats
       * Touche Q pour quitter l'application
       */
      public void input() {
        
        if ( key == 'q' || key == 'Q' ) // La touche q permet de revenir au menu
           currentScreen = Screen.MENU;
        
      }
      
      /**
       * Chargement des données récupérées grâce au tag 
       * rentré par l'utilisateur
       * @param inputTag
       */
      public void loadDataForTag( String inputTag ) throws ParserException {
      
        instagramParser.loadNewPicturesForTag( inputTag ); // On charge des nouvelles données selon un hashtag
        twitterParser.loadNewTweetsForTag( inputTag );

      }
      
      /**
       * Initialisation avec de nouvelles données 
       * Image et tweet et chargement de l'image
       */      
      public void initWithNewData() {
        
        nextPictureIndex = 1; // On réinitialise l'affichage des images instagram
        nbRectsToDisplay = 0;
        
        tweetIndex = 0; // On réinitialise l'affichage des tweets
        nbCharsToDisplay = 0;
        frame = 0;
        
        loadNewPicture(); // On charge une nouvelle image instagram  
        
      }
      
      /**
       * Getter Image courante à afficher
       * @return pictureToDisplay
       */       
      public PImage getPictureToDisplay() {
         return pictureToDisplay;
      }
      
      /**
       * Getter nombre de rectangles à afficher
       * @return nbRectsToDisplay
       */
      public int getNbRectsToDisplay() {
        return nbRectsToDisplay;
      }
      
      /**
       * Getter tweet courant
       * @return twitterParser.getTweet( tweetIndex )
       */
      public String getCurrentTweet() {
         return twitterParser.getTweet( tweetIndex );
      }
      
      /**
       * Getter nombre de caractères à afficher
       * @return nbCharsToDisplay
       */      
      public int getNbCharsToDisplay() {
         return nbCharsToDisplay;
      }
      
      /**
       * Chargement de la prochaine image et 
       * application du sous-échantillonage
       */ 
      private void loadNewPicture() {
        
        String pictureURL = instagramParser.getPictureURL( nextPictureIndex ); // On demande au modèle l'URL de la prochaine image
        println( pictureURL );
        
        PImage tmp = loadImage( pictureURL, "jpg" ); // On charge l'image
        pictureToDisplay = new PImage( 600, 600 );
        pictureToDisplay.copy( tmp, 0, 0, tmp.width, tmp.height, 0, 0, 600, 600 );
        
        downsampling(); // On applique un effet de sous-échantillonnage
        pictureToDisplay.resize( 550, 550 );
        
        nextPictureIndex++; // On met à jour l'index de la prochaine image à charger
        if ( nextPictureIndex == 5 )
          nextPictureIndex = 6;
        if ( nextPictureIndex > 11 )
          nextPictureIndex = 1;
        
      }
      
      /**
       * Fonction de sous-echantillonage des images
       * Détails dans le dossier
       */      
      private void downsampling() {
  
        for ( int i = 0; i < 600; i += 5 ) { // On parcourt l'image par blocs de 5 x 8 pixels
      
          for ( int j = 0; j < 600; j += 8 ) {
      
            int firstPixel = i + 600 * j; // On calcule l'indice du premier pixel du bloc courant
            int sumRed = 0, sumGreen = 0, sumBlue = 0;
      
            for ( int k = firstPixel; k < firstPixel + 5; k++ ) { // On calcule la moyenne des couleurs du bloc
      
              for ( int l = 0; l < 8; l++ ) {
                
                sumRed += red( pictureToDisplay.pixels[k + l * 600] ); // Composante par composante
                sumGreen += green( pictureToDisplay.pixels[k + l * 600] );
                sumBlue += blue( pictureToDisplay.pixels[k + l * 600] );
                
              }
              
            }
            
            int areaColorRed = sumRed / 40;
            int areaColorGreen = sumGreen / 40;
            int areaColorBlue = sumBlue / 40;
            
            areaColorRed = areaColorRed * 100/255; // On applique une pondération pour changer la teinte de l'image
            areaColorGreen = areaColorGreen * 60/255;
            
            for ( int k = firstPixel; k < firstPixel + 5; k++ ) { // On compose la nouvelle image, sous-échantillonnée
      
              for ( int l = 0; l < 8; l++ ) 
                pictureToDisplay.pixels[k + l * 600] = color( areaColorRed, areaColorGreen, areaColorBlue );
              
            }
            
          }
          
        }
      
      }
           
    }
    
    