    
    
    private InstagramParser instagramParser;
    private TwitterParser twitterParser;
    private Graphics graphics;
    //private UserInput userinput;
    private ControllerMenu controllerMenu;
    private ControllerResults controllerResult;
    private Result result;
    private Menu menu;
    

    private PFont Apple = null;
    private String inputText = "";
    private int frameCursor = 0;
    
    public Boolean screen = true; //true -> menu screen  , false --> result screen
    
    public void setup() {
      
      size( 800, 600 );
      
      result = new Result();
      menu = new Menu();
      controllerResult = new ControllerResults();
      controllerMenu = new ControllerMenu();
      
      stroke( 60, 100 );
      noCursor();
      
      // Create font
      Apple = createFont("../ressources/Apple.ttf", 16);
      textFont(Apple);
      textAlign(LEFT, CENTER);  

    }
    
    public void update() {
      if (screen == false){
        controllerResult.update();
      }
     
      else{
        frameCursor++;
        if(frameCursor>32)
        frameCursor = 0;
      }
    }
     
    public void draw() {
      
      update();
      
      background( 0 );
      
      if (screen == true){
        menu.displayMenu();
      }
          
      else{
        result.displayResult();
      }
      
    }
    
    public void keyPressed() {
      if (screen == true){
        controllerMenu.textinput();
      } 
      else{
        controllerResult.textinput();
      }
    }
    
    