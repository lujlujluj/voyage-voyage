/**
 * Classe vue parente du modèle MVC
 * Elle implémente les foncitons display() et input() 
 * dont héritent toutes les vues filles. 
 */

abstract class View {        
        
        /**
         * affichage les données
         */
        abstract void display();
        
        /**
         * Récupération les entrées utilisateurs via le controleur dédié
         */
        abstract void input();

} 